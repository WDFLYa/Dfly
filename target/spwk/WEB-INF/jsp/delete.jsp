<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除用户</title>

</head>
<body>
<h2>删除用户</h2>
<form action="/user/delete" method="post">
    用户名: <input type="text" name="userName"/><br/>
    <input type="submit" value="删除用户"/>
</form> <!-- 加上缺失的 form 结束标签 -->
</body>
</html>
