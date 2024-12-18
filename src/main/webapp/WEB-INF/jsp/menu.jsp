<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>导航栏</title>
    <!-- 引入外部 CSS 文件 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/menu.css">

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

<!-- 图片轮播区域 -->
<div  id="tv">
    <!-- 左箭头 -->


    <!-- 图片区域 -->
    <div id = "screen">
        <img src="${pageContext.request.contextPath}/static/images/menu3.png" >
        <img src="${pageContext.request.contextPath}/static/images/menu5.png" >
        <img src="${pageContext.request.contextPath}/static/images/menu2.png" >
        <img src="${pageContext.request.contextPath}/static/images/menu4.png" >
        <img src="${pageContext.request.contextPath}/static/images/menu1.png" >
    </div>


</div>
<!-- 卡片区域 -->
<!-- 卡片区域 -->
<div class="cards">
    <div class="card red">
        <p class="tip">点</p>
        <p class="second-text">Lorem Ipsum</p>
    </div>
    <div class="card blue">
        <p class="tip">我</p>
        <p class="second-text">Lorem Ipsum</p>
    </div>
    <div class="card green">
        <p class="tip">选</p>
        <p class="second-text">Lorem Ipsum</p>
    </div>
    <div class="card black">
        <p class="tip">购</p>
        <p class="second-text">Lorem Ipsum</p>
    </div>
    <div class="card yellow">
        <p class="tip">吧</p>
        <p class="second-text">Lorem Ipsum</p>
    </div>
</div>





</body>
</html>
