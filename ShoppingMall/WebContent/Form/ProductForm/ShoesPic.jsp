<%@page import="shopping.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>노팅힐-신발 세부 페이지</title>
=======
<title>노팅힐-신발</title>
>>>>>>> 404e68c679f2a3acb96678dc851b18cbcba36c78
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
<link rel="stylesheet" href="/ShoppingMall/css/product_layout.css">
</head>
<body>
<<<<<<< HEAD
   <%@ include file="/header/header.jsp"%>
   <div class="product_layout">
      <div class="table">
         <%
            ProductVO product = (ProductVO) request.getAttribute("product");
         String userId = (String) session.getAttribute("customerId");
         %>
         <div class="product_image">
            <img
               src="/ShoppingMall/images/신발/<%=product.getProductPicId()%>.png"
               alt="위의 이미지를 누르면 연결됩니다.">
         </div>
         <div class="product_info">
            <form action="orderDetailServlet">
               <div class="product_name">
                  <%=product.getProductName()%>
               </div>
               <hr>
               <div class="price">
                  판매가: <%=product.getProductPrice()%>
               </div>
               <hr>
               <div class="number">
                  개수: <input type="text" name="count">
               </div>
               <div class="size">
                  사이즈: <input type="text" value=<%=product.getProductSize()%> name="size">
               </div>
               <input type="hidden" name="productId" value=<%=product.getProductId()%>>
               <input type="hidden" name="customerId" value=<%=userId%>>
               <hr>
               <div class="buy_button">
                  <input class="buy_button_input" type="submit" value="구매하기" name="submit">
               </div>
               <div class="cart_button">
                  <input class="cart_button_input" type="submit" name="submit" value="장바구니에 담기">
               </div>
            </form>
         </div>
      </div>
   </div>
=======
	<%@ include file="/header/header.jsp"%>
	<div class="product_layout">
		<div class="table">
			<%
				ProductVO product = (ProductVO) request.getAttribute("product");
			String userId = (String) session.getAttribute("customerId");
			%>
			<div class="product_image">
				<img
					src="/ShoppingMall/images/신발/<%=product.getProductPicId()%>.png"
					alt="위의 이미지를 누르면 연결됩니다.">
			</div>
			<div class="product_info">
				<form action="orderDetailServlet">
					<div class="product_name">
						<%=product.getProductName()%>
					</div>
					<hr>
					<div class="price">
						판매가: <%=product.getProductPrice()%>
					</div>
					<hr>
					<div class="number">
						개수: <input type="text" name="count">
					</div>
					<div class="size">
						사이즈: <input type="text" value=<%=product.getProductSize()%> name="size">
					</div>
					<input type="hidden" name="productId" value=<%=product.getProductId()%>>
					<input type="hidden" name="customerId" value=<%=userId%>>
					<hr>
					<div class="buy_button">
						<input class="buy_button_input" type="submit" value="구매하기" name="submit">
					</div>
					<div class="cart_button">
						<input class="cart_button_input" type="submit" name="submit" value="장바구니에 담기">
					</div>
				</form>
			</div>
		</div>
	</div>
>>>>>>> 404e68c679f2a3acb96678dc851b18cbcba36c78
</body>
</html>