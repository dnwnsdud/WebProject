<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dto.userDTO"%>
<%@page import="dao.userDAO"%>

<%
userDAO userDao = new userDAO();
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");
userDTO loginResult = userDao.login(userID, userPassword);

if (loginResult != null) {
	// 로그인 성공
	userDTO user = userDao.loginAndGetUser(userID, userPassword); // 사용자 정보 얻기

	if (user != null) {
		// 사용자 정보가 정상적으로 얻어졌을 경우에만 세션에 저장
		session.setAttribute("userID", userID);
		session.setAttribute("loggedInUser", user);

		response.sendRedirect("index.html");
	} else {
		// 사용자 정보 얻기 실패
		out.println("<script>alert('사용자 정보를 얻어오는데 실패했습니다.');history.back();</script>");
	}
} else {

	out.println("<script>alert('로그인 정보 오류 다시 시도해주세요.');history.back();</script>");
}
%>
