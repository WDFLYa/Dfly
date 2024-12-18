package nuc.edu.cn.wdf.controller;


import nuc.edu.cn.wdf.pojo.Order;
import nuc.edu.cn.wdf.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class wdfOrderController {
    @Autowired
    private OrderService orderService;
    @RequestMapping("/orderPage")
    public String orderpage(Model model, HttpSession session) {

        Integer userId = (Integer) session.getAttribute("userId");
        // 检查是否存在用户ID
        if (userId == null) {
            return "redirect:/user/loginPage";  // 如果用户未登录，重定向到登录页面
        }
        List<Order> orders = orderService.findByUserId(userId);
        System.out.println("Items: " + orders);
        model.addAttribute("orders",orders);
        return "function/order";
    }
}
