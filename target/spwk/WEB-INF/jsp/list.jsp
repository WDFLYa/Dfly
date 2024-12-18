<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2024/11/15
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>查询所有用户</h2>
<form action="/user/list" method="get">
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

</body>
</html>
