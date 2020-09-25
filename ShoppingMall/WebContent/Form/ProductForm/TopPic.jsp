<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="shopping.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상의 세부 내용 페이지 입니다</title>

<link rel="stylesheet" href="/ShoppingMall/css/margin.css">

</head>
<body>


<%@ include file="/header/header.jsp"%>

<div class="table">
<% ProductVO product = (ProductVO) request.getAttribute("product");
	String userId=(String)session.getAttribute("customerId");
	
%>

		<img src="/ShoppingMall/images/상의/<%=product.getProductPicId()%>.png"
			alt="위의 이미지를 누르면 연결됩니다.">


	<form action ="orderDetail">  
	<%=product.getProductName()%><br>
	<%=product.getProductSize()%><br>
	<%=product.getProductPrice()%><br>
	개수: <input type="text" name="count">
	사이즈: <input type="text" value=<%=product.getProductSize()%> name="size">
	<input type="hidden" name="productId" value=<%=product.getProductId()%>><br>
	<input type="hidden" name="customerId" value=<%=userId%>><br>
	<input type="submit" value="구매하기" name="submit"><br>
	
		<input type="submit" name="submit"value="장바구니에 담기"><br>
	</form>
</div>

</body>
</html>