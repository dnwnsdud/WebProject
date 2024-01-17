<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.postDAO" %>
<%@ page import="dto.postDTO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="dto.userDTO" %>



<%
    userDTO userId = (userDTO) session.getAttribute("userId");

    if (userId != null) {
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


if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("action") != null) {
		String action = request.getParameter("action");

		// 게시글 작성 처리
		if ("memoWritePost".equalsIgnoreCase(action)) {
	String title = request.getParameter("memoTitle");
	String content = request.getParameter("memoContent");

	if (title != null && !title.isEmpty() && content != null && !content.isEmpty()) {
		postDAO postdAO = new postDAO();
		postDTO newPost = new postDTO();
		newPost.setTitle(title);
		newPost.setContent(content);
		newPost.setUserId(userID);
		postdAO.createPost(newPost);

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
    <link href="/resources/friend.css" rel="stylesheet" />
    <link href="/resources/recommendations.css" rel="stylesheet" />
    <script src="/resources/board.js"></script>
    <title>페이지 레이아웃</title>
  </head>
  <body>
    <div class="wrap">
      <header>
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
              <button class="log"><a href="./login.html">로그인</a></button>
              <button class="join"><a href="./terms.html">회원가입</a></button>
            </div>
          </nav>
        </header>
      </header>
<!-- 										-->
      <div class="board">
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
        <table>
          <thead>
            <tr>
              <th class="num">게시글 번호</th>
              <th class="userid">제목</th>
              <th class="title">내용</th>
              <th class="date">작성자</th>
            </tr>
          </thead>
          <tbody id="posts-body">
            <!-- 게시글 -->
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
        </table>
      </div>

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
    
<!-- 안되면 지우기 -->
      <div class="comments">
        <div class="comment-form">		
          <form action="<%=request.getContextPath()%>/post.jsp?action=writePost1"
		method="POST">
		<input type="text" id="memoTitle" placeholder="제목">
		<label for="content">내용:</label>
		<textarea id="memoContent" placeholder="메모"></textarea>
		<input type="submit" value="게시글 작성">
	</form>
        </div>
      </div>
<!-- 안되면 지우기 -->
  
</body>
</html>
