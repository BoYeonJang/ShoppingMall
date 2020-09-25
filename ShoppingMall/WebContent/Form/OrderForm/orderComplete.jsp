<%@page import="java.util.ArrayList"%>
<%@page import="shopping.dao.ProductDAO"%>
<%@page import="shopping.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="shopping.vo.OrderDetailVO"%>
<%@page import="shopping.vo.OrderVO"%>
<%@page import="shopping.dao.OrderDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>결제완료 </title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="manifest" href="site.webmanifest">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<!-- CSS here -->
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/owl.carousel.min.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/flaticon.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/slicknav.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/animate.min.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/magnific-popup.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/fontawesome-all.min.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/themify-icons.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/slick.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/nice-select.css">
      <link rel="stylesheet" href="./Form/OrderForm/assets/css/style.css">
</head>
<style>
#s{
	display : flex;
	margin-top: 7vh;
	justify-content : center;
}
</style>
<%
	Cookie[] cookies =request.getCookies();
	String userId="";
	int orderNumber=0;
	
	String cnt="";
	String pprice="";
	String pname="";
	
	cnt=(String)request.getAttribute("cnt");
	pprice=(String)request.getAttribute("pprice");
	pname=(String)request.getAttribute("pname");
	if(cookies != null)
	{
		for(Cookie cookie : cookies)
		{
			String id=URLDecoder.decode(cookie.getName(),"utf-8");
			if(id.equals("userId"))
				{
					userId = cookie.getValue();
				}else if(id.equals("orderNumber"))
				{
					orderNumber=Integer.parseInt(cookie.getValue());
				}
		}	
	}
	OrderDAO dao = new OrderDAO();
	OrderVO ov = dao.getOrder(orderNumber);
	System.out.println(ov.getOrderNumber());
	ProductDAO pdao= new ProductDAO();
	List<OrderDetailVO> lvo =new ArrayList<OrderDetailVO>();
	
	if(request.getAttribute("lvo")!=null)
		lvo=(List<OrderDetailVO>)request.getAttribute("lvo");
	int price=0;
%>
<body>
	<section class="confirmation_part section_padding">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="confirmation_tittle">
            <span>감사합니다. 결제가 완료되었습니다.</span>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>주문정보</h4>
            <ul>
              <li>
                <p>주문 번호</p><span>: <%=ov.getOrderNumber() %></span>
              </li>
              <li>
                <p>주문 날짜</p><span>: <%=ov.getOrderDate() %></span>
              </li>
              <li>
                <p>결제 금액</p><span>: <%=ov.getTotalPrice() %></span>
              </li>
              <li>
                <p>결제 방법</p><span>: <%=ov.getPayMethod() %></span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>shipping Address</h4>
            <ul>
              <li>
                <p>주소</p><span>: <%=ov.getAddress() %></span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="order_details_iner">
            <h3>Order Details</h3>
            <table class="table table-borderless">
              <thead>
                <tr>
                  <th scope="col" colspan="2">Product</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Total</th>
                </tr>
              </thead>
              <tbody>
              <% System.out.println("111"+lvo.size());
              System.out.println("pname"+pname);
              if(lvo.size()!=0)	{
              	for(OrderDetailVO vo : lvo){
            	  ProductVO pvo=pdao.getProductWithId(vo.getProductId());
              %>
                <tr>
                  <th colspan="2"><span><%=pvo.getProductName() %></span></th>
                  <th><%=vo.getProductCount() %>개</th>
                  <th> <span><%=vo.getProductPrice() %>원</span></th>
                </tr>
                   <%price +=(vo.getProductCount() * vo.getProductPrice());} 
              }else
              {
           %>
            <tr>
                  <th colspan="2"><span><%=pname %></span></th>
                  <th><%=cnt %>개</th>
                  <th> <span><%=pprice %>원</span></th>
                </tr>
                <% price=Integer.parseInt(cnt) * Integer.parseInt(pprice);} %>
                  <th colspan="3">제품가격</th>
                  <th> <span><%=price %>원</span></th>
                </tr>
                <tr>
                  <th colspan="3">배송비</th>
                  <th><span>기본요금: 3000원</span></th>
                </tr>
              </tbody>
           
              <tfoot>
                <tr>
                  <th scope="col" colspan="3">Total</th>
                  <th scope="col"><%=ov.getTotalPrice() %></th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
      <a class="btn_3" id="s" href="/ShoppingMall/index.jsp">계속 쇼핑하기</a>
    </div>
  </section>
	
	
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