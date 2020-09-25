<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="shopping.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노팅힐-자켓 세부내용 페이지</title>
<link rel="stylesheet" href="/ShoppingMall/css/margin.css">
<link rel="stylesheet" href="/ShoppingMall/css/product_layout.css">
</head>
<body>
   <%@ include file="/header/header.jsp"%>
   <div class="product_layout">
      <div class="table">
         <%
            ProductVO product = (ProductVO) request.getAttribute("product");
         String userId = (String) session.getAttribute("customerId");
         %>
         <div class="product_image">
            <img
               src="/ShoppingMall/images/자켓/<%=product.getProductPicId()%>.png"
               alt="위의 이미지를 누르면 연결됩니다.">
         </div>
         <div class="product_info">
            <form action="orderDetailServlet">
               <div class="product_name">
                  <%=product.getProductName()%><br>
               </div>
               <hr>
               <div class="price">
                  판매가:
                  <%=product.getProductPrice()%><br>
               </div>
               <hr>
               <div class="number">
                  개수: <input type="text" name="count">
               </div>
               <div class="size">
                  사이즈: <input type="text" value=<%=product.getProductSize()%>
                     name="size">
               </div>
               <!-- 상품id값. 구매할 사람이 볼필요가 없기 때문에 hidden로 숨김 -->
               <input type="hidden" name="productId"
                  value=<%=product.getProductId()%>>
               <!-- 고객id값. 구매할 사람이 볼필요가 없기 때문에 hidden로 숨김 -->
               <input type="hidden" name="customerId" value=<%=userId%>>
               <hr>
               <div class="buy_button">
                  <input class="buy_button_input" type="submit" name="submit"
                     value="구매하기">
               </div>
               <div class="cart_button">
                  <input class="cart_button_input" type="submit" name="submit"
                     value="장바구니에 담기">
               </div>
            </form>
         </div>
      </div>
   </div>
</body>
</html>