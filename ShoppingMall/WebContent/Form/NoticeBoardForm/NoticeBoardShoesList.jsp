<%@page import="java.util.List"%>
<%@page import="shopping.vo.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노팅힐-신발</title>
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
<link rel="stylesheet" href="/ShoppingMall/css/site_layout.css">
</head>
<body>
	<%
		List<NoticeBoardVO> noticeBoardShoesList = (List<NoticeBoardVO>) request.getAttribute("noticeBoardShoesList");
	%>
	<%@ include file="/header/header.jsp"%>
	<div class="site_layout">
		<div class="image_layout">
			<table>
				<%
					for (NoticeBoardVO notice : noticeBoardShoesList) {
				%>
				<tr>
					<td><a
						href="ShoesPicServlet?noticeTitle=<%=notice.getNoticeTitle()%>">
							<img
							src="/ShoppingMall/images/신발/<%=notice.getNoticePicId()%>.png"
							alt="위의 이미지를 누르면 연결됩니다.">
					</a></td>
				<tr>
					<td><%=notice.getNoticeTitle()%></td>
				</tr>
				<tr>
					<td><%=notice.getNoticeCont()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>