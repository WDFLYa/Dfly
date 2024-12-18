<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">

</head>
<body>
<form class="form" action="/user/login" method="post" onsubmit="return validateForm()">
    <div class="title">Welcome,<br><span>sign up to continue</span></div>

    <h2 style="margin-left: 150px;">欢迎登录</h2>

    <label for="userName">用户名:</label>
    <input class="input" type="text" name="userName" id="userName" placeholder="请输入用户名" required value="${userName}">

    <label for="password">密码:</label>
    <input class="input" type="password" name="password" id="password" placeholder="请输入密码" required>

    <input class="button-confirm" type="submit" value="登录">

    <div class="login-link">
        还没有账号？<a href="${pageContext.request.contextPath}/user/registerPage">去注册</a>
    </div>

    <!-- 错误信息 -->
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
</form>


</body>
</html>
