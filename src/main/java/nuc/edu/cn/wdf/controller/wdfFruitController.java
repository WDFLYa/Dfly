package nuc.edu.cn.wdf.controller;

import nuc.edu.cn.wdf.pojo.Cart;
import nuc.edu.cn.wdf.pojo.Fruit;
import nuc.edu.cn.wdf.service.CartService;
import nuc.edu.cn.wdf.service.FruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class wdfFruitController {
    @Autowired
    private FruitService fruitService;
    @Autowired
    private CartService cartService;

    // 显示所有水果的页面
    @RequestMapping("/shopPage")
    public String showShopPage(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<Fruit> fruits;

        if (keyword != null && !keyword.trim().isEmpty()) {
            // 如果关键词存在且不为空，执行关键词搜索
            fruits = fruitService.findFruitByKeyword(keyword);
        } else {
            // 如果没有关键词，获取所有水果
            fruits = fruitService.findAllFruits();
        }

        // 将水果数据传递到前端
        model.addAttribute("fruits", fruits);

        // 返回商店页面
        return "function/shop";
    }
    @PostMapping("/addcart")
    public String addCart(@RequestParam int fruitId, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            // 如果用户未登录，重定向到登录页面
            return "redirect:/user/loginPage";
        }

        // 查询购物车中是否已有该商品
        int count = cartService.countCartItem(userId, fruitId);
        if (count > 0) {
            redirectAttributes.addFlashAttribute("message", "该商品已在购物车中！");
        } else {
            Cart cart = new Cart();
            cart.setUserId(userId);
            cart.setFruitId(fruitId);
            cart.setQuantity(1);
            cartService.addCart(cart);
            redirectAttributes.addFlashAttribute("message", "商品成功添加到购物车！");
        }

        // 重定向到商店页面
        return "redirect:/user/shopPage";
    }

}


