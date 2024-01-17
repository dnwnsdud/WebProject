<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.postDTO"%>
<%@ page import="dao.postDAO"%>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String userID = (String) session.getAttribute("userID");

// 세션에 userID가 없으면 로그인 페이지로 리다이렉트
if (userID == null) {
	response.sendRedirect("login.jsp");
} else {
	if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("action") != null) {
		String action = request.getParameter("action");

		// 게시글 작성 처리
		if ("writePost".equalsIgnoreCase(action)) {
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	if (title != null && !title.isEmpty() && content != null && !content.isEmpty()) {
		postDAO postDAO = new postDAO();
		postDTO newPost = new postDTO();
		newPost.setTitle(title);
		newPost.setContent(content);
		newPost.setUserId(userID);
		postDAO.createPost(newPost);

		response.sendRedirect("post.jsp");
		return;
	}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
label {
	display: block;
	margin: 10px 0;
}

textarea {
	width: 100%;
	height: 150px;
	margin-bottom: 10px;
}

input[type="submit"] {
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<h2>게시글 작성</h2>

	<form action="<%=request.getContextPath()%>/writePost.jsp?action=writePost"
		method="POST">
		<label for="title">제목:</label>
		<input type="text" id="title"name="title" required>
		
		<label for="content">내용:</label>
		<textarea id="content" name="content" required></textarea>

		<input type="submit" value="게시글 작성">
	</form>

	<a href="<%=request.getContextPath()%>/post.jsp">게시글 목록으로 돌아가기</a>
</body>
</html>

<%
}
%>