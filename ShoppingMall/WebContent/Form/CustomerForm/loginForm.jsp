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
	<%
		String msg = request.getParameter("msg");

		if (msg != null && msg.equals("0")) {
			out.println("<br>");
			out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
		} else if (msg != null && msg.equals("-1")) {
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
		}
	%>

</body>
</html>