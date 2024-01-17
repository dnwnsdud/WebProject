<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.postDTO"%>
<%@ page import="dao.postDAO"%>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int postId = Integer.parseInt(request.getParameter("postId"));
postDTO post = new postDAO().getPostById(postId);
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
    <h2>게시글 수정 페이지</h2>
    <div class="moifyPost">
    <form action="EditPostServlet" method="post">
        <input type="hidden" name="postId" value="<%=post.getPostId()%>">
        <label for="newTitle">제목:</label>
        <input type="text" id="newTitle" name="newTitle" value="<%=post.getTitle()%>" required><br>
        <label for="newContent">내용:</label>
        <textarea id="newContent" name="newContent" rows="4" cols="50" required><%=post.getContent()%></textarea><br>
        <input type="submit" value="게시글 수정">
    </form>
  </div>
  </div>
</body>
</html>