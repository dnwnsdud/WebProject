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

// 게시글 정보 받아오기
int postId = Integer.parseInt(request.getParameter("postId"));
postDTO post = new postDAO().getPostById(postId);

Date postDate = post.getPostDate();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
String formattedPostDate = dateFormat.format(postDate);

// 댓글 정보 받아오기
List<commentDTO> comments = new commentDAO().getCommentsByPostId(postId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	margin: 20px;
}

h2, h3 {
	color: #333;
}

p {
	margin: 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
}

.user-info {
	margin-bottom: 20px;
}

.user-info a {
	color: #3498db;
	text-decoration: none;
	font-weight: bold;
}

.post-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	margin-bottom: 20px;
}

.edit-btn, .delete-btn {
	display: inline-block;
	padding: 8px 15px;
	background-color: #4CAF50;
	color: #fff;
	text-decoration: none;
	border-radius: 3px;
	margin-right: 10px;
}

.edit-btn:hover, .delete-btn:hover {
	background-color: #45a049;
}

.comment-section {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
}

.comment-section ul {
	list-style: none;
	padding: 0;
}

.comment-section textarea {
	width: 100%;
	margin-bottom: 10px;
}

.comment-section input[type="submit"] {
	background-color: #3498db;
	color: #fff;
	padding: 8px 15px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.comment-section input[type="submit"]:hover {
	background-color: #2980b9;
}
</style>
</head>
<body>
	<h2>게시글 상세 페이지</h2>
	<p>
		안녕하세요,
		<%=loggedInUser.getUserID()%>님! <a
			href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
	</p>

	<h3>
		제목:
		<%=post.getTitle()%></h3>
	<p>
		작성자:
		<%=post.getUserId()%></p>
	<p>
		내용:
		<%=post.getContent()%></p>
	<p>
		등록일:
		<%=formattedPostDate %>
	</p>


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

	<h3>댓글 목록</h3>
	<ul>
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
	<form action="AddCommentServlet" method="post">
		<input type="hidden" name="postId" value="<%=post.getPostId()%>">
		<textarea name="comment" rows="4" cols="50" placeholder="댓글을 입력하세요"
			required></textarea>
		<br> <input type="submit" value="댓글 등록">
	</form>

	<!-- 이전 버튼 -->
	<a href="<%=request.getContextPath()%>/post.jsp">이전으로</a>
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
