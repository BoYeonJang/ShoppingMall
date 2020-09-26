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
</head>
<body>
	<%
		List<NoticeBoardVO> noticeBoardAllList = (List<NoticeBoardVO>) request.getAttribute("noticeBoardAllList");
	%>
	<%@ include file="/header/header.jsp"%>
	<table>
		<tbody>
			<tr>
				<%
					int count = 0;
				for (int i = 0; i < noticeBoardAllList.size(); i++) {
					String category = noticeBoardAllList.get(i).getNoticeCategory();
					ProductDAO dao = new ProductDAO();
					ProductVO product = dao.getProductWithType(category);
				%>
				<td><img
					src="/ShoppingMall/images/<%=product.getProductType()%>/<%=noticeBoardAllList.get(i).getNoticePicId()%>.png"
					alt="위의 이미지를 누르면 연결됩니다."> <%
 	count++;
 if (count % 4 == 0) {
 %>
			<tr>
			</tr>
			<%
				count = 0;
			}
			}
			%>
			</td>
			</tr>

			<tr>
				<%
					int count2 = 0;
				for (int i = 0; i < noticeBoardAllList.size(); i++) {
					String category = noticeBoardAllList.get(i).getNoticeCategory();
					ProductDAO dao = new ProductDAO();
					ProductVO product = dao.getProductWithType(category);
				%>
				<td><%=noticeBoardAllList.get(i).getNoticeNo()%><br> <%=noticeBoardAllList.get(i).getNoticeTitle()%><br>
					<%=noticeBoardAllList.get(i).getNoticeCont()%> <%
 	count2++;

 if (count2 % 4 == 0) {
 %>
			<tr>
			</tr>
			<%
				count2 = 0;
			}
			}
			%>

			</td>
			</tr>
			<br>
		</tbody>
	</table>
	<%@ include file="/footer/footer.jsp"%>
</body>
</html>