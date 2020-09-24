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

	<%
		List<NoticeBoardVO> noticeBoardBottomList = (List<NoticeBoardVO>) request.getAttribute("noticeBoardBottomList");
	%>
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
				<td><a
					href="BottomPicServlet?noticeTitle=<%=notice.getNoticeTitle()%>">
						<img src="images/bottom/<%=notice.getNoticePicId()%>.png"
						alt="위의 이미지를 누르면 연결됩니다.">
				</a></td>
				<td><%=notice.getNoticeNo()%></td>
				<td><%=notice.getNoticeTitle()%></td>
				<td><%=notice.getNoticeCont()%></td>
				<%
					}
				%>
			
		</tbody>
		<td><a href="index.html">메인 화면으로</a></td>


	</table>

</body>
</html>