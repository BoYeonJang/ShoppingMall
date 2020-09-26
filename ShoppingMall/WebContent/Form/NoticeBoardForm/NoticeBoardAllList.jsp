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
<title>노팅힐-전체</title>
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
<link rel="stylesheet" href="/ShoppingMall/css/site_layout.css">
</head>
<body>
	<%
		List<NoticeBoardVO> noticeBoardAllList = (List<NoticeBoardVO>) request.getAttribute("noticeBoardAllList");
	%>
	<%@ include file="/header/header.jsp"%>
	<div class="site_layout">
		<div class="image_layout">
			<table>
				<%
					for (NoticeBoardVO notice : noticeBoardAllList) {
					String category = notice.getNoticeCategory();
					ProductDAO dao = new ProductDAO();
					ProductVO product = dao.getProductWithType(category);
				%>
				<tr>
					<td><img
						src="/ShoppingMall/images/<%=product.getProductType()%>/<%=notice.getNoticePicId()%>.png"
						alt="위의 이미지를 누르면 연결됩니다."></td>
				</tr>
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