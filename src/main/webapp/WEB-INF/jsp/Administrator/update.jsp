<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/list.css">
</head>
<body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/list.css">
</head>
<body>


        <table class="product-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>名称</th>
                <th>价格</th>
                <th>描述</th>
                <th>图片</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="fruit" items="${fruits}">

            <tr>
                <form action="/administrator/update" method="post">
                <td><input type="hidden" name="id" value="${fruit.id}">${fruit.id}</td>
                <td><input type="text" name="name" value="${fruit.name}" /></td>
                <td><input type="text" name="price" value="${fruit.price}" /></td>
                <td><input type="text" name="description" value="${fruit.description}" /></td>
                <td><input type="text" name="image" value="${fruit.image}" /></td>
                <td><button type="submit">确认修改</button></td>
                </form>
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
