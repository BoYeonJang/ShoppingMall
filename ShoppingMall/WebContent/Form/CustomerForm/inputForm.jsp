<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 정보 입력</title>
</head>
<body>
	<%@ include file="/header/header.jsp"%>
	<h1>가입 정보 입력</h1>
	<form action="/ShoppingMall/addCustomer" method="post">
		<label>아이디: </label> <input type="text" name="customerId"><br>
		<label>비밀번호: </label> <input type="text" name="customerPassword"><br>
		<label>이름: </label> <input type="text" name="customerName"><br>
		<label>성별: </label> <input type="text" name="customerGender"><br>
		<label>전화번호: </label> <input type="text" name="customerTel"><br>
		<label>주소: </label> <input type="text" name="customerAddress"><br>
		<label>이메일: </label> <input type="text" name="customerEmail"><br>
		<input type="reset" value="다시 쓰기"> <input type="submit"
			value="회원 가입 완료">
	</form>
</body>
</html>