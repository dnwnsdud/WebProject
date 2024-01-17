<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.postDAO" %>
<%@ page import="dto.postDTO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="dto.userDTO" %>


<%
    userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");

    if (loggedInUser != null) {
        // 세션에서 사용자 정보를 가져온 경우
    } else {
        // 세션에서 사용자 정보를 가져오지 못한 경우
        response.sendRedirect("login.jsp");
    }
%>
<%
    

    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String userID = (String) session.getAttribute("userID");

    // 세션에 userID가 없으면 로그인 페이지로 리다이렉트
    if (userID == null) {
        response.sendRedirect("login.jsp");
    } else {
        // 로그인이 되어 있다면 해당 코드 실행
        int pageNo = (request.getParameter("pageNo") != null) ? Integer.parseInt(request.getParameter("pageNo")) : 1;
        pageNo = Math.max(1, pageNo);
        int pageSize = 10; // 페이지당 게시글 수

        postDAO postDAO = new postDAO();
        List<postDTO> posts = postDAO.getPostsByPage(pageNo, pageSize);
        int totalPosts = postDAO.getTotalPostsCount();

        // 전체 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
     <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        p {
            color: #555;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        a:hover {
            color: #2980b9;
        }

        .pagination {
            margin-top: 20px;
        }

        .pagination a {
            color: #555;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
            cursor: pointer;
        }

        .pagination a.active {
            background-color: #3498db;
            color: white;
            border: 1px solid #3498db;
        }

        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h2>게시물 목록</h2>
    <p>
        안녕하세요,
        <%=userID%>님! <a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
    </p>

    <table>
        <thead>
            <tr>
                <th>게시글 번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
            </tr>
        </thead>
        <tbody>
            <%
            for (postDTO post : posts) {
            %>
            <tr>
                <td><%=post.getPostId()%></td>
                <td><a href="postDetail.jsp?postId=<%=post.getPostId()%>"><%=post.getTitle()%></a></td>
                <td><%=post.getContent()%></td>
                <td><%=post.getUserId()%></td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

    <a href="<%=request.getContextPath()%>/writePost.jsp">게시글 작성</a>

    <div class="pagination">
        <%
        for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="?pageNo=<%=i%>" class="<%=(i == pageNo) ? "active" : ""%>"><%=i%></a>
        <%
        }
        }
        %>
    </div>
</body>
</html>
