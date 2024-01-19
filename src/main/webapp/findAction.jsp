<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.userDTO, dao.userDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.RequestDispatcher"%>

<jsp:useBean id="user" class="dto.userDTO" scope="request" />

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String userEmail = request.getParameter("email");
String userTel = request.getParameter("phone");
String userResistNum = request.getParameter("residence");

user.setUserEmail(userEmail);
user.setUserTel(userTel);
user.setUserResistNum(userResistNum);

userDAO userDAO = new userDAO();
String userID = userDAO.findUserID(user);

// 결과를 request에 저장
request.setAttribute("userID", userID);

// 결과 페이지로 포워드
RequestDispatcher dispatcher = request.getRequestDispatcher("checkid.jsp");
dispatcher.forward(request, response);
%>
