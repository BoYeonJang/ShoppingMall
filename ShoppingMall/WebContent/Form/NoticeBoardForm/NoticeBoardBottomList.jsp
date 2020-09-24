<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
</head>
<body>
	<%
		List<NoticeBoardVO> noticeBoardBottomList = (List<NoticeBoardVO>) request.getAttribute("noticeBoardBottomList");
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
			for (NoticeBoardVO notice : noticeBoardBottomList) {
		%>
		<tbody>
			<tr>
<<<<<<< HEAD
				<td><a	href="BottomPicServlet?noticeTitle=<%=notice.getNoticeTitle()%>">
						<img src="/ShoppingMall/images/하의/<%=notice.getNoticePicId()%>.png"alt="위의 이미지를 누르면 연결됩니다.">	</a></td>
=======
				<td><a
					href="BottomPicServlet?noticeTitle=<%=notice.getNoticeTitle()%>">
						<img
						src="/ShoppingMall/images/하의/<%=notice.getNoticePicId()%>.png"
						alt="위의 이미지를 누르면 연결됩니다.">
				</a></td>
>>>>>>> d79872e7798d5d25d946e2db37e2737fc87efd43
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