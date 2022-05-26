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
    <script src ="/resources/js/jquery.js"></script>
</head>
<body>
<div class="container">

<form action="/member/save" method="post" enctype="multipart/form-data">
    <input type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="계정"><br>
    <div id ="dup-check-result"></div>
    <input type="text" onblur="regular()" name="memberPassword" id="memberPassword" placeholder="영문 소문자+숫자 5~10글자"><br>
    <div id="password-check-result"></div>
    <input type="text" name="memberName" placeholder="이름"><br>
    <input type="text" name="memberEmail" placeholder="이메일"><br>
    <input type="text" name="memberMobile" placeholder="전화번호"><br>
    <input type="file" name="memberProfile" placeholder="프로필 사진"><br>
    <input type="submit" value="회원가입">

</form>
</div>
</body>
<script>
    const duplicateCheck=()=>{
        const memberId=document.getElementById("memberId").value;
        const checkResult =document.getElementById("dup-check-result");
        $.ajax({
            type:"post",
            url:"/member/duplicate-check",
            data:{"memberId":memberId},
            success:function (result){
                if(result=="ok"){
                    checkResult.innerHTML="사용가능한 아이디 입니다";
                    checkResult.style.color="green";
                }else{
                    checkResult.innerHTML="사용중인 아이디 입니다"
                    checkResult.style.color="red";
                }
            }
        });
    }
    function regular(){
        const password=document.getElementById("memberPassword").value;
        const checkResult = document.getElementById("password-check-result");
        const exp =/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,8}$/
        if(password.match(exp)){
            checkResult.innerHTML="사용 가능한 비밀번호 입니다";
            checkResult.style.color="green";
        }else{
            checkResult.innerHTML="비밀번호를 다시 입력해주세요";
            checkResult.style.color="red";
        }
    }
</script>
</html>
