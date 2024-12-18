<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <!-- 确保charset为UTF-8 -->
    <meta charset="UTF-8">
    <title>用户管理</title>
    <!-- 使用 c:url 生成正确的 CSS 文件路径 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<!-- 页面内容 -->
<form class="form">
    <div class="title">Welcome,<br><span>sign up to continue</span></div>

    <!-- 注册表单 -->
    <h2>注册新用户</h2>
    <form action="/user/add" method="post">
        <label for="userName">用户名:</label>
        <input class="input" type="text" name="userName" id="userName" placeholder="请输入用户名" required><br/>

        <label for="password">密码:</label>
        <input class="input" type="password" name="password" id="password" placeholder="请输入密码" required><br/>

        <input class="button-confirm" type="submit" value="注册">
    </form>

</form>

</body>
</html>
