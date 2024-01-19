<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.adminDAO"%>
<%@ page import="dto.userDTO"%>
<%@ page import="java.util.List"%>

<%
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");

adminDAO adminDao = new adminDAO();
int pageSize = 10; // 페이지당 표시할 회원 수
int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

List<userDTO> userList = adminDao.getUsersWithPagination((currentPage - 1) * pageSize, pageSize);
int totalUsers = adminDao.getTotalUsersCount();
int totalPages = (int) Math.ceil((double) totalUsers / pageSize);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<link rel="stylesheet" href="/resources/myrest.css" />
<link rel="stylesheet" href="/resources/adminfix.css" />
</head>
<body>
	<header class="hd">
		<nav class="mw">
			<h1 class="logo">
				<a href="./index.jsp"><img
					src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" /></a>
			</h1>
		</nav>
	</header>
	<div class="wrap">
		<section class="con1">
			<div class="imw">
				<img src="/resources/person.png" alt="" />
			</div>
			<p>Admin</p>
			<p>관리자 페이지입니다</p>
			<div class="btn">
				<button>회원관리</button>
				<br />
				<button>게시물관리</button>
				<br />
			</div>
		</section>
		<section class="con2">
			<table>
				<thead>
					<tr class="fix">
						<th>ID</th>
						<th>Password</th>
						<th>Name</th>
						<th>Nickname</th>
						<th>Email</th>
						<th>ResistNum</th>
						<th>Phone</th>
						<th>회원 삭제</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (userDTO user : userList) {
					%>
					<tr class="fix2">
						<td><%=user.getUserID()%></td>
						<td><%=user.getUserPassword()%></td>
						<td><%=user.getUserName()%></td>
						<td><%=user.getUserNickName()%></td>
						<td><%=user.getUserEmail()%></td>
						<td><%=user.getUserResistNum()%></td>
						<td><%=user.getUserTel()%></td>
						<td>
							<form action="./adminAction.jsp" method="post">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="userID" value="<%=user.getUserID()%>">
								<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
							</form>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div class="pagination">
				<%
				if (currentPage > 1) {
				%>
				<a href="admin2.jsp?page=<%=currentPage - 1%>">이전</a>
				<%
				}
				%>

				<%
				for (int i = 1; i <= totalPages; i++) {
				%>
				<a href="admin2.jsp?page=<%=i%>"
					<%=(i == currentPage) ? "class='active'" : ""%>><%=i%></a>
				<%
				}
				%>

				<%
				if (currentPage < totalPages) {
				%>
				<a href="admin2.jsp?page=<%=currentPage + 1%>">다음</a>
				<%
				}
				%>
			</div>
		</section>
	</div>
</body>
</html>