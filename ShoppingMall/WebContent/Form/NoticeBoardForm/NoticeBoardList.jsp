<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="shopping.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductList</title>
</head>
<body>

	<% List<NoticeBoardVO> noticeBoardList = (List<NoticeBoardVO>)request.getAttribute("noticeBoardList"); %>
	<table>
		<thead>
			<tr>
				<td>No.</td>
				<td>Title</td>
				<td>Content</td>
			</tr>
		</thead>
		<% for(NoticeBoardVO notice : noticeBoardList) {%>
		<tbody>
			<tr>
				<td><%= notice.getNoticeNo()%></td>
				<td><%= notice.getNoticeTitle()%></td>
				<td><%= notice.getNoticeCont()%></td>
		</tbody>
		<%} %>
	
	
	</table>

</body>
</html>