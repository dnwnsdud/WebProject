<%@ page language="java" contentType="application/json"; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jsp.dao.*,com.jsp.dto.*, com.jsp.system.DBConnector"%>
<%@ page import="java.util.*, org.json.*"%>


	<% 
	try(DBConnector con = new DBConnector();){
		UserDAO map = con.OpenMap(request, UserDAO.class);
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(request.getQueryString() == null){
			List<User> exec = map.getuserAll();
			result.put("data", exec);
		}
		/* else if(request.getParameter("id") != null){
			BoardUser exec = 
					map.getBoardUserById(Integer.parseInt(request.getParameter("id")));
			result.put("data", exec);
		}
		else if(request.getParameter("name") != null){
			BoardUser exec = 
					map.getBoardUserByName(request.getParameter("name"));
			result.put("data", exec);
		} */
		
		response.getWriter().write(new JSONObject(result).toString());
		
		
	}
	catch(Exception e) {}
	%>
