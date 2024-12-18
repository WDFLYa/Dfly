package nuc.edu.cn.wdf.controller;

import nuc.edu.cn.wdf.pojo.Cart;
import nuc.edu.cn.wdf.pojo.Order;
import nuc.edu.cn.wdf.service.CartService;
import nuc.edu.cn.wdf.service.OrderService;
import nuc.edu.cn.wdf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class wdfCartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    // 显示购物车页面
    @GetMapping("/cartPage")
    public String listCarts(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        // 查询购物车数据
        List<Cart> carts = cartService.getCartByUserId(userId);
        model.addAttribute("carts", carts);  // 将购物车数据添加到模型中
        return "function/cart";  // 返回购物车列表页面
    }

    // 更新购物车数量 (AJAX 方式)
    @PostMapping("/updatecart")
    @ResponseBody
    public Map<String, Object> updateCart(
            @RequestParam int cartId,
            @RequestParam(required = false) Integer Quantity,
            @RequestParam(required = false) String action) {

        // 根据操作增减数量
        if ("increment".equals(action)) {
            Quantity++;
        } else if ("decrement".equals(action)) {
            Quantity--;
        }

        // 进行数量更新
        cartService.updateQuantity(cartId, Quantity);

        // 构建响应数据
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("cartId", cartId);
        response.put("newQuantity", Quantity);

        return response;  // 返回更新后的数量信息
    }

    @PostMapping("/checkout")
    public ResponseEntity<Map<String, Object>> checkout(@RequestBody Map<String, Object> requestData,
                                                        HttpSession session) {
        // 获取购物车 ID 列表（转换成 List<Long>）
        List<String> cartIdsString = (List<String>) requestData.get("cartIds");
        List<Long> cartIds = cartIdsString.stream()
                .map(Long::valueOf)  // 将 String 转换为 Long
                .collect(Collectors.toList());

        // 获取总金额
        Object totalAmountObj = requestData.get("totalAmount");
        double totalAmount = Double.valueOf(totalAmountObj.toString());

        // 获取当前用户 ID
        Integer userId = (Integer) session.getAttribute("userId");

        // 获取用户余额
        double balance = userService.getMoneyById(userId);

        Map<String, Object> response = new HashMap<>();

        // 检查用户余额是否足够
        if (balance >= totalAmount) {


            List<Cart> cartList = cartService.getCartByUserId(userId);

            // 使用 StringBuilder 来拼接所有的水果名称
            StringBuilder orderDetails = new StringBuilder();

            for (Cart cart : cartList) {
                // 获取每个 cart 的名称并追加到 orderDetails
                orderDetails.append(cart.getName()).append(", ");

            }

// 如果需要去掉最后一个 ", "（逗号和空格），可以使用下面这行代码：
            if (orderDetails.length() > 0) {
                orderDetails.setLength(orderDetails.length() - 2);  // 去掉最后的 ", "
            }
            System.out.println(orderDetails.toString());
            System.out.println(userId);
            System.out.println(totalAmount);
            Order order = new Order(orderDetails.toString(),totalAmount,userId);
            System.out.println(order.toString());
            orderService.createOrder(order);
            // 扣除余额
            userService.updateMoneyById(userId, balance - totalAmount);

            // 清空用户购物车中已购买的商品
            for (Long cartId : cartIds) {
                // 移除购物车中的每个商品
                cartService.removeCart(Math.toIntExact(cartId));
            }

            response.put("success", true);
            response.put("message", "购买成功！");
            return ResponseEntity.ok(response);
        } else {
            response.put("success", false);
            response.put("message", "余额不足，无法完成支付");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response); // 返回 400 错误
        }
    }






}
