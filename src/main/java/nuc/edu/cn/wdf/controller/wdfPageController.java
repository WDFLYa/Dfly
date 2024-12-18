package nuc.edu.cn.wdf.controller;

import nuc.edu.cn.wdf.service.CartService;
import nuc.edu.cn.wdf.service.FruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user")
public class wdfPageController {
    @Autowired
    private CartService cartService;

    @Autowired
    private FruitService fruitService;  // 注入 FruitService 用于获取水果的详细信息

    // 显示注册页面
    @RequestMapping("/registerPage")
    public String showRegisterPage() {
        return "register"; // 返回注册页面
    }

    @RequestMapping("/loginPage")
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping("/listPage")
    public String showlist() {
        return "list";  // 显示用户列表页面
    }

    @RequestMapping("/menuPage")
    public String showmenu() {
        return "menu";
    }

    // 显示水果商店页面



}
