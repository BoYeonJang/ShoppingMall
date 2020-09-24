<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<h1>로그아웃 되었습니다</h1><br>
	<h2>다시 로그인 하시겠습니까?</h2>
	<form action="/ShoppingMall/CustomerLoginServlet" method="post">
		<label>아이디: </label> <input type="text" name="id"><br>
		<label>비밀번호: </label> <input type="password" name="password"><br>
		<input type="submit" value="로그인">
	</form>
	<form action="inputForm.html" method="post">
		<input type="submit" value="가입하러 가기">
	</form>
</body>
</html>