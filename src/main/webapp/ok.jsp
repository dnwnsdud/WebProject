<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원가입 성공
	<%
String userID = (String) session.getAttribute("userID");
out.println(userID + "로그인 성공");
out.println("<a href = 'logout.jsp'> 로그아웃 <a/>");
%>


</body>
</html>