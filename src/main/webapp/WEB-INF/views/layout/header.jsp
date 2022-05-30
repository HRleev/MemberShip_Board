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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<style>
    /*@font-face {*/
    /*    font-family: 'EliceDigitalBaeum_Bold';*/
    /*    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2') format('woff2');*/
    /*    font-weight: 700;*/
    /*    font-style: normal;*/
    /*}*/

    /*body {*/
    /*    font-family: 'EliceDigitalBaeum_Bold';*/
    /*}*/
</style>
</head>
<body>

<header>
    <nav class="navbar" style="background-color: #e3f2fd;">
        <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group me-2" role="group" aria-label="First group">
        <a href="/" class="btn btn-outline-secondary">Home</a> &nbsp;
        <a href="/board/paging"class="btn btn-outline-secondary" >글목록</a> &nbsp;

        <c:if test="${sessionScope.loginMemberId !=null}">
            <a href="/member/logout" class="btn btn-outline-secondary" >로그아웃</a>&nbsp;
        </c:if>

        <c:if test="${sessionScope.loginMemberId !=null}">
            <a href="/member/update-form"class="btn btn-outline-secondary">마이페이지</a>&nbsp;
        </c:if>
    </nav>

</header>
</body>
<script>

</script>
</html>
