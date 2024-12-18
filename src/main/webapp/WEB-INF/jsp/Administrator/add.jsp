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
        <th>名称</th>
        <th>价格</th>
        <th>描述</th>
        <th>图片</th>
        <th>操作</th> <!-- 添加操作列 -->
    </tr>
    </thead>
    <tbody>
    <tr>
        <form action="/administrator/add" method="post">
            <td><input type="text" name="name" required /></td>
            <td><input type="number" name="price" step="0.01" required /></td>
            <td><input type="text" name="description" required /></td>
            <td><input type="text" name="image" required /></td>
            <td><button type="submit">添加</button></td>
        </form>
    </tr>
    </tbody>
</table>

<!-- 跳转到管理员页面按钮 -->
<div style="margin-top: 20px; text-align: center;">
    <button id="back-btn" onclick="window.location.href='/administrator/AdministratorPage'">返回管理员页面</button>
</div>

</body>
</html>
