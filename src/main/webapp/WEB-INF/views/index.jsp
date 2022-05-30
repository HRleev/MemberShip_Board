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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        @font-face {
            font-family: 'EliceDigitalBaeum_Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        body {
            font-family: 'EliceDigitalBaeum_Bold';
        }
        .wrapper {
            background: #497dd0;
            padding: 100px;
        }

        .toggle_radio {
            position: relative;
            background: rgba(300, 300, 300, .1);
            margin: 4px auto;
            overflow: hidden;
            padding: 0 !important;
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            border-radius: 50px;
            position: relative;
            height: 40px;
            width: 318px;
        }

        .toggle_radio > * {
            float: left;
        }

        .toggle_radio input[type=radio] {
            display: none;
            /*position: fixed;*/
        }

        .toggle_radio label {
            font: 120%/1.618  'EliceDigitalBaeum_Bold';
            color: rgba(255, 255, 255, .9);
            z-index: 0;
            display: block;
            width: 100px;
            height: 20px;
            margin: 3px 3px;
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            border-radius: 50px;
            cursor: pointer;
            z-index: 1;
            /*background: rgba(0,0,0,.1);*/
            text-align: center;
            /*margin: 0 2px;*/
            /*background: blue;*/ /*make it blue*/
        }

        .toggle_option_slider {
            /*display: none;*/
            /*background: red;*/
            width: 100px;
            height: 37px;
            position: absolute;
            top: 3px;
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            border-radius: 50px;
            -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            -o-transition: all .4s ease;
            -ms-transition: all .4s ease;
            transition: all .4s ease;
        }

        #first_toggle:checked ~ .toggle_option_slider {
            background: rgba(255, 255, 255, .3);
            left: 3px;
        }

        #second_toggle:checked ~ .toggle_option_slider {
            background: rgba(255, 255, 255, .3);
            left: 109px;
        }

        #third_toggle:checked ~ .toggle_option_slider {
            background: rgba(255, 255, 255, .3);
            left: 215px;
        }
    </style>
</head>
<body>
<h2>index.jsp</h2>
<div class="wrapper">
    <div class="toggle_radio">
        <input type="radio" onclick=location.href="/member/save" class="toggle_option" id="first_toggle" name="toggle_option">
        <input type="radio" onclick=location.href="/member/login" checked class="toggle_option" id="second_toggle" name="toggle_option">
        <input type="radio" onclick=location.href="/board/paging" class="toggle_option" id="third_toggle" name="toggle_option">
        <label for="first_toggle"><p>회원가입</p></label>
        <label for="second_toggle"><p>로그인</p></label>
        <label for="third_toggle"><p>글목록</p></label>
        <div class="toggle_option_slider">
        </div>
    </div>
<%--배경을 담거라--%>
<%--    <div>--%>
<%--        <img src="..." class="img-fluid" alt="...">--%>
<%--    </div>--%>

    <%--    <button class="btn btn-outline-success"  onclick="saveMemberForm()">회원가입</button>--%>
    <%--    <button class="btn btn-outline-success" onclick="login()">로그인</button>--%>
    <%--    <button class="btn btn-outline-success" onclick="list()">글목록</button>--%>
</body>
</html>
