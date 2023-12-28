<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jsp.system.Ajax, org.json.*" %>
<%-- 사용자 정보 획득 api --%>
<%-- 관리자 정보 획득 api --%>
<%-- 관리자 정보를 획득해서 화면을 보여주는 관리자 페이지 jsp --%>
<%-- 사용자 정보를 획득해서 화면을 보여주는 사용자 페이지 jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
	div{
		display:inline-block;
	}
	div.id, div.author{
		width:100px;
	}
	div.title{
		width:600px;
	}
</style>
<script defer src="/resources/boardlist.js"></script>
</head>
<body>
	<div id="boards">
		<template>
			<div class="id">0</div>
			<div class="title">제목</div>
			<div class="author">작성자</div>
		</templte>
	</div>
</body>
</html>