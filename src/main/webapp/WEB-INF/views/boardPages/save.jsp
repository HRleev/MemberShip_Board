<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave</title>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<form action="/board/save" method="post">
    <input type="text" name="boardTitle" placeholder="글 제목">
    <input type="text" name="boardWriter" placeholder="작성자">
    <input type="text" name="boardPassword" placeholder="비밀번호">
    <textarea class ="form-control" name="boardContents" row="10" cols="30"></textarea>
    <input type="submit" value="작성">

</body>
</html>
