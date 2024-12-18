<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <script type="text/javascript">
        // 弹出提示框并清除密码和确认密码
        function showError(message) {
            // 弹出提示框
            alert(message);
            // 清除密码和确认密码输入框内容
            document.getElementById('password').value = '';
            document.getElementById('confirmpassword').value = '';
        }
    </script>
</head>
<body>

<form class="form" action="/user/register" method="post" onsubmit="return validateForm()">
    <div class="title">Welcome,<br><span>sign up to continue</span></div>

    <h2 style="margin-left: 150px;">注册新用户</h2>

    <label for="userName">用户名:</label>
    <input class="input" type="text" name="userName" id="userName" placeholder="请输入用户名" required>

    <label for="password">密码:</label>
    <input class="input" type="password" name="password" id="password" placeholder="请输入密码" required>

    <label for="confirmpassword">确认密码:</label>
    <input class="input" type="password" name="confirmpassword" id="confirmpassword" placeholder="请确认密码" required>

    <!-- 在确认密码下方显示错误信息 -->
    <c:if test="${not empty error}">
        <div style="color: red; font-size: 12px; margin-top: 5px;">
                ${error}
        </div>
    </c:if>

    <input class="button-confirm" type="submit" value="注册">

    <div class="login-link">
        已有账号？<a href="${pageContext.request.contextPath}/user/loginPage">去登录</a>
    </div>
</form>

<script type="text/javascript">

    // 验证表单
    function validateForm() {
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmpassword').value;

        if (password !== confirmPassword) {
            showError('两次密码输入不一致，请重新输入！');
            return false; // 阻止表单提交
        }

        return true; // 如果密码一致，允许表单提交
    }
</script>

</body>