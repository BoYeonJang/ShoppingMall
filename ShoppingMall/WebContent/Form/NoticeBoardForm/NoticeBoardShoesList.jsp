<%@page import="java.util.List"%>
<%@page import="shopping.vo.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신발 리스트 페이지 입니다</title>
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
</head>
<body>
	<%
		List<NoticeBoardVO> noticeBoardShoesList = (List<NoticeBoardVO>) request.getAttribute("noticeBoardShoesList");
	%>
	<%@ include file="/header/header.jsp"%>
	<table>
		<thead>
			<tr>
				<td>Pic</td>
				<td>No.</td>
				<td>Title</td>
				<td>Content</td>
			</tr>
		</thead>
		<%
			for (NoticeBoardVO notice : noticeBoardShoesList) {
		%>
		<tbody>
			<tr>
				<td><a
					href="ShoesPicServlet?noticeTitle=<%=notice.getNoticeTitle()%>">
						<img
						src="/ShoppingMall/images/신발/<%=notice.getNoticePicId()%>.png"
						alt="위의 이미지를 누르면 연결됩니다.">
				</a></td>
				<td><%=notice.getNoticeNo()%></td>
				<td><%=notice.getNoticeTitle()%></td>
				<td><%=notice.getNoticeCont()%></td>
				<%
					}
				%>
			
		</tbody>
	</table>
</body>
</html>