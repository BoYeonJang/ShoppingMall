<%@page import="java.util.ArrayList"%>
<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
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
		ArrayList<NoticeBoardVO> noticeBoardShoesList = (ArrayList<NoticeBoardVO>) request.getAttribute("noticeBoardShoesList");
	%>
	<%@ include file="/header/header.jsp"%>
	<div class="site_layout">
		<div class="image_layout">
			<table>
				<tr>
					<%
						for (int i = 0; i < noticeBoardShoesList.size(); i++) {
					%>
					<td><a
						href="BottomPicServlet?noticeTitle=<%=noticeBoardShoesList.get(i).getNoticeTitle()%>">
							<img
							src="/ShoppingMall/images/신발/<%=noticeBoardShoesList.get(i).getNoticePicId()%>.png"
							alt="위의 이미지를 누르면 연결됩니다.">
					</a></td>
					<%
						}
					%>
				</tr>
				<tr>
					<%
						for (int i = 0; i < noticeBoardShoesList.size(); i++) {
					%>
					<td><%=noticeBoardShoesList.get(i).getNoticeTitle()%><br>
						<%=noticeBoardShoesList.get(i).getNoticeCont()%></td>
					<%
						}
					%>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file="/footer/footer.jsp"%>
</body>
</html>