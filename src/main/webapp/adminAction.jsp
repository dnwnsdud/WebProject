<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.adminDAO" %>

<%
    String action = request.getParameter("action");
    
    if (action != null) {
        adminDAO adminDao = new adminDAO();
        
        if (action.equals("delete")) {
            String userID = request.getParameter("userID");
            adminDao.deleteUser(userID);
        } 
       
    }
    

    response.sendRedirect("admin.jsp");
%>