<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2024/11/17
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 添加水果表单 -->
<div class="add-fruit-container">
  <h2>添加水果</h2>
  <form action="${pageContext.request.contextPath}/user/manage" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="name">水果名称:</label>
      <input type="text" id="name" name="name" required />
    </div>
    <div class="form-group">
      <label for="price">水果价格:</label>
      <input type="number" id="price" name="price" required step="0.01" />
    </div>
    <div class="form-group">
      <label for="description">水果描述:</label>
      <textarea id="description" name="description" required></textarea>
    </div>
    <div class="form-group">
      <label for="image">水果图片:</label>
      <input type="file" id="image" name="image" accept="image/*" required />
    </div>
    <button type="submit">添加水果</button>
  </form>
</div>
</body>
</html>
