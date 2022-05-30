<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>myPage</title>
    <style>
        input{
            display: block;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<form action="update"method="post" name="updateForm">'
    <input type="hidden" name="m_id" value="${updateMember.m_id}">
    memberId:<input type="text" name="memberId" value="${sessionScope.loginMemberId}" placeholder="${updateMember.memberId}" readonly><br>
    memberPassword:<input type="text" name="memberPassword" id="pwConfirm"  placeholder="비밀번호를 입력하세요"><br>
    memberName:<input type="text" name="memberName" placeholder="${updateMember.memberName}"readonly><br>
    memberMobile:<input type="text" name="memberMobile"><br>
    <input type="button" onclick="update()" value="정보수정">

</form>
</body>
<script>
    const update=()=>{
        console.log("함수 호출");
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB ='${updateMember.memberPassword}';
        console.log("pwConfirm:" + pwConfirm+ ",pwDB:" +pwDB);
        if(pwConfirm==pwDB){
            updateForm.submit();
        }else{
            alert("비밀번호가 틀립니다");
        }
    }
</script>
</html>
