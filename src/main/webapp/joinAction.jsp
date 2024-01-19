<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.userDAO"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 액션</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	%>
	
<jsp:useBean id="user" class="dto.userDTO" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userNickName" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userResistNum" />
<jsp:setProperty name="user" property="userTel" />
	<%
	PrintWriter script = response.getWriter(); // script 변수 선언
	
	System.out.println(request.getParameter("userName"));

	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserNickName() == null || user.getUserEmail() == null || user.getUserResistNum() == null
			|| user.getUserTel() == null) {
		showAlert("입력이 안 된 사항이 있습니다.\\n확인해주세요.", script);
	} else {
		userDAO userDAO = new userDAO();
		int result = userDAO.signUp(user);
		if(result == -1){
			showAlert("이미 존재하는 아이디입니다.", script);
		}else if (result == -2) {
			showAlert("이미 가입되어 있습니다.", script);
			}else {
			showAlert("회원가입 성공하였습니다.", script);
			response.sendRedirect("./login.jsp");
		}
	}
	%>

	<%!// 경고창 표시 함수
	private void showAlert(String message, PrintWriter script) {
		script.println("<script>");
		script.println("alert('" + message + "')");
		script.println("history.back()");
		script.println("</script>");
	}%>
</body>
</html>
