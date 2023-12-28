<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:out value="Hello" default="기본값"/>
	<c:out value="Hello2">기본값2</c:out>
	<c:set var="i" value="0" scope="page"/>
	<c:set var="i" scope="page">0</c:set>
	<jsp:useBean id="limit" class="com.jsp.test.bean" scope="request"/> <%-- camel-case를 이용한 setter --%>
	<%-- <c:set target="limit" property="x" scope="page">0</c:set> --%>
	${i}
	<%-- <c:remove var="i" scope="page"/>--%>
	
	<%-- <c:if test="${i lt 10}" var="i" scope="page">판별식에 의한 if</c:if>--%>
	<c:catch var="error">
		<c:choose>
			<c:when test="${i eq 0}">${i}번일때</c:when>
			<c:when test="${i eq 2}">${i}번일때</c:when>
			<c:otherwise>아무것도아닐때</c:otherwise>	
		</c:choose>
	</c:catch>
	
	<c:forEach var="j" begin="0" end="10" step="2">
		${j}
	</c:forEach>
	<%int[] z = new int[4]; z[0] = 1; z[1] = 2; z[2] = 3; z[3] = 4; %>
	<c:forEach var="p" items="${z}" begin="0" end="2">
		${p}
	</c:forEach>
	<c:forTokens var="j" items="Hello;My;Hero" delims=";">
		${j}
	</c:forTokens>
	
	<%-- GET, POST도 가능했는데 POST는 보안상의 이유로 제거 --%>
	<c:url var="naver" value="https://www.naver.com/">
		<c:param name="id" value="아이디값"></c:param>
	</c:url>
	
	<c:import url="/include.jsp" var="in" scope="page">
		<c:param name="id" value="값"/>
	</c:import>
	
	<%-- <c:redirect url="https://www.naver.com/"/>--%>
	
	<a href="${naver}/1">abc</a>
	<a href="${naver}/2">abc</a>
	<a href="${naver}/3">abc</a>
	${in}
	

</body>
</html>











