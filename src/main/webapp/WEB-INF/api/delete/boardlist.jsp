<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, org.json.*"%>
<%@ page import="com.jsp.dao.*, com.jsp.dto.*, com.jsp.system.DBConnector"%>

<%-- 게시글 작성 api 제작 --%>
<%-- 게시글 삭제 api 제작 --%>
<%-- 작성은 유저 name과 유저 password를 받아서 해당 유저인지 판별 후 아니면 Reject --%>
<%-- 맞다면 받아온 title로 해당 유저의 게시글로 작성 --%>
<%-- 게시글 삭제는 유저 name과 유저 password로 해당 유저인지 판별 후 아니면 Reject --%>
<%-- 맞다변 받아온 board id 로 삭제 --%>

<%
	try(DBConnector con = new DBConnector();){
		if( ! request.getMethod().equalsIgnoreCase("GET")) throw new Exception();
		BoardDAO map = con.OpenMap(request, BoardDAO.class);
		
		BoardUser user = 
				map.getBoardUserCheck(request.getParameter("id"), request.getParameter("pw"));
		if(user == null) throw new Exception();
		
		map.deleteBoard(Integer.parseInt(request.getParameter("board_id")));
		
		response.getWriter().write("Succeed!");
	}
	catch(Exception e) {
		response.getWriter().write("잘못된 접속이거나 정보를 전달하였습니다.");
	}
%>