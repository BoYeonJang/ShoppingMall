<%@page import="shopping.vo.OrderDetailVO"%>
<%@page import="shopping.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="shopping.dao.OrderDetailDAO"%>
<%@page import="shopping.vo.ProductVO"%>
<%@page import="shopping.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>장바구니 </title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="manifest" href="site.webmanifest">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

  <!-- CSS here -->
      <link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
      <link rel="stylesheet" href="assets/css/flaticon.css">
      <link rel="stylesheet" href="assets/css/slicknav.css">
      <link rel="stylesheet" href="assets/css/animate.min.css">
      <link rel="stylesheet" href="assets/css/magnific-popup.css">
      <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
      <link rel="stylesheet" href="assets/css/themify-icons.css">
      <link rel="stylesheet" href="assets/css/slick.css">
      <link rel="stylesheet" href="assets/css/nice-select.css">
      <link rel="stylesheet" href="assets/css/style.css">
</head>
<%
	String userId=(String)request.getAttribute("userId");
	
	OrderDetailVO vo = new OrderDetailVO();		
	vo=(OrderDetailVO)request.getAttribute("detail");
	
	OrderDetailDAO dao = new OrderDetailDAO();
	List<OrderDetailVO> lvo = dao.getOrderDetailList(userId);
	if(vo!=null)
		lvo.add(vo);
	ProductDAO pdao = new ProductDAO();
	
%>
<body>
	<form action= "orderForm.jsp" >
    <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Product</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
              </tr>
            </thead>
            <tbody>
            <%for(OrderDetailVO ovo : lvo){
            	ProductVO pvo = pdao.getProductWithId(ovo.getProductId());
            	%>
              <tr>
                <td>
                  <div class="media">
                    <div class="d-flex">
                      <img src="/ShoppingMall/images/<%=pvo.getProductType() %>/<%=pvo.getProductPicId() %>" alt="" />
                    </div>
                    <div class="media-body">
                      <p ><%=pvo.getProductName() %></p>
                      <span class="btn_1" href="delOrderDetail?uid=<%=userId%>&pid=<%=ovo.getProductId()%>">삭제</span>
                    </div>
                  </div>
                </td>
                <td>
                  <h5><%=pvo.getProductPrice() %>만원</h5>
                </td>
                <td>
                  <div class="product_count">
                    <!-- <input type="text" value="1" min="0" max="10" title="Quantity:"
                      class="input-text qty input-number" />
                    <button
                      class="increase input-number-increment items-count" type="button">
                      <i class="ti-angle-up"></i>
                    </button>
                    <button
                      class="reduced input-number-decrement items-count" type="button">
                      <i class="ti-angle-down"></i>
                    </button> -->
                    <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                    <input class="input-number" type="text" id="count" name="count" value="1" min="0" max="10">
                    <span class="input-number-increment"> <i class="ti-plus" ></i></span>
                  </div>
                </td>
                <td>
                  <h5><%=ovo.getPrice() %>만원</h5>
                </td>
              </tr>
            
            <%} %>
            </tbody>
          </table>
          <div class="checkout_btn_inner float-right">
          	<a class="btn_1" href="/ShoppingMall/index.html">쇼핑 계속하기</a>
          	<input type="submit" value="결제하기" class ="btn_1">
          </div>
        </div>
      </div>
  </section>
 
 </form>
 
 
 <!-- JS here -->

    <!-- All JS Custom Plugins Link Here here -->
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    
    <!-- Scrollup, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
    
          
</body>
</html>