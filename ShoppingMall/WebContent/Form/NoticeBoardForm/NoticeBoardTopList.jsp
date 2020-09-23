<%@page import="shopping.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeBoardTopList</title>
</head>
<body>


	<% List<NoticeBoardVO> noticeBoardTopList = (List<NoticeBoardVO>)request.getAttribute("noticeBoardTopList"); %>
	<table>
		<thead>
			<tr>
				<td>Pic</td>
				<td>No.</td>
				<td>Title</td>
				<td>Content</td>
			</tr>
		</thead>
		<% for(NoticeBoardVO notice : noticeBoardTopList) {%>
		<tbody>
			<tr>
				<td><a href="TopPicServlet?noticeTitle=<%=notice.getNoticeTitle()%>"> 
					<img src="images/<%=notice.getNoticePicId()%>.png" alt="위의 이미지를 누르면 연결됩니다."> <a></td>
				<td><%= notice.getNoticeNo()%></td>
				<td><%= notice.getNoticeTitle()%></td>
				<td><%= notice.getNoticeCont()%></td>
		<%} %>
		</tbody>
		<td><a href="index.html">메인 화면으로</a></td>
	
	
	</table>


</body>
</html>