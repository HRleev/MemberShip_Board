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
    <script src ="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>

<div class="container" >
    <table class="table table-striped">
        <th>글번호 : ${board.b_id}</th>
        <th>작성자 : ${board.memberId}</th>
        <th> 제목 : ${board.boardTitle}</th>
        <th>내용 : ${board.boardContents}</th>
        <th> 조회수 : ${board.boardHits}</th>
        <th>작성일자 : ${board.boardCreatedDate}</th>
        <th> <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
         alt="" height="100" width="100"></th>
    </table>
    <c:if test="${sessionScope.loginMemberId eq board.memberId}">
        <button class="btn btn-outline-primary"
                onclick=boardUpdate()>수정
        </button>
    </c:if>
    <c:if test="${sessionScope.loginMemberId eq board.memberId}">
        <button class="btn btn-outline-primary"
                onclick="boardDelete()">삭제
        </button>
    </c:if>
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <button class="btn btn-outline-primary"
                onclick=boardDelete()>삭제
        </button>
    </c:if>
    <button class="btn btn-outline-primary"
            onclick=findAll()>목록
    </button>


    <div class="container">
        <div id="comment-write"  class="input-group mb-3 form-floating">
            <input type="hidden" id="b_id" value="${board.b_id}">
            <input type="text" class="form-control"id="memberId"
                   value="${sessionScope.loginMemberId}"
                   placeholder="${sessionScope.loginMemberId}" readonly>
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <button onclick="comments()" class="btn btn-primary">댓글작성</button>
        </div>
    </div>
    <div id="comment-list">
        <table class="table table-striped">
            <tr>댓글번호</tr>
            <tr>작성자</tr>
            <tr>내용</tr>
            <tr>작성시간</tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                <td>${comment.c_id}</td>
                <td>${comment.memberId}</td>
                <td>${comment.commentContents}</td>
                <td>${comment.commentCreatedDate}</td>
<%--                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"--%>
<%--                                    value="${comment.commentCreatedDate}"></fmt:formatDate></td>--%>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
<script>

    const  comments =()=>{
        console.log("함수호출")
        const cWriter = document.getElementById("memberId").value;
        const cContents = document.getElementById("commentContents").value;
        const b_id = '${board.b_id}';

        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "memberId": cWriter,
                "commentContents": cContents,
                "b_id": b_id,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<th>글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].b_id + "</td>";
                    output += "<td>" + result[i].memberId + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>"+ moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
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
    }
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
