<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 3:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>detail</title>

</head>
<body>

<div class="container">
    글번호 : ${board.b_id}<br>
    작성자 : ${board.memberId}<br>
    제목 : ${board.boardTitle}<br>
    내용 : ${board.boardContents}<br>
    조회수 : ${board.boardHits}<br>
    작성일자 : ${board.boardCreatedDate}<br>
    <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
         alt="" height="100" width="100">
<c:if test="${sessionScope.loginId eq board.memberId}">
    <button class="btn btn-outline-primary"
            onclick=boardUpdate()>수정
    </button>
</c:if>
    <c:if test="${sessionScope.loginId eq board.memberId}">
    <button class="btn btn-outline-primary"
            onclick="boardDelete()">삭제
    </button>
</c:if>
    <button class="btn btn-outline-primary"
            onclick=findAll()>목록
    </button>


<%--    <div class="container">--%>
<%--        <div id="comment-write" class="input-group mb-3 form-floating">--%>
<%--            <input type="text" id="commentWriter" class="form-control" placeholder="작성자">--%>
<%--            <input type="text" id="commentContents" class="form-control" placeholder="내용">--%>
<%--            <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div id="comment-list">--%>
<%--        <table class="table">--%>
<%--            <tr>댓글번호</tr>--%>
<%--            <tr>작성자</tr>--%>
<%--            <tr>내용</tr>--%>
<%--            <tr>작성시간</tr>--%>
<%--            <c:forEach items="${commentList}" var="comment">--%>
<%--                <tr>${comment.id}</tr>--%>
<%--                <tr>${comment.commentWriter}</tr>--%>
<%--                <tr>${comment.commentContents}</tr>--%>
<%--                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>--%>
<%--            </c:forEach>--%>
<%--        </table>--%>
<%--    </div>--%>
</div>
</body>
<script>
    const boardUpdate =()=>{
        location.href = "/board/update?b_id=${board.b_id}";
    }
    const boardDelete =()=>{
        location.href = "/board/delete?_bid=${board.b_id}";
    }
    const findAll =()=> {
        location.href = "/board/findAll";
    }
</script>
</html>
