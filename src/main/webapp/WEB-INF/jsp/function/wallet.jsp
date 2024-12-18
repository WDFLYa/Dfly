<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>钱包页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/wallet.css">
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
<div class="wallet-container">
    <div class="wallet-card">
        <h2>我的钱包</h2>
        <p>当前余额: <span id="balance-amount">${balance}</span></p>
        <button id="recharge-btn">充值</button>
        <button id="withdraw-btn">提现</button>
    </div>
</div>

<!-- 充值对话框 -->
<div id="recharge-dialog" class="dialog">
    <div class="dialog-content">
        <h3>请输入充值金额</h3>
        <!-- 创建表单 -->
        <form action="/user/submitRecharge" method="POST">
            <div class="input-container">
                <input type="number" id="recharge-amount" name="amount" placeholder="请输入充值金额" required />
            </div>
            <div class="dialog-actions">
                <button type="submit" id="recharge-confirm" class="dialog-btn confirm-btn">确定</button>
                <button type="button" id="recharge-cancel" class="dialog-btn cancel-btn" onclick="closeDialog()">取消</button>
            </div>
        </form>
    </div>
</div>
<!-- 提现对话框 -->
<div id="withdraw-dialog" class="dialog">
    <div class="dialog-content">
        <h3>请输入提现金额</h3>

        <form action="/user/submitRecharge" method="POST">
            <div class="input-container">
                <input type="number" id="withdraw-amount" name="dmount" placeholder="提现金额" required />
            </div>
        <div class="dialog-actions">
            <button id="withdraw-confirm" class="dialog-btn confirm-btn">确定</button>
            <button id="withdraw-cancel" class="dialog-btn cancel-btn">取消</button>
        </div>
        </form>
    </div>
</div>

<script>
    // 获取元素
    const rechargeBtn = document.getElementById('recharge-btn');  // 修改为正确的 ID
    const withdrawBtn = document.getElementById('withdraw-btn');
    const rechargeDialog = document.getElementById('recharge-dialog');
    const withdrawDialog = document.getElementById('withdraw-dialog');
    const cancelBtn = document.querySelectorAll('.dialog-btn.cancel-btn');

    // 打开对话框
    function openDialog(dialog) {
        dialog.style.display = 'flex';
    }

    // 关闭对话框
    function closeDialog(dialog) {
        dialog.style.display = 'none';
    }

    // 充值按钮点击事件
    rechargeBtn.addEventListener('click', function() {
        openDialog(rechargeDialog);
    });

    // 提现按钮点击事件
    withdrawBtn.addEventListener('click', function() {
        openDialog(withdrawDialog);
    });

    // 取消按钮点击事件
    cancelBtn.forEach(btn => {
        btn.addEventListener('click', function() {
            closeDialog(rechargeDialog);
            closeDialog(withdrawDialog);
        });
    });
</script>

</body>
</html>
