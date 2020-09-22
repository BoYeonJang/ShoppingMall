<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="/ShoppingMall/login" method="post">
		<label>아이디: </label> <input type="text" name="id"><br>
		<label>비밀번호: </label> <input type="text" name="password"><br>
		<input type="submit" value="로그인">
		<input type="submit" value="가입하러 가기">
	</form>
</body>
</html>