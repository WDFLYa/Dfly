<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>用户界面</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/user.css">
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

<div class="container">
  <h2>账号设置</h2>
  <form action="/user/updateuser" method="POST">
    <div class="form-group">

      <label for="username">账号:</label>
      <input type="text" id="username" name="username" value=${user.userName} required >
    </div>
    <div class="form-group">
      <label for="password">密码:</label>
      <input type="text" id="password" name="password" value=${user.password} required>
    </div>
    <div class="buttons">

      <button type="submit" class="btn-confirm">确认修改</button>

      <a href="loginPage" class="btn-logout">退出登录</a>
    </div>
  </form>
</div>
</body>
</html>
