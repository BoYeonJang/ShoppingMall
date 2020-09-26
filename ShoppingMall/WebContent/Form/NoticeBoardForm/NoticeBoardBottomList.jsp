<%@page import="java.util.ArrayList"%>
<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노팅힐-하의</title>
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
<link rel="stylesheet" href="/ShoppingMall/css/site_layout.css">
</head>
<body>
	<%
		ArrayList<NoticeBoardVO> noticeBoardBottomList = (ArrayList<NoticeBoardVO>) request
			.getAttribute("noticeBoardBottomList");
	%>
	<%@ include file="/header/header.jsp"%>
	<div class="site_layout">
		<div class="image_layout">
			<table>
				<tr>
					<%
						for (int i = 0; i < noticeBoardBottomList.size(); i++) {
					%>
					<td><a
						href="BottomPicServlet?noticeTitle=<%=noticeBoardBottomList.get(i).getNoticeTitle()%>">
							<img
							src="/ShoppingMall/images/하의/<%=noticeBoardBottomList.get(i).getNoticePicId()%>.png"
							alt="위의 이미지를 누르면 연결됩니다.">
					</a></td>
					<%
						}
					%>
				</tr>
				<tr>
					<%
						for (int i = 0; i < noticeBoardBottomList.size(); i++) {
					%>
					<td><%=noticeBoardBottomList.get(i).getNoticeTitle()%><br>
						<%=noticeBoardBottomList.get(i).getNoticeCont()%></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>