package nuc.edu.cn.wdf.controller;

import nuc.edu.cn.wdf.pojo.User;
import nuc.edu.cn.wdf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class wdfUserController {

    @Autowired
    private UserService userService;


    // 处理注册请求
    @PostMapping("/register")
    public String registerUser(@RequestParam String userName, @RequestParam String password) {


        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);  // 你可以在此加密密码（例如使用 BCrypt）

        userService.addUser(user);  // 假设 addUser 是用来保存用户的 service 方法

        return "redirect:/user/loginPage"; // 注册成功后重定向到用户列表页面
    }
    @PostMapping("/login")
    public String loginUser(@RequestParam String userName, @RequestParam String password, Model model, HttpSession session) {
        // 根据用户名查询用户
        User user = userService.findUserByUserName(userName);

        // 如果账号是 wdf 且密码是 666，进入管理员页面
        if ("wdf".equals(userName) && "666".equals(password)) {
            // 管理员登录成功，重定向到管理员管理页面
            session.setAttribute("userId", "admin");
            return "redirect:/administrator/AdministratorPage";
        }

        // 如果用户存在且密码匹配
        if (user == null) {
            // 用户不存在
            model.addAttribute("error", "该用户不存在");
            return "login";
        } else if (user.getPassword() == null || !user.getPassword().equals(password)) {
            // 密码不正确
            model.addAttribute("error", "密码错误");
            return "login";
        } else {
            // 登录成功，重定向到用户列表页面
            session.setAttribute("userId", user.getId());
            return "redirect:/user/menuPage";
        }
    }



    @GetMapping("/userPage")
    public String showUser(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");

        User user = userService.findUserByUserId(userId);
        model.addAttribute(user);
        return "function/user";
    }

    @PostMapping("/updateuser")
    public String updateuser(@RequestParam(value = "username", required = false) String username,
                             @RequestParam(value = "password", required = false) String password,
                             HttpSession session){
        Integer userId = (Integer) session.getAttribute("userId");
       userService.updateuserById(userId,username,password);
        return "redirect:/user/userPage";
    }
}
