<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노팅힐</title>
</head>
<body>
	<%@ include file="header/header.jsp"%>
	<%
		response.sendRedirect("/ShoppingMall/NoticeBoardAllListServlet");
	%>
</body>
</html>