<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<% List<NoticeBoardVO> noticeBoardJacketList = (List<NoticeBoardVO>)request.getAttribute("noticeBoardJacketList"); %>
	<table>
		<thead>
			<tr>
				<td>No.</td>
				<td>Title</td>
				<td>Content</td>
			</tr>
		</thead>
		<% for(NoticeBoardVO notice : noticeBoardJacketList) {%>
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