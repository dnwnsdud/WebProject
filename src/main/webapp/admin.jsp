<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.adminDAO"%>
<%@ page import="dto.userDTO"%>
<%@ page import="java.util.List"%>

<%
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");
userDTO loggedInUser = (userDTO) session.getAttribute("loggedInUser");

if (loggedInUser.getUserID().equals("admin")) {
	// 세션에서 사용자 정보를 가져온 경우
} else {
	// 세션에서 사용자 정보를 가져오지 못한 경우
	response.sendRedirect("index.html");
}
adminDAO adminDao = new adminDAO();
List<userDTO> userList = adminDao.getAllUsers();
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
</head>
<body>

	<h2>User List</h2>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Password</th>
				<th>Name</th>
				<th>Nickname</th>
				<th>Email</th>
				<th>ResistNum</th>
				<th>Phone</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (userDTO user : userList) {
			%>
			<tr>
				<td><%=user.getUserID()%></td>
				<td><%=user.getUserPassword()%></td>
				<td><%=user.getUserName()%></td>
				<td><%=user.getUserNickName()%></td>
				<td><%=user.getUserEmail()%></td>
				<td><%=user.getUserResistNum()%></td>
				<td><%=user.getUserTel()%></td>
				<td>
					<form action="adminAction.jsp" method="post">
						<input type="hidden" name="action" value="delete"> <input
							type="hidden" name="userID" value="<%=user.getUserID()%>">
						<button type="submit">Delete</button>
					</form>

					<%-- <form action="adminAction.jsp" method="post">
						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="userID" value="<%=user.getUserID()%>">
						<button type="submit">Update</button>
					</form> --%>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>