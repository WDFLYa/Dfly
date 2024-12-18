<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2024/12/14
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/upload.css">

</head>
<body>
<div class="upload-container">
    <h2>文件上传</h2>
    <form method="post" action="/administrator/image" enctype="multipart/form-data">
        <input type="file" name="photo" id="photo" onchange="showImagePreview(event)" />
        <input type="submit" value="提交" />
    </form>
    <!-- 图片预览区域 -->
    <img id="imagePreview" class="image-preview" />
    <p class="info-text">请上传您的图片文件，支持JPG格式。</p>
</div>

<script>
    function showImagePreview(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            const imagePreview = document.getElementById("imagePreview");
            imagePreview.src = e.target.result;
            imagePreview.style.display = "block";
        };

        if (file) {
            reader.readAsDataURL(file);
        }
    }
</script>
</body>
</html>