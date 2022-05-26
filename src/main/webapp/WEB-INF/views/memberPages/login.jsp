<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login.jsp</title>
</head>
<body>
<form action="/member/login" method="post">
    <input type="text" name="memberId">
    <input type="text" name="memberPassword">
    <input type="submit" value="로그인">
</form>
</body>
</html>
