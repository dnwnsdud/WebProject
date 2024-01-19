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

		response.sendRedirect("notice_main.jsp");
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
<link rel="styleSheet" href="/resources/myreset.css">
<link rel="styleSheet" href="/resources/write.css">
</head>
<body>
	<header class="hd">
		<nav class="mw">
			<h1 class="logo">
				<a href="./index.jsp"><img
					src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" /> </a>
			</h1>
	</header>


	<div class="wrap">
		<section class="con1">
			<h2>게시글 작성</h2>
			<form
				action="<%=request.getContextPath()%>/writePost.jsp?action=writePost"
				method="POST">
				<div class="dec">
					<label for="title" class="title">제목:</label> <input type="text"
						placeholder="제목을 입력하세요!"
						style="width: 500px; height: 30px; font-size: 30px" />
				</div>
				<div class="dec2">
					<label for="content">내용:</label>
					<textarea id="content" name="content" required></textarea>
					<input class="btn" type="submit" value="게시글 작성" />
				</div>
			</form>
			<p class="a">
				<a href="<%=request.getContextPath()%>/notice_main.jsp"><- 게시글 목록으로 돌아가기</a>
			</p>
		</section>
	</div>

</body>
</html>

<%
}
%>
