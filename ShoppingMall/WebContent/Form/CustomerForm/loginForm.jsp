<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/ShoppingMall/css/login.css">
</head>
<body>
	<%@ include file="/header/header.jsp"%>
	<div class="login_page">
		<div class="form">
			<h3>가입하신 아이디와 비밀번호를 입력해주세요.</h3>
			<form class="login_form" action="/ShoppingMall/StartShoppingServlet" method="post">
				<input type="text" placeholder="id" name="id"><br> <input
					type="password" placeholder="password" name="password"><br>
				<input class="login_button" type="submit" value="로그인">
			</form>
			<form class="register_form"
				action="/ShoppingMall/Form/CustomerForm/inputForm.jsp" method="post">
				<input type="submit" value="회원가입하기">
			</form>
		</div>
	</div>
</body>
</html>