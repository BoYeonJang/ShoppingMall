<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="/ShoppingMall/css/input.css">
</head>
<body>
	<%@ include file="/header/header.jsp"%>
	<div class="login_page">
		<div class="form">
			<h3>회원 가입</h3>
			<form class="input_form" action="/ShoppingMall/addCustomer"
				method="post">
				<input class="button" type="text" placeholder="아이디"
					name="customerId"><br> <input class="button"
					type="password" placeholder="비밀번호" name="customerPassword"><br>
				<input class="button" type="text" placeholder="이름"
					name="customerName"><br> <input class="button"
					type="text" placeholder="성별" name="customerGender"><br>
				<input class="button" type="text" placeholder="전화번호"
					name="customerTel"><br> <input class="button"
					type="text" placeholder="주소" name="customerAddress"><br>
				<input class="button" type="text" placeholder="이메일"
					name="customerEmail"><br> <input
					class="register_button" type="submit" value="회원가입">
			</form>
		</div>
	</div>
	<%@ include file="/footer/footer.jsp"%>
</body>
</html>