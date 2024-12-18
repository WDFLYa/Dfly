<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cart.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<!-- 购物车内容区域 -->
<c:forEach var="cart" items="${carts}">
    <div id="cart-item-${cart.id}" class="cart-container" data-cart-id="${cart.id}" data-price="${cart.price}">
        <div class="cart-item">
            <!-- 左侧选择框 -->
            <label class="container">
                <input type="checkbox" class="cart-checkbox" checked="checked">
                <div class="checkmark"></div>
            </label>

            <!-- 商品图片 -->
            <img class="product-image" src="${pageContext.request.contextPath}/static/images/${cart.image}.jpg" alt="商品图片">

            <!-- 商品信息 -->
            <div class="product-info">
                <div class="product-title">${cart.name}</div>
                <div class="product-desc">${cart.description}</div>
                <div class="product-price" id="price-${cart.id}">¥${cart.price * cart.quantity}</div>
            </div>

            <!-- 数量选择框 -->
            <div class="quantity-container">
                <form id="cart-form-${cart.id}" class="cart-form" data-cart-id="${cart.id}">
                    <input type="hidden" name="cartId" value="${cart.id}">
                    <button type="button" name="action" value="decrement" class="quantity-btn" onclick="updateQuantity(${cart.id}, 'decrement')">-</button>
                    <input type="number" name="Quantity" value="${cart.quantity}" class="quantity-input" min="1" onchange="updateQuantity(${cart.id}, 'update', this.value)">
                    <button type="button" name="action" value="increment" class="quantity-btn" onclick="updateQuantity(${cart.id}, 'increment')">+</button>
                </form>
            </div>
        </div>
    </div>
</c:forEach>


<div class="footer-bar">
    <label class="container">
        <input type="checkbox" id="selectAll" checked="checked">
        <div class="checkmark"></div>
    </label>
    <span class="select-text">全选</span>
    <div class="info">
        <div class="total">合计: ¥6469.00</div>
    </div>
    <button class="checkout-btn">领券结算</button>
</div>
<!-- 弹出对话框 -->
<dialog id="buyDialog">
    <div class="dialog-content">
        <p>确认购买吗？</p>
        <p id="dialog-total"></p>
        <button id="confirm-buy" class="btn">确认</button>
        <button id="cancel-buy" class="btn">取消</button>
    </div>
</dialog>
<script>
    // 更新购物车数量的函数
    // 更新购物车数量的函数
    function updateQuantity(cartId, action, newQuantity) {
        const form = $('#cart-form-' + cartId);
        const quantityInput = form.find('input[name="Quantity"]');
        const decrementBtn = form.find('button[name="action"][value="decrement"]');
        const incrementBtn = form.find('button[name="action"][value="increment"]');

        if (action === 'increment') {
            newQuantity = parseInt(quantityInput.val()) + 1;
        } else if (action === 'decrement') {
            newQuantity = parseInt(quantityInput.val()) - 1;
        } else if (action === 'update') {
            newQuantity = parseInt(newQuantity);
        }

        if (newQuantity < 1) {
            return;
        }

        // 更新输入框的数量
        quantityInput.val(newQuantity);

        const pricePerItem = parseFloat(form.closest('.cart-container').data('price'));

        $.ajax({
            url: '/user/updatecart',
            type: 'POST',
            data: { cartId: cartId, Quantity: newQuantity, action: action },
            success: function(response) {
                if (newQuantity <= 1) {
                    decrementBtn.prop('disabled', true);
                } else {
                    decrementBtn.prop('disabled', false);
                }

                const totalPrice = pricePerItem * newQuantity;
                const productPriceElement = $('#price-' + cartId);
                productPriceElement.text('¥' + totalPrice.toFixed(2));

                // 更新总金额
                updateTotal();
            },
            error: function(xhr, status, error) {
                alert('Error updating cart');
            }
        });
    }


    // 全选/取消全选功能
    $('#selectAll').change(function() {
        const isChecked = $(this).prop('checked');
        $('.cart-checkbox').prop('checked', isChecked);
        updateTotal();
    });

    // 单个商品选择框的变化
    $('.cart-checkbox').change(function() {
        const allChecked = $('.cart-checkbox').length === $('.cart-checkbox:checked').length;
        $('#selectAll').prop('checked', allChecked);
        updateTotal();
    });

    // 更新合计金额
    function updateTotal() {
        let total = 0;
        $('.cart-checkbox:checked').each(function() {
            const price = parseFloat($(this).closest('.cart-container').data('price'));
            const quantity = parseInt($(this).closest('.cart-container').find('.quantity-input').val());
            total += price * quantity;
        });
        $('.total').text('合计: ¥' + total.toFixed(2));
    }

    // 页面加载时初始化合计金额
    updateTotal();




/*结算*/

    // 领券结算按钮点击事件
    $('.checkout-btn').click(function() {
        // 获取选中的购物车项ID和总金额
        const selectedItems = [];
        const totalAmount = parseFloat($('.total').text().replace('合计: ¥', ''));

        $('.cart-checkbox:checked').each(function() {
            const cartId = $(this).closest('.cart-container').data('cart-id'); // 获取购物车ID
            selectedItems.push(cartId);
        });

        // 如果没有选中任何商品，提示用户
        if (selectedItems.length === 0) {
            alert("请选择至少一个商品！");
            return;
        }

        // 获取弹出框元素
        const buyDialog = document.getElementById('buyDialog');
        $('#dialog-total').text('总金额: ¥' + totalAmount.toFixed(2));  // 显示总金额
        buyDialog.showModal(); // 显示 dialog
    });

    // 确认购买按钮点击事件
    $('#confirm-buy').click(function() {
        // 收集选中的购物车ID和总金额
        const selectedItems = [];
        $('.cart-checkbox:checked').each(function() {
            const cartId = $(this).closest('.cart-container').data('cart-id'); // 获取购物车ID
            selectedItems.push(cartId.toString()); // 确保 cartId 是字符串
        });

        const totalAmount = parseFloat($('.total').text().replace('合计: ¥', ''));

        // 提交数据（例如通过POST提交）
        $.ajax({
            url: '/user/checkout',  // 后端接收结算请求的URL
            type: 'POST',
            contentType: 'application/json', // 设置请求头为 JSON
            data: JSON.stringify({
                cartIds: selectedItems,
                totalAmount: totalAmount
            }),
            success: function(response) {
                // 成功后关闭对话框，并跳转到订单页面
                alert('购买成功！');
                const buyDialog = document.getElementById('buyDialog');
                buyDialog.close(); // 关闭 dialog
                window.location.href = '/user/cartPage'; // 跳转到订单页面
            },
            error: function(xhr, status, error) {
                alert('余额不足，请充值。');
                buyDialog.close();
            }
        });
    });

    // 取消按钮点击事件
    $('#cancel-buy').click(function() {
        const buyDialog = document.getElementById('buyDialog');
        buyDialog.close(); // 关闭 dialog
    });

</script>

<style>
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    input[type="number"] {
        -moz-appearance: textfield;
    }
</style>
</body>
</html>
