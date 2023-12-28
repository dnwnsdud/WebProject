<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" isErrorPage="false"%>
<%@ page import="javax.servlet.RequestDispatcher, javax.servlet.http.Cookie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체</title>
</head>
<body>
	<%-- page -> 내장 정보를 모두 포함하고 있는, 자기 자신이다. --%>
	<%-- request -> 요청 --%>
	<%-- <%-- <% request.getContentType(); %>
	<% request.getParameter("ID"); %>
	<% request.getParameterNames(); %>
	<% request.getParameterValues("Datas"); %>
	<% request.getParameterMap(); %>
	<% request.getMethod(); %>
	<% request.getHeader("Content-Disposition"); %>
	Referer, User-Agent, Host(localhost:9999)
	<% request.getHeaderNames(); %>
	<% request.getHeaders("Content-Disposition"); %>;별로 분리
	<% request.setAttribute("Key", "Value"); %>
	<% request.getAttribute("Key"); %>
	<% request.removeAttribute("Key"); %>
	<% request.getRemoteAddr(); request.getRemoteHost(); %> 192.168.0.1
	<% request.getCookies(); %>
	<% request.getSession(); %> 매개변수도 존재, boolean
	<% request.getContextPath(); %> server.xml Context path="/"
	<% request.getInputStream(); %>
	<% request.getLocale(); request.getLocales(); %> euc-kr, en, ko-kr
	<% request.getCharacterEncoding(); %> 일반적으로는 자동으로 UTF-8
	<% request.getServletPath();%>
	<% request.getServletContext();%>
	<% request.getPathInfo(); %> /A/B/C.jsp
	<% request.getParts(); %>
	<% request.getPart("file"); %> multipart/form-data
	<% 
		Part part = request.getPart("file");
		part.getInputStream();
		part.getContentType(); // MIME 타입을 알아보겠다
		part.getSize(); // 크기
		part.getHeader("Content-Disposition"); // 따로 붙어있는 헤더를 가져오겠다
		part.getName(); // 헤더에서 filename 부분을 추출
		part.write("/a.bmp"); // 파일을 저장하겠다
		part.delete(); // 파일을 삭제하겠다
		part.getSubmittedFileName(); // 사용자가 사용하던 파일명 
	%>
	<% request.getRequestURL(); request.getRequestURI(); %>
	<%
		RequestDispatcher patcher = request.getRequestDispatcher("/index.jsp");
		patcher.forward(request, response);
		patcher.include(request, response);
	%>
	<% request.isSecure(); %>   --%><%-- HTTPS 여부 --%>
	
<%-- 	<% response.setContentType("text/html"); %>
	<% response.setCharacterEncoding("utf-8"); %>
	<% response.getWriter().append("out 내장 객체를 구하는 메서드"); %>
	<% out.append("다를바가 없다"); %>
	<% response.getOutputStream(); %> 전송하면 무조건 안전하게 전송이 된다? X
	<% response.sendRedirect("/test.html"); %> 해당 페이지로 이동 --%>
	<%-- <% response.sendError(9000, "Over 9000!"); %>
	<% response.setStatus(200); %>
	<% response.addCookie(new Cookie("key","value")); %>
	<% response.addHeader("Key", "value"); %>
	<% response.setHeader("key", "value"); %>
	<% response.setIntHeader("key", 5); %> Date, Double --%>
	
	<%-- <% session.getAttribute("Key"); %>
	<% session.getAttributeNames(); %>
	<% session.removeAttribute("Key"); %>
	<% session.removeValue("Key"); %>
	<% session.getId(); %>
	<% session.isNew(); %>
	<% session.getCreationTime(); %>
	<% session.getLastAccessedTime(); %>
	<% session.getMaxInactiveInterval(); %>
	<% session.setMaxInactiveInterval(1800); %>
	<% session.invalidate(); %> 세션에는 만료 기한을 현재로 변경 --%>
	
	<%-- <% application.getAttribute("Key"); %>
	<% application.getAttributeNames(); %>
	<% application.setAttribute("Key","value"); %>
	<% application.removeAttribute("Key"); %>
	<% application.getInitParameter("초기화 파라미터"); %>
	<% application.getInitParameterNames(); %>
	<% application.getContext("/test.html"); %>
	<% application.getContextPath(); %>
	<% application.getMimeType("/index.html"); %>
	<% application.getRequestDispatcher("/index.html"); %>
	<% application.log("로그"); %> --%> <%-- console.log();  --%>
	<%-- 속도가 조금더 빠르다. System.out은 모든 출력을 제어 --%>
	<%-- <% pageContext.getAttribute("Key"); %>
	<% pageContext.getAttributeNamesInScope(0); %>
	<% pageContext.setAttribute("Key","value"); %>
	<% pageContext.removeAttribute("Key"); %> --%>
	<%-- <% pageContext.getSession(); %>
	<% pageContext.getRequest(); %>
	<% pageContext.getResponse(); %>
	<% pageContext.getPage(); %>
	<% pageContext.getOut(); %>
	<% pageContext.forward(); %>
	<% pageContext.include(); %> --%>
	<% pageContext.getServletContext(); %>
	
</body>
</html>
















