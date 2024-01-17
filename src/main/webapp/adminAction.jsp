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
        // Uncomment the following lines if you want to include update functionality
        // else if (action.equals("update")) {
        //     String userID = request.getParameter("userID");
        //     String newPassword = request.getParameter("newPassword");
        //     String newName = request.getParameter("newName");
        //     String newNickname = request.getParameter("newNickname");
        //     String newEmail = request.getParameter("newEmail");
        //     String newResistNum = request.getParameter("newResistNum");
        //     String newTel = request.getParameter("newTel");
        //     adminDao.updateUserInfo(userID, newPassword, newName, newNickname, newEmail, newResistNum, newTel);
        // }
    }
    
    // Redirect back to adminPage.jsp
    response.sendRedirect("admin.jsp");
%>