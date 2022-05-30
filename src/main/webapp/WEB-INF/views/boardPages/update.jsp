<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-05-28
  Time: 오후 5:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>update</title>
</head>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>update.jsp</h2>

<form action="/board/update" method="post" >
  <input type="hidden" name="b_id" value="${board.b_id}">
  <input type="text" value="${board.boardTitle}" class="form-control" readonly>
  <input type="text" name="memberId" value="${sessionScope.loginMemberId}" class="form-control" readonly>
  <textarea name="boardContents" cols="30" rows="10"></textarea>
  <input type="submit" class="btn btn-danger" value="수정">
</form>
</body>

</html>
