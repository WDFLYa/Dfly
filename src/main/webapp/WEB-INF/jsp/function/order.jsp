<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2024/11/20
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单历史</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/order.css">
</head>
<body>


<!-- 导航栏 -->
<div class="navbar flex justify-between bg-purple-500 p-4 rounded-xl">
    <a href="/user/menuPage" class="nav-item">首页</a>
    <a href="/user/shopPage" class="nav-item">商城</a>
    <a href="/user/cartPage" class="nav-item">购物车</a>
    <a href="/user/orderPage" class="nav-item">订单</a>
    <a href="/user/walletPage" class="nav-item">钱包</a>
    <a href="/user/userPage" class="nav-item">用户</a>
</div>
<header>
    <h1>我的订单历史</h1>
</header>
<section class="order-list">
    <c:forEach var="order" items="${orders}">
        <div class="order-item">
            <div class="order-header">
                <span class="order-date">${order.createTime}</span>
                <span class="order-details">${order.orderDetails}</span>
                <span class="order-total">总金额：￥${order.totalAmount}</span>
            </div>
            <div class="order-details">
                <!-- 订单详细信息可以在这里显示 -->
            </div>
        </div>
    </c:forEach>
</section>


</body>
</html>

