package nuc.edu.cn.wdf.controller;

import nuc.edu.cn.wdf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class wdfWalletController {

    @Autowired
    private UserService userService;
    @GetMapping("/walletPage")
    public String showWallet(Model model, HttpSession session) {
        // 获取当前用户 ID
        Integer userId = (Integer) session.getAttribute("userId");

        // 检查是否存在用户ID
        if (userId == null) {
            return "redirect:/user/loginPage";  // 如果用户未登录，重定向到登录页面
        }

        // 获取用户余额（假设有一个方法 userService.getMoneyById(userId)）
        double balance = userService.getMoneyById(userId);

        // 将余额信息传递给前端页面
        model.addAttribute("balance", balance);

        // 返回钱包页面视图
        return "/function/wallet";
    }
    @PostMapping("/submitRecharge")
    public String submitRecharge(@RequestParam(value = "amount", required = false) Double amount,
                                 @RequestParam(value = "dmount", required = false) Double dmount,
                                 HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        // 校验 userId 是否有效
        if (userId == null) {
            return "redirect:/user/loginPage";  // 如果没有登录，重定向到登录页面
        }

        // 获取当前用户的余额
        double currentBalance = userService.getMoneyById(userId);

        // 校验金额（充值金额必须大于0，扣款金额也必须大于0）
        if (amount != null && amount <= 0) {
            return "redirect:/user/walletPage?error=invalidAmount";  // 如果充值金额无效，重定向并附加错误信息
        }
        if (dmount != null && dmount <= 0) {
            return "redirect:/user/walletPage?error=invalidDmount";  // 如果扣款金额无效，重定向并附加错误信息
        }

        // 计算新的余额：充值或扣款
        double newBalance = currentBalance;

        // 如果传递了 amount，则执行充值操作
        if (amount != null) {
            newBalance += amount;  // 增加余额
        }

        // 如果传递了 dmount，则执行扣款操作
        if (dmount != null) {
            newBalance -= dmount;  // 减少余额
        }

        // 校验余额是否足够扣款
        if (dmount != null && newBalance < 0) {
            return "redirect:/user/walletPage?error=insufficientBalance";  // 如果余额不足，重定向并附加错误信息
        }

        // 更新用户余额
        userService.updateMoneyById(userId, newBalance);

        // 重定向到钱包页面
        return "redirect:/user/walletPage";
    }

}
