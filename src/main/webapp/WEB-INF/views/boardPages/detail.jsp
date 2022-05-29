<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <c:if test="${sessionScope.loginId eq 'admin'}">
        <button class="btn btn-outline-primary"
                onclick=boardDelete()>삭제
        </button>
    </c:if>
    <button class="btn btn-outline-primary"
            onclick=findAll()>목록
    </button>


    <div class="container">
        <div id="comment-write"  class="input-group mb-3 form-floating">
            <input type="text" class="form-control"id="memberId"
                   value="${sessionScope.loginMemberId}"
                   placeholder="${sessionScope.loginMemberId}" readonly>
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
        </div>
    </div>
    <div id="comment-list">
        <table class="table">
            <tr>댓글번호</tr>
            <tr>작성자</tr>
            <tr>내용</tr>
            <tr>작성시간</tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>${comment.c_id}</tr>
                <tr>${comment.memberId}</tr>
                <tr>${comment.commentContents}</tr>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${comment.commentCreatedDate}"></fmt:formatDate></td>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script>

    $("#comment-write-btn").click(function () {
        console.log("함수호출")
        const cWriter = document.getElementById("memberId").value;
        const cContents = $("#commentContents").val();
        const boardId = '${board.b_id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "memberId": cWriter,
                "commentContents": cContents,
                "b_id": boardId
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].c_id + "</td>";
                    output += "<td>" + result[i].memberId + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>" + result[i].commentCreateData + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('memberId').value = '';
                document.getElementById('commentContents').value = '';
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        });
    });
    const boardUpdate = () => {
        location.href = "/board/update?b_id=${board.b_id}";
    }
    const boardDelete = () => {
        location.href = "/board/delete?b_id=${board.b_id}";
    }
    const findAll = () => {
        location.href = "/board/findAll";
    }
</script>
</html>
