<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 스크립틀릿을 쓰다보면 불편할때 --%>
	<%-- out. 내장객체를 이용해서 출력 --%>
	<%-- 스크립틀릿에서 출력이 매우 불편하다! --%>
	<%-- 표현식 => 스크립틀릿 왼쪽에 =을 적는다면 자동으로 처리하는 기능 --%>
	<%-- int a; --%>
	<%-- 액션 태그 --%>
	<%-- 스크립틀릿이나 지시어를 이용해서 복잡하게 작성해야되는 기능들중 몇개를 간단하게 이용할 수 있도록 --%>
	<%-- Integer.parseInt(request.getParameter("y")) --%>
	<jsp:useBean id="limit" class="com.jsp.test.bean" scope="request"></jsp:useBean>
	<!--<jsp:setProperty property="y" name="limit"/>-->
	<%-- setProperty에 value를 안넣으면 request.getParameter(property)값을 넣는다 --%>
	<%-- java bean문법 -> action tag를 이용한 bean 사용법은 정보를 그대로 이용하는 용도 --%>
	
	<%! public int a; %>
	<table>
		<%a = 5;
		for(int y = 0; y < limit.getY(); y += 1){ %>
			<tr>
				<%for(int x = 0; x < limit.getX();x+=1){ %>
					<td><%=x * y%></td>
				<%} %>
			</tr>
		<%} %>
	</table>
</body>
</html>