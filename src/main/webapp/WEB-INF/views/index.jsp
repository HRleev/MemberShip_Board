<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const saveMemberForm =()=>{
            location.href="/member/save"
        }
        const login=()=>{
            location.href="/member/login"
        }
        const list=()=>{
            location.href="/board/list"
        }

    </script>
</head>
<body>

<h2>index.jsp</h2>
<div class="container">
    <button class="btn btn-outline-success" onclick="saveMemberForm()">회원가입</button>
    <button class="btn btn-outline-success" onclick="login()">로그인</button>
    <button class="btn btn-outline-success" onclick="list()">글목록</button>
</div>
</body>
</html>
