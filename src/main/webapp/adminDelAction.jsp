<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.adminDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.userDTO" %>

<%
    String action = request.getParameter("action");
    String userID = request.getParameter("userID");
    adminDAO adminDao = new adminDAO();
    boolean deletePostsResult = false;
    boolean deleteCommentsResult = false;

    if ("deleteUserPosts".equals(action)) {
        // 사용자의 글 삭제
        deletePostsResult = adminDao.deleteUserPosts(userID);
    } else if ("deleteUserComments".equals(action)) {
        // 사용자의 댓글 삭제
        deleteCommentsResult = adminDao.deleteUserComments(userID);
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Action Page</title>
</head>
<body>

<h2>Action Result</h2>

<%
    if ("deleteUserPosts".equals(action)) {
        // 사용자의 글 삭제 결과에 따라 스크립트 창 표시
%>
    <script>
        alert("<%= deletePostsResult ? "사용자의 글이 성공적으로 삭제되었습니다." : "사용자의 글 삭제에 실패했습니다." %>");
        history.back();
    </script>
<%
    } else if ("deleteUserComments".equals(action)) {
        // 사용자의 댓글 삭제 결과에 따라 스크립트 창 표시
%>
    <script>
        alert("<%= deleteCommentsResult ? "사용자의 댓글이 성공적으로 삭제되었습니다." : "사용자의 댓글 삭제에 실패했습니다." %>");
        history.back();
    </script>
<%
    }
%>

</body>
</html>