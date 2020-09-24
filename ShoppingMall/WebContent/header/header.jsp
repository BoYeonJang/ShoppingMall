<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/ShoppingMall/css/header.css">

<header>
	<div class="nav">
		<div class="topArea">
			<div id="topQuick" class="layout_customer">
				<ul>
					<li><a href="/ShoppingMall/Form/CustomerForm/loginForm.jsp">로그인</a></li>
					<li><a href="/ShoppingMall/Form/CustomerForm/inputForm.html">회원가입</a></li>
					<li><a href="">마이페이지</a></li>
					<li><a href="">장바구니</a></li>
				</ul>
			</div>
		</div>
		<br>
		<hr>
		<div id="image" class="layout_image">
			<a href=/ShoppingMall/index.jsp> <img class="main_image"
				src="/ShoppingMall/images/main/main_image.png" alt="노팅힐">
			</a>
		</div>
		<hr>
		<div class="sidebar">
			<div id="category" class="layout_category">
				<ul>
					<li><a href="NoticeBoardAllListServlet">전체</a></li>
					<li><a href="NoticeBoardTopListServlet">상의</a></li>
					<li><a href="NoticeBoardJacketListServlet">자켓</a></li>
					<li><a href="NoticeBoardBottomListServlet">하의</a></li>
					<li><a href="NoticeBoardShoesListServlet">신발</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>