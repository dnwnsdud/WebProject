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
	response.sendRedirect("index.jsp");
}
adminDAO adminDao = new adminDAO();
List<userDTO> userList = adminDao.getAllUsers();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Page</title>

    <link rel="stylesheet" href="/resources/myrest.css" />
    <link rel="stylesheet" href="/resources/adminfix.css" />
  </head>
  <body>
    <header class="hd">
      <nav class="mw">
        <h1 class="logo">
          <a href="/index.jsp"
            ><img src="/resources/WATCHA_PEDIA_Logo_Main1.png" alt="" />
          </a>
        </h1>
      </nav>
    </header>
    <div class="wrap">
      <section class="con1">
        <div class="imw"><img src="/resources/person.png" alt="" /></div>
        <p>Admin</p>
        <p>관리자 페이지입니다</p>
        <div class="btn">
          <button>회원관리</button><br />
          <button>게시물관리</button><br />
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
					<form action="adminAction.jsp" method="post">
						<input type="hidden" name="action" value="delete"> 
						<input type="hidden" name="userID" value="<%=user.getUserID()%>">
						<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button>
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
        </table>

        <div class="move">
          <p>[1]</p>
        </div>
      </section>
    </div>
  </body>
</html>

