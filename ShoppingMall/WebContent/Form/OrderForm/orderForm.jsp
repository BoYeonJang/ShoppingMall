<%@page import="shopping.vo.OrderDetailVO"%>
<%@page import="java.util.List"%>
<%@page import="shopping.dao.OrderDetailDAO"%>
<%@page import="shopping.dao.ProductDAO"%>
<%@page import="shopping.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>주문 페이지 </title>
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
	String pid="";
	pid=request.getParameter("productId");
	String count="";
	count=request.getParameter("count");
	String size="";
	size=request.getParameter("size");
	boolean dir=true;
	int price=0;
	int sprice=0;
	
	String userId="";
	userId=request.getParameter("userId");
	
	OrderDetailDAO dao = new OrderDetailDAO();
	List<OrderDetailVO> vo =dao.getOrderDetailList(userId);
	if(vo==null)
		dir = false;
	ProductDAO pdao = new ProductDAO();
	ProductVO pvo=new ProductVO();
	
	if(pid!="")
		pvo = pdao.getProductWithId(pid);
%>

<body>
		<!--================Checkout Area =================-->
  <section class="checkout_area section_padding">
    <div class="container">
      
    <form  action="order" class="row contact_form">
           
      <div class="billing_details">
        <div class="row">
          <div class="col-lg-8">
            <h3>Customer Details</h3>
           <!--   <form class="row contact_form" action="#" method="post" novalidate="novalidate">-->
              <div class="col-md-6 form-group p_star">
              <span class="billing_details">이름</span>
                 <input type="text" class="form-control" id="first" name="name" />
                
              </div>
              <div class="col-md-6 form-group p_star">
                <span class="billing_details">핸드폰 번호</span>
                <input type="text" class="form-control" id="number"  />
                
              </div>
            
              <div class="col-md-12 form-group p_star">
                <span class="billing_details">주소</span>
                <input type="text" class="form-control" id="add1" name="add" />
                
              </div>
              
              <div class="col-md-12 form-group">
                <div class="creat_account">
                  <h3>Shipping Details</h3>
                  <label for="f-option3">배송시 요청 사항</label>
                </div>
                <textarea class="form-control" name="message" id="message" rows="1"
                  placeholder="전달 사항"></textarea>
              </div>
            </form>
          </div>
          <div class="col-lg-4">
            <div class="order_box">
              <h2>Your Order</h2>
              <ul class="list">
                <li>
                  <a href="#">Product
                    <span>Total</span>
                  </a>
                </li>
                <%
                	if(dir)
                	{
                		for(OrderDetailVO s : vo){	
                		pvo=pdao.getProductWithId(s.getProductId());
                	 %>
                <li>
                  <a href="#"><%=pvo.getProductName() %>
                    <span class="middle"><%=s.getProductCount() %></span>
                    <span class="last"><%=pvo.getProductPrice() %></span>
                  </a>
                </li>
              <%
              
              	sprice+=(pvo.getProductPrice() * s.getProductCount());
                		} price=sprice; }else{ %>
                <li>
                  <a href="#"><%=pvo.getProductName() %>
                    <span class="middle"><%=count %></span>
                    <span class="last"><%=pvo.getProductPrice() %></span>
                  </a>
                </li>
                <% price+=(Integer.parseInt(count) * pvo.getProductPrice());
                } %>
              </ul>
              <ul class="list list_2">
                <li>
                  <a href="#">제품가격
                   <span><%=sprice %>원</span>
                  </a>
                </li>
                <li>
                  <a href="#">배송비
                    <span>기본 요금: 3000원</span>
                  </a>
                </li>
                <li>
                  <a href="#">결제 금액
                    <span><%=price + 3000 %>원</span>
                  </a>
                </li>
              </ul>
              <div class="payment_item">
                <div class="radion_btn">
                  <input type="radio" id="f-option5" name="method" />
                  <label for="f-option5">계좌이체</label>
                  <div class="check"></div>
                </div>
                <p>
                  	이연호 기업은행 653-087234-01-012
                </p>
              </div>
              <div class="payment_item active">
                <div class="radion_btn">
                  <input type="radio" id="f-option6" name="method" />
                  <label for="f-option6">카카오페이 </label>
                  <img src="img/product/single-product/card.jpg" alt="" />
                  <div class="check"></div>
                </div>
                <p>
                  	관리자에게 문의
                </p>
              </div>
              <div class="creat_account">
                <input type="checkbox" id="f-option4" name="selector" />
                <label for="f-option4">I’ve read and accept the </label>
                <a href="#">terms & conditions*</a>
              </div>
             <input type="hidden" name="userId" value="<%=userId%>">
             <input type="hidden" name="price" value="<%=price+3000%>">
             	<input type="submit" class="btn_3" value="결제하기">
             	
               <%-- <a class="btn_3" href="order?method=계좌이체&add=우리집&message=없음&userId=<%=userId %>&price=<%=price+3000%>">결제하기</a> --%>
          
            </div>
            
          </div>
          
        </div>
        
      </div>
      </form>
    </div>
    
  </section>
  
  <!--================End Checkout Area =================-->

	
	
	
	
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
    <script src="./assets/js/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    
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