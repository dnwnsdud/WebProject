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

    if (loggedInUser == null) {
    	response.sendRedirect("login.jsp");
    }else{
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
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="/resources/myrest.css" />
    <link rel="stylesheet" href="/resources/notice_main.css" />
    <title>게시글 목록</title>
  </head>
  <body>
    <header class="hd">
      <nav class="mw">
        <h1 class="logo">
          <a href="./index.jsp"
            ><img src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" />
          </a>
        </h1>
        <div class="gnb">
          <a href="./movie.html">영화</a>
          <a href="./animation.html">애니메이션</a>
          <a href="./review.html">리뷰</a>
        </div>
        <div class="click">
          <input type="text" placeholder="콘텐츠 등을 검색해보세요!" />
          <%
				if (loggedInUser.getUserID().equals("admin")) {
				%>
				<button class="log">
					<a href="./logout.jsp">로그아웃</a>
				</button>
				<button class="log">
					<a href="./admin.jsp">관리자 페이지</a>
				</button>
				<%
				} else {
				%>

				<button class="log">
					<a href="./logout.jsp">로그아웃</a>
				</button>
				<%
				}
				%>
        </div>
      </nav>
    </header>
    <div class="wrap">
      <div class="make_wrap">
        <button class="make"><a href="<%=request.getContextPath()%>/writePost.jsp">게시글 작성</a></button>
      </div>
      <table class="post">
        <thead>
          <tr>
            <th class="num">게시글 번호</th>
            <th class="title">제목</th>
            <th class="texted">내용</th>
            <th>작성자</th>
          </tr>
        </thead>
        <tbody>
          
          <%
            for (postDTO post : posts) {
            %>
            <tr>
                <td  class="num"><%=post.getPostId()%></td>
                <td><a href="notice_detail.jsp?postId=<%=post.getPostId()%>"><%=post.getTitle()%></a></td>
                <td><%=post.getContent()%></td>
                <td><%=post.getUserId()%></td>
            </tr>
            <%
            }
            %>
        </tbody>
      </table>
      <div class="pag">
        <div class="pagination">
           <%
        for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="notice_detail.jsp?pageNo=<%=i%>" class="<%=(i == pageNo) ? "active" : ""%>"><%=i%></a>
        <%
        }
        }
        %>
        </div>
      </div>
    </div>
  </body>
</html>
<%}%>