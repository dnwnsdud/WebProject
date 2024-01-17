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
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정 페이지</title>
    <style>
    </style>
</head>
<body>
    <h2>게시글 수정 페이지</h2>
    
    <form action="EditPostServlet" method="post">
        <input type="hidden" name="postId" value="<%=post.getPostId()%>">
        <label for="newTitle">제목:</label>
        <input type="text" id="newTitle" name="newTitle" value="<%=post.getTitle()%>" required><br>
        <label for="newContent">내용:</label>
        <textarea id="newContent" name="newContent" rows="4" cols="50" required><%=post.getContent()%></textarea><br>
        <input type="submit" value="게시글 수정">
    </form>

    
    <a href="postDetail.jsp?postId=<%=post.getPostId()%>">이전으로</a>
</body>
</html>
