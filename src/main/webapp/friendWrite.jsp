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
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/myrest.css" />
    <link href="../css/friend.css" rel="stylesheet" />
    <link href="../css/frindDetail.css" rel="stylesheet" />

    <script src="../js/board.js"></script>
    <title>페이지 레이아웃</title>
  </head>
  <body>
    <div class="wrap">
      <header>
        <header class="hd">
          <nav class="mw">
            <h1 class="logo">
              <a href="./index.html"
                ><img src="../img/WATCHA_PEDIA_Logo_Main1.png" alt="" />
              </a>
            </h1>
            <div class="gnb">
              <a href="./movie.html">영화</a>
              <a href="./animation.html">애니메이션</a>
              <a href="./review.html">리뷰</a>
            </div>
            <div class="click">
              <input type="text" placeholder="콘텐츠 등을 검색해보세요!" />
              <button class="log"><a href="./login.html">로그인</a></button>
              <button class="join"><a href="./terms.html">회원가입</a></button>
            </div>
          </nav>
        </header>
    </header>

  </head>
  <body>
    <div class="form-container">
        <h2>게시글 작성</h2>
        <form action="<%=request.getContextPath()%>/writePost.jsp?action=writePost" method="POST">
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>
            
            <label for="content">내용:</label>
            <textarea id="content" name="content" required></textarea>

            <input type="submit" value="게시글 작성">
        </form>

    <a href="<%=request.getContextPath()%>/post.jsp">게시글 목록으로 돌아가기</a>
    </div>
</div>
</body>
</html>
    
<%
}
%>
    