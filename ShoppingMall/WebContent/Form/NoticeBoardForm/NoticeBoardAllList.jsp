<%@page import="shopping.dao.ProductDAO"%>
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
	<%
		List<NoticeBoardVO> noticeBoardAllList = (List<NoticeBoardVO>) request.getAttribute("noticeBoardAllList");
	%>
	<%@ include file="/header/header.jsp"%>
	<table>
		<thead>
			<tr>
				<td>No.</td>
				<td>Title</td>
				<td>Content</td>
			</tr>
		</thead>
		<%
			for (NoticeBoardVO notice : noticeBoardAllList) {
			String category = notice.getNoticeCategory();
			ProductDAO dao = new ProductDAO();
			ProductVO product = dao.getProductWithType(category);
		%>
		<tbody>
			<tr>
				<td><img
					src="/ShoppingMall/images/<%=product.getProductType()%>/<%=notice.getNoticePicId()%>.png"
					alt="위의 이미지를 누르면 연결됩니다."></td>
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