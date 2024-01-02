<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="joinAction.jsp" method="post">
		<div>
			<input type="text" placeholder="ID를 입력해주세요" name="userID" />
		</div>
		<div>
			<input type="password" placeholder="password를 입력해주세요"
				name="userPassword" />
		</div>
		<div>
			<input type="text" placeholder="전화번호를 입력해주세요" name="userTel" />
		</div>
		<div>
			<input type="text" placeholder="이름을 입력해주세요" name="userName" />
		</div>
		<div>
			<input type="text" placeholder="닉네임을 입력해주세요" name="userNickName" />
		</div>
		<div>
			<input type="email" placeholder="이메일을 입력해주세요" name="userEmail" />
		</div>
		<div>
			<input type="text" placeholder="주민등록번호를 입력해주세요" name="userResistNum" />
		</div>
		<input type="submit" value="회원가입" />
	</form>

</body>
</html>