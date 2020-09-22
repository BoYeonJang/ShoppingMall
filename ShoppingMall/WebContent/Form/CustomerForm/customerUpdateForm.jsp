<%@page import="shopping.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
</head>
<body>
<% CustomerVO customer = (CustomerVO)request.getAttribute("customerInfo"); %>
	<h1>정보 수정</h1>
	<form action="/ShoppingMall/updateCustomer">
		<label>아이디: </label> <input type="text" name="customerId" value="<%=customer.getId()%>" readonly="readonly"><br>
		<label>비밀번호: </label> <input type="text" name="customerPassword" value="<%=customer.getPassword()%>"><br>
		<label>이름: </label> <input type="text" name="customerName" value="<%=customer.getName()%>"><br>
		<label>성별: </label> <input type="text" name="customerGender" value="<%=customer.getGender()%>"><br>
		<label>전화번호: </label> <input type="text" name="customerTel" value="<%=customer.getTel()%>"><br>
		<label>주소: </label> <input type="text" name="customerAddress" value="<%=customer.getAddress()%>"><br>
		<label>이메일: </label> <input type="text" name="customerEmail" value="<%=customer.getEmail()%>"><br>
		<input type="reset" value="다시 쓰기">
		<input type="submit" value="정보 수정">
	</form>
</body>
</html>