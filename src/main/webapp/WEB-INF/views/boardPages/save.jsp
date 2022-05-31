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
    <style>
        body {
            padding-top: 70px;
            padding-bottom: 30px;
        }
    </style>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" role="main">
    <form action="/board/save" id="form" role="form" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title">제목</label>
            <div class="mb-3">
                <input type="text" name="boardTitle" class="form-control" placeholder="제목을 입력해주세요">
            </div>
            <label for="reg_id">작성자</label>
            <input type="text" name="memberId" class="form-control" value="${sessionScope.loginMemberId}"
                   placeholder="${sessionScope.loginMemberId}" readonly>
        </div>
        <div class="mb-3">
            <label for="content">내용</label>
        <textarea class="form-control" name="boardContents" class="form-control" rows="5"></textarea>
        </div>
        <div class="mb-3">
            <label for="tag">첨부파일</label>
        <input type="file" name="boardFile"class="form-control" placeholder="첨부파일">
        </div>
        <div >
        <input type="submit" value="작성" class="btn btn-sm btn-primary">
        </div>
    </form>
</div>
</body>
</html>
