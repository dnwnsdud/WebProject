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
    <title>게시글 수정 페이지</title>

    <link rel="stylesheet" href="/resources/myrest.css" />
    <link rel="stylesheet" href="/resources/adminfixpage.css" />
  </head>
  <body>
    <header class="hd">
      <nav class="mw">
        <h1 class="logo">
          <a href="/index.html"
            ><img src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" />
          </a>
        </h1>
      </nav>
    </header>
    <div class="wrap">
      <h2>게시글 수정 페이지</h2>
      <form action="EditPostServlet" method="post">
        <input type="hidden" name="postId" value="<%=post.getPostId()%>">
        <div class="ti">
          <label for="newTitle">제목:</label>
          <input type="text" id="newTitle" name="newTitle" value="<%=post.getTitle()%>" required><br>
        </div>
        <br />
        <div class="content">
          <label for="newContent">내용:</label>
          <textarea
            id="newContent"
            name="newContent"
            rows="8"
            cols="80"
            required
          ><%=post.getContent()%></textarea>
        </div>
        <br />
        <input type="submit" value="게시글 수정" class="btn" />
      </form>
      <a href="notice_detail.jsp?postId=<%=post.getPostId()%>">이전으로</a>
    </div>
  </body>
</html>
