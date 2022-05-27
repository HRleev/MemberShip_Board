<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 7:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>list.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<h2>list.jsp</h2>

<div>
    <a href="/board/save">글쓰기</a>
    <a href="/board/findById">조회</a>
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <a href ="/member/findAll">관리자페이지(회원목록)</a>
    </c:if>
</div>
<div class="container">
    <table class="table">
        <tr>
            <th>b_id</th>
            <th>boardTitle</th>
            <th>boardContents</th>
            <th>boardHits</th>
            <th>boardCreatedDate</th>
            <th>boardFile</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.b_id}</td>
                <td><a href="/board/detail?memberId=${board.memberId}">${board.boardTitle}</a></td>
                <td>${board.boardContents}</td>
                <td>${board.boardHits}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td><img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
                         alt="" height="100" width="100"></td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>

            <%--            1페이지가 아닌 경우에는 [이전]을 클릭하면 현제 페이지보다 1작은 페이지 요청--%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%--                요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게--%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
</body>

</html>

