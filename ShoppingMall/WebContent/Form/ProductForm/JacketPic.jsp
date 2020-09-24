<%@page import="shopping.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<% ProductVO product = (ProductVO) request.getAttribute("product"); %>

	<img src="/ShoppingMall/images/<%=product.getProductPicId()%>.png" alt="위의 이미지를 누르면 연결됩니다.">

	<form action ="/ShoppingMall/Form/OrderForm/orderForm.jsp"> 
	<%=product.getProductName()%><br>
	<%=product.getProductSize()%><br>
	<%=product.getProductPrice()%><br>
	개수: <input type="text" name="count">
	사이즈: <input type="text" value=<%=product.getProductSize()%> name="size">
	<input type="hidden" name="productId" value=<%=product.getProductId()%>><br>
	<input type="submit" value="구매하기"><br>
	</form>
	
	<form action="/ShoppingMall/Form/OrderForm/orderDetailForm.jsp">
		<input type="submit" value="장바구니에 담기"><br>
	</form>

</body>
</html>