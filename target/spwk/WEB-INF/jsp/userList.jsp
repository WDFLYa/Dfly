<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
</head>
<body>

<h2>查询所有用户</h2>
<form action="/user/findAll" method="get">
    <input type="submit" value="查看所有用户"/>
</form>

<h2>用户列表</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>用户名</th>
        <th>密码</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.userName}</td>
            <td>${user.password}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2>添加新用户</h2>
<form action="/user/add" method="post">
    用户名: <input type="text" name="userName" required/><br/>
    密码: <input type="password" name="password" required/><br/>
    <input type="submit" value="添加用户"/>
</form>



</body>
</html>
