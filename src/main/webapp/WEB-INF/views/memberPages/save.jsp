<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 3:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>save.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>

</head>
<body>
<div class="container">
    <%--@declare id="inputemail4"--%>
    <form action="/member/save" method="post" enctype="multipart/form-data" class="row g-3">
        <div class="col-md-12">
            <label for="inputEmail4" class="form-label">계정</label>
            <input type="text" onblur="duplicateCheck()"class="form-control" id="memberId" name="memberId" ><br>
            <div id="dup-check-result"></div>
        </div>
        <div class="col-md-12">
            <label for="inputEmail4" class="form-label">비밀번호</label>
            <input type="text" name="memberPassword" class="form-control"onblur="regular()" id="memberPassword"
                   placeholder="영문 숫자 포함 5자 이상"><br>
        </div>
        <div class="col-md-12">
            <label for="inputEmail4" class="form-label">이름</label>
            <input type="text" name="memberName"class="form-control" ><br>
        </div>
        <div class="col-md-12">
            <label for="inputEmail4" class="form-label">이메일</label>
            <input type="text" name="memberEmail" class="form-control" ><br>
        </div>
        <div class="col-md-12">
            <label for="inputEmail4" class="form-label">전화번호</label>
            <input type="text" name="memberMobile" class="form-control" ><br>
        </div>
        <div class="col-md-12">
            <label for="inputEmail4" class="form-label">프로필 사진</label>
        <input type="file" name="memberProfile" class="form-control"><br>
        </div>
        <input type="submit" value="회원가입">
    </form>
</div>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post",
            url: "/member/duplicate-check",
            data: {"memberId": memberId},
            success: function (result) {
                if (result == "ok") {
                    checkResult.innerHTML = "사용가능한 아이디 입니다";
                    checkResult.style.color = "green";
                } else {
                    checkResult.innerHTML = "사용중인 아이디 입니다"
                    checkResult.style.color = "red";
                }
            }
        });
    }

    function regular() {
        const password = document.getElementById("memberPassword").value;
        const checkResult = document.getElementById("password-check-result");
        const exp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,8}$/
        if (password.match(exp)) {
            checkResult.innerHTML = "사용 가능한 비밀번호 입니다";
            checkResult.style.color = "green";
        } else {
            checkResult.innerHTML = "비밀번호를 다시 입력해주세요";
            checkResult.style.color = "red";
        }
    }
</script>
</html>
