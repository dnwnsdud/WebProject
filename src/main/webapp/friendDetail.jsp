<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ page import="dto.userDTO"%>
<%@ page import="dto.postDTO"%>
<%@ page import="dto.commentDTO"%>
<%@ page import="dao.postDAO"%>
<%@ page import="dao.commentDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<%
    userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
	    // 로그인이 되어 있지 않은 경우 로그인 페이지로 이동
	response.sendRedirect("login.jsp");
    }

    // 게시글 정보 받아오기
    int postId = Integer.parseInt(request.getParameter("postId"));
    postDTO post = new postDAO().getPostById(postId);
    
    Date postDate = post.getPostDate();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
    String formattedPostDate = dateFormat.format(postDate);

    // 댓글 정보 받아오기
    List<commentDTO> comments = new commentDAO().getCommentsByPostId((postId));
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/myrest.css" />
    <link href="../css/friend.css" rel="stylesheet" />
    <link href="../css/frindDetail.css" rel="stylesheet"/>

    <script src="../js/board.js"></script>
<head>
    <!-- HTML 헤더 정보 -->
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
    
        
        <!-- 게시글 상세 정보 -->
        <div class="post-detail">
            <div class="post-detail-info">
            <p id="post-author">작성자: <%= post.getUserId() %></p>
            <h2 id="post-title">제목: <%= post.getTitle() %></h2>
            <p id="post-date">등록일: <%=formattedPostDate %></p>
            </div>
            <div id="post-content">내용: <%= post.getContent() %></div>

            <!-- 수정 및 삭제 버튼 -->
            <%
            if (loggedInUser != null
                    && (loggedInUser.getUserID().equals(post.getUserId()) || loggedInUser.getUserID().equals("admin"))) {
            %>
            <button id="edit-btn" style="display: none;" onclick="deletePost()">글 삭제</button>
            <button id="delete-btn" style="display: none;" onclick="editPost()">글 수정</button>
            <%
            if (loggedInUser != null && loggedInUser.getUserID().equals("admin")) {
            %>
            <button onclick="deletePost()">글 삭제</button>
            <%
            }
            %>
        
            <%
            }
            %>
        </div>

        <!-- 댓글 목록 -->
        <div class="comment-section">
            <h3>댓글 목록</h3>
                <ul id="comment-list">
                    <%
                    for (commentDTO comment : comments) {
                        Date commentDate = comment.getCommentDate();
                        String formattedDate = dateFormat.format(commentDate);
                    %>
                    <div>
                        <p>
                            <strong><%=comment.getUserId()%></strong>:
                            <%=comment.getContent()%><br />
                            <%=formattedDate%>
                            <%
                            if (loggedInUser != null && loggedInUser.getUserID().equals(comment.getUserId())) {
                            %>
                            <a
                                href="DeleteCommentServlet?commentId=<%=comment.getCommentId()%>&postId=<%=post.getPostId()%>"
                                class="delete-btn">삭제</a>
                            <%
                            }
                            %>
                        </p>
                    </div>
                    <%
                    }
                    %>
                </ul>
                    <!-- 댓글 입력 폼 -->
                    <form id="comment-form" action="AddCommentServlet" method="post">
                        <input type="hidden" name="postId" value="<%= postId %>">
                        <textarea name="comment" rows="4" placeholder="댓글을 입력하세요"></textarea>
                        <br>
                        <input type="submit" value="댓글 등록">
                    </form>
                </div>
            
            <!-- 이전 버튼 -->
                <a href="<%=request.getContextPath()%>/post.jsp">이전으로</a>
            </div>
        </div>
        <script>
            function deletePost() {
                var confirmDelete = confirm("정말로 삭제하시겠습니까?");
                if (confirmDelete) {
                    // 확인을 눌렀을 때 서블릿 호출
                    location.href = "DeletePostServlet?postId=<%=post.getPostId()%>";
            }
        }
            function editPost() {
                // 현재 게시글의 postId를 가져와서 EditPostServlet으로 이동
                location.href = "editPost.jsp?postId=<%=post.getPostId()%>";
        }
    </script>
    </body>
</html>