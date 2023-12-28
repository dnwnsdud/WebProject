<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

<%-- 게시글을 유저 아이디로 검색하는 기능(포함) --%>
<%-- 게시글을 번호로 검색하는 기능(정확) --%>
<%-- 게시글을 가져오면 테이블로 게시글번호, 게시글 타이틀, 작성자명 으로 띄워주는 페이지 --%>
<%-- 	단, 한 페이지당 5개로 제한하며 페이지 번호로 검색 --%>
<%-- Ajax란 JS를 이용해서 서버에서 정보를 가져오는 작업을 위한 기능 --%>

<%
	try(DBConnector con = new DBConnector();){
		BoardDAO map = con.OpenMap(request, BoardDAO.class);
		List<Board> exec = null;
		
 		if(request.getParameter("searchtype") == null || 
				request.getParameter("searchtype").equalsIgnoreCase("all"))
			exec = map.getBoardAll();
		else if(request.getParameter("searchtype").equalsIgnoreCase("title"))
			exec = map.getBoardByTitle(request.getParameter("title"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", exec);
		response.getWriter().write(new JSONObject(result).toString());
	}
	catch(Exception e) {}
%>