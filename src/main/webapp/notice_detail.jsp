<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
else{
postDTO post = null;
Date postDate = null;
SimpleDateFormat dateFormat = null;
String formattedPostDate = null;
List<commentDTO> comments = null;
// 게시글 정보 받아오기
if (request.getParameter("postId") == null) {
	response.sendRedirect("login.jsp");
} else {
	int postId = Integer.parseInt(request.getParameter("postId"));
	post = new postDAO().getPostById(postId);

	postDate = post.getPostDate();
	dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	formattedPostDate = dateFormat.format(postDate);

	// 댓글 정보 받아오기
	comments = new commentDAO().getCommentsByPostId(postId);

}
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<link rel="stylesheet" href="/resources/myrest.css" />
<link rel="stylesheet" href="/resources/notice_detail.css" />
</head>

</header>
<body>
<header class="hd">
      <nav class="mw">
        <h1 class="logo">
          <a href="./index.html"
            ><img src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" />
          </a>
        </h1>
        <div class="gnb">
          <a href="./movie.jsp">영화</a>
          <a href="./animation.jsp">애니메이션</a>
          <a href="./notice_main.jsp">리뷰</a>
        </div>
       <div class="click">
				<input type="text" placeholder="콘텐츠 등을 검색해보세요!" />
				<%
				if (loggedInUser == null) {
				%>
				<button class="log">
					<a href="./login.jsp">로그인</a>
				</button>
				<button class="join">
					<a href="./terms.html">회원가입</a>
				</button>
				
				<%} %>
				<%if(loggedInUser != null){ %>
					<%if(loggedInUser.getUserID().equals("admin")){%>
				<button class="log">
					<a href="./logout.jsp">로그아웃</a>
				</button>
				<button class="log">
					<a href="./admin.jsp">관리자 페이지</a>
				</button><%}else{ %>
				
				<button class="log">
					<a href="./logout.jsp">로그아웃</a>
				</button>
				<%
				}
				%>
				<%
				}
				%>

			</div>
      </nav>
    </header>

	<div class="wrap">
		<section class="con1">
			<h3>
				제목:
				<%=post.getTitle()%></h3>
			<div class="content">
				<p>
					작성자:
					<%=post.getUserId()%></p>
				<p>
					내용:
					<%=post.getContent()%></p>
				<p>
					등록일:
					<%=formattedPostDate%>
				</p>
			</div>
		</section>

		<section class="con2">
			<%
			if (loggedInUser != null
					&& (loggedInUser.getUserID().equals(post.getUserId()) || loggedInUser.getUserID().equals("admin"))) {
			%>
			<button onclick="deletePost()">글 삭제</button>
			<button onclick="editPost()">글 수정</button>
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
		</section>
		<section class="con4">
			<h3>댓글 목록</h3>
			<ul>
				<%
				for (commentDTO comment : comments) {
					Date commentDate = comment.getCommentDate();
					String formattedDate = dateFormat.format(commentDate);
				%>
				<li>
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
				</li>
				<%
				}
				%>
			</ul>
		</section>
		<!-- 댓글 입력 폼 -->
		<section class="con3">
			<form action="AddCommentServlet" method="post">
				<input type="hidden" name="postId" value="<%=post.getPostId()%>">
				<textarea name="comment" rows="4" cols="50" placeholder="댓글을 입력하세요"
					required class="tx"></textarea>
				<br />
				<div class="sb">
					<input type="submit" value="댓글 등록" />
				</div>
			</form>
		</section>
		<!-- 이전 버튼 -->
		<a href="<%=request.getContextPath()%>/notice_main.jsp">이전으로</a>
	</div>
</body>
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
</html>

<%}%>