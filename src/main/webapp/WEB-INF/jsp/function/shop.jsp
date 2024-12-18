<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>导航栏</title>
    <!-- 引入外部 CSS 文件 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/shop.css">
</head>
<body>

<!-- 导航栏 -->
<div class="navbar flex justify-between bg-purple-500 p-4 rounded-xl">
    <a href="/user/menuPage" class="nav-item">首页</a>
    <a href="/user/shopPage" class="nav-item">商城</a>
    <a href="/user/cartPage" class="nav-item">购物车</a>
    <a href="/user/orderPage" class="nav-item">订单</a>
    <a href="/user/walletPage" class="nav-item">钱包</a>
    <a href="/user/cartPage" class="nav-item">用户</a>


    <form action="/user/shopPage" method="POST">
    <div class="input-wrapper">
        <button class="icon">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" height="25px" width="25px">
                <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#fff" d="M11.5 21C16.7467 21 21 16.7467 21 11.5C21 6.25329 16.7467 2 11.5 2C6.25329 2 2 6.25329 2 11.5C2 16.7467 6.25329 21 11.5 21Z"></path>
                <path stroke-linejoin="round" stroke-linecap="round" stroke-width="1.5" stroke="#fff" d="M22 22L20 20"></path>
            </svg>
        </button>
        <input placeholder="search.." class="input" name="keyword" type="text">
    </div>
    </form>
</div>

<dialog id="messageDialog">
    <c:if test="${not empty message}">
        <p>${message}</p>
        <button onclick="closeDialog()">好的</button>
    </c:if>
</dialog>

<!-- 商品展示区 -->
<div class="product-container">
    <c:forEach var="fruit" items="${fruits}">
        <div class="product-item">
            <!-- 使用商品数据填充 -->
            <img src="${pageContext.request.contextPath}/static/images/${fruit.image}.jpg" alt="${fruit.name}">
            <p class="name">${fruit.name}</p>
            <p class="description">${fruit.description}</p>
            <div class="product-footer">
               <span class="price">

                 <span class="currency">￥</span>${fruit.price}
                </span>

                <form action="/user/addcart" method="POST">
                    <input type="hidden" name="fruitId" value="${fruit.id}">
                    <button type="submit" class="cart-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </form>

            </div>
        </div>
    </c:forEach>
</div>

<!-- JavaScript -->
<script>
    // 打开弹窗的函数
    function showMessageDialog() {
        var dialog = document.getElementById('messageDialog');
        dialog.showModal(); // 显示弹窗
    }

    // 关闭弹窗的函数
    function closeDialog() {
        var dialog = document.getElementById('messageDialog');
        dialog.close(); // 关闭弹窗
    }

    // 页面加载时检查是否有 message，并在有消息时显示弹窗
    window.onload = function() {
        var message = '${message}'; // 获取 message 变量
        var dialog = document.getElementById('messageDialog');

        // 如果 message 存在，显示弹窗
        if (message) {
            dialog.showModal(); // 显示弹窗
        }
    };
    // 获取导航栏元素
    const navbar = document.querySelector('.navbar');

    // 记录上一次滚动的位置
    let lastScrollTop = 0;

    // 监听滚动事件，控制导航栏的显示与隐藏
    window.addEventListener('scroll', function() {
        let currentScroll = window.pageYOffset || document.documentElement.scrollTop;

        // 如果向下滚动并且滚动超过导航栏的高度，隐藏导航栏
        if (currentScroll > lastScrollTop && currentScroll > navbar.offsetHeight) {
            navbar.classList.add('hidden');
        } else {
            navbar.classList.remove('hidden');
        }

        lastScrollTop = currentScroll <= 0 ? 0 : currentScroll; // 防止负值
    });

    // 鼠标进入导航栏区域时，确保导航栏显示
    navbar.addEventListener('mouseenter', function() {
        navbar.classList.remove('hidden');  // 强制显示导航栏
    });

    // 鼠标离开导航栏区域时，判断是否需要隐藏导航栏
    navbar.addEventListener('mouseleave', function() {
        let currentScroll = window.pageYOffset || document.documentElement.scrollTop;
        if (currentScroll > navbar.offsetHeight) {
            navbar.classList.add('hidden');  // 滚动后鼠标离开才隐藏导航栏
        }
    });
</script>
</body>
</html>