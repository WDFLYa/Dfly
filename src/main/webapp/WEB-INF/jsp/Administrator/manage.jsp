<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>管理员主页面</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/manage.css">
  <style>
    /* 隐藏文件上传框，只显示按钮 */
    #fileInput {
      display: none;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>水果管理系统 - 管理员主页面</h1>

  <div class="section">
    <h2>请选择操作</h2>
    <ul>
      <li><a href="${pageContext.request.contextPath}/administrator/AddFruitPage">添加水果</a></li>
      <li><a href="${pageContext.request.contextPath}/administrator/DeleteFruitPage">删除水果</a></li>
      <li><a href="${pageContext.request.contextPath}/administrator/UpdateFruitPage">修改水果</a></li>
      <li><a href="${pageContext.request.contextPath}/administrator/ListFruitPage">查询水果</a></li>
      <li><a href="${pageContext.request.contextPath}/administrator/uploadFruitPage">上传水果图片</a></li>


    </ul>
  </div>



</div>
</body>
</html>
