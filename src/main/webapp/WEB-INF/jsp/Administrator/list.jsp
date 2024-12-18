<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/list.css">
</head>
<body>

<!-- 商品列表表格 -->
<table class="product-table">
    <thead>
    <tr>
        <th>ID</th>
        <th>名称</th>
        <th>价格</th>
        <th>描述</th>
        <th>图片</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="fruit" items="${fruits}">
        <tr>
            <td>${fruit.id}</td>
            <td>${fruit.name}</td>
            <td>${fruit.price}</td>
            <td>${fruit.description}</td>
          <td> <img src="${pageContext.request.contextPath}/static/images/${fruit.image}.jpg" alt="${fruit.name}"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 跳转到管理员页面按钮 -->
<div style="margin-top: 20px; text-align: center;">
    <button id="back-btn" onclick="window.location.href='/administrator/AdministratorPage'">返回管理员页面</button>
</div>

</body>
</html>