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
<form action="/board/save" method="post" enctype="multipart/form-data">
    <input type="text" name="boardTitle" placeholder="글 제목"><br>
    <input type="text" name="memberId" value="${sessionScope.loginMemberId}" placeholder="${sessionScope.loginMemberId}" readonly><br>
    <textarea class ="form-control" name="boardContents" row="10" cols="30"></textarea><br>
    <input type="file" name="boardFile" placeholder="첨부파일"><br>
    <input type="submit" value="작성">
</form>
</body>
</html>
