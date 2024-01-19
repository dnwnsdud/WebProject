<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="/resources/checkid.css" />
</head>
<body>
    <form action="findAction.jsp" method="post">
        <div class="check-id">
            <h1>
                <a href="./index.jsp">
                    <img src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" />
                </a>
            </h1>
            <div class="inputid">
                <input type="text" id="userid" name="userid" placeholder="아이디" value="<%= request.getAttribute("userID") %>"/>
            </div>
            <div class="loginmovement">
                <button type="button" class="loginbtn" onclick="location.href='login.jsp';">로그인하기</button>
            </div>
        </div>
    </form>
</body>
</html>