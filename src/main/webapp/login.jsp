<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
<link rel="stylesheet" href="/resources/myrest.css" />
<link rel="stylesheet" href="/resources/login.css" />
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	if (request.getParameter("fail") != null) {
	%>
	<script>
		alert("로그인 정보 오류 다시 시도해주세요.");
	</script>
		<div class="wrap">
		<h1>
			<a href="./index.jsp"><img
				src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" /></a>
		</h1>
		<ul>
			<li class="log">로그인</li>
			<form action="loginAction.jsp" method="post">
				<li><input type="text" id="userID" name="userID"
					placeholder="아이디" class="id" required></li>
				<li class="password"><input type="password" id="userPassword"
					name="userPassword" placeholder="비밀번호" required></li>
				<li><button type="submit">로그인</button></li>
			</form>
		</ul>
		<div>
			<span class="not">계정이 없으신가요?</span> <span class="user"><a
				href="./terms.html">회원가입</a></span> <span class="user">/</span> <span
				class="user"><a href="./findid.html">아이디 찾기</a></span>
		</div>
	</div>
	<%
	} else {
	%>


	<div class="wrap">
		<h1>
			<a href="./index.jsp"><img
				src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" /></a>
		</h1>
		<ul>
			<li class="log">로그인</li>
			<form action="loginAction.jsp" method="post">
				<li><input type="text" id="userID" name="userID"
					placeholder="아이디" class="id" required></li>
				<li class="password"><input type="password" id="userPassword"
					name="userPassword" placeholder="비밀번호" required></li>
				<li><button type="submit">로그인</button></li>
			</form>
		</ul>
		<div>
			<span class="not">계정이 없으신가요?</span> <span class="user"><a
				href="./terms.html">회원가입</a></span> <span class="user">/</span> <span
				class="user"><a href="./findid.html">아이디 찾기</a></span>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>
