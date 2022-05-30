<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<header>
    <nav class="navbar" style="background-color: #e3f2fd;">
        <a href="/" class="btn btn-secondary">Home</a> &nbsp;
        <a href="/board/paging"class="btn btn-secondary" >글목록</a> &nbsp;

        <c:if test="${sessionScope.loginMemberId !=null}">
            <a href="/member/logout" class="btn btn-secondary" >로그아웃</a>&nbsp;
        </c:if>

        <c:if test="${sessionScope.loginMemberId !=null}">
            <a href="/member/update-form" class="btn btn-secondary" >마이페이지</a>&nbsp;
        </c:if>

        <div class="container mt-3">
            <form action="/board/search" method="get">
                <select name="searchType">
                    <option value="boardTitle">제목</option>
                    <option value="memberId">작성자</option>
                </select>
                <input type="text" name="q" placeholder="검색어입력..">
                <input type="submit" value="검색">
            </form>
        </div>
    </nav>

</header>
</body>
<script>

</script>
</html>
