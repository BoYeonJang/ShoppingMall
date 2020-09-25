<%@page import="shopping.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신발 세부 내용 페이지 입니다</title>

<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
</head>
<body>

	<%@ include file="/header/header.jsp"%>
	<div class="table">
		<%
			ProductVO product = (ProductVO) request.getAttribute("product");
		%>
		<%
			String getCustomerId = (String) session.getAttribute("customerId");//이런식으로 로그인이 된 세션에서 사용자 아이디를 가져올 수 있다 (로그인 된 동안에는 우지할 수 있다)
		%>

		<img src="/ShoppingMall/images/신발/<%=product.getProductPicId()%>.png"
			alt="위의 이미지를 누르면 연결됩니다.">

		<form action="/ShoppingMall/Form/OrderForm/orderForm.jsp">
			<%=product.getProductName()%><br>
			<%=product.getProductSize()%><br>
			<%=product.getProductPrice()%><br> 개수: <input type="text"
				name="count"> 사이즈: <input type="text"
				value=<%=product.getProductSize()%> name="size"> <input
				type="hidden" name="productId" value=<%=product.getProductId()%>><br>
			<input type="hidden" name="customerId" value=<%=getCustomerId%>><br>
			<input type="submit" value="구매하기"><br>
		</form>

		<form action="/ShoppingMall/Form/OrderForm/orderDetailForm.jsp">
			<input type="submit" value="장바구니에 담기"><br>
		</form>
	</div>
</body>
</html>