<%@page import="java.util.ArrayList"%>
<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노팅힐-상의</title>
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
<link rel="stylesheet" href="/ShoppingMall/css/site_layout.css">
</head>
<body>
	<%
		ArrayList<NoticeBoardVO> noticeBoardTopList = (ArrayList<NoticeBoardVO>) request.getAttribute("noticeBoardTopList");
	%>
	<%@ include file="/header/header.jsp"%>
	<div class="site_layout">
		<div class="image_layout">
			<table>
				<tr>
					<%
						for (int i = 0; i < noticeBoardTopList.size(); i++) {
					%>
					<td><a
						href="BottomPicServlet?noticeTitle=<%=noticeBoardTopList.get(i).getNoticeTitle()%>">
							<img
							src="/ShoppingMall/images/상의/<%=noticeBoardTopList.get(i).getNoticePicId()%>.png"
							alt="위의 이미지를 누르면 연결됩니다.">
					</a></td>
					<%
						}
					%>
				</tr>
				<tr>
					<%
						for (int i = 0; i < noticeBoardTopList.size(); i++) {
					%>
					<td><%=noticeBoardTopList.get(i).getNoticeTitle()%><br> <%=noticeBoardTopList.get(i).getNoticeCont()%></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>