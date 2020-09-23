<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="shopping.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllProductList</title>
</head>
<body>

	<% List<NoticeBoardVO> noticeBoardAllList = (List<NoticeBoardVO>)request.getAttribute("noticeBoardAllList"); %>
	<table>
		<thead>
			<tr>
				<td>No.</td>
				<td>Title</td>
				<td>Content</td>
			</tr>
		</thead>
		<% for(NoticeBoardVO notice : noticeBoardAllList) {%>
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