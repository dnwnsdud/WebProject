<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginAction.jsp" method="post">
		<div>
			<input type="text" placeholder="ID를 입력해주세요" name="userID" />
		</div>
		<div>
			<input type="password" placeholder="password를 입력해주세요"
				name="userPassword" />
		</div>
		<input type="submit" value="로그인" />
	</form>

</body>
</html>