<%@page import="shopping.vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>
</head>
<body>

<% CustomerVO customer = (CustomerVO)request.getAttribute("customer"); %>
	<h1>회원 목록</h1>
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>이메일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=customer.getId()%></td>
				<td><%=customer.getPassword()%></td>
				<td><%=customer.getName()%></td>
				<td><%=customer.getGender()%></td>
				<td><%=customer.getTel()%></td>
				<td><%=customer.getAddress()%></td>
				<td><%=customer.getEmail()%></td>
				<td><a href="updateFormCustomer?customerId=<%=customer.getId()%>">수정</a></td>
				<td><a href="deleteCustomer?customerId=<%=customer.getId()%>">삭제</a></td><br>
			</tr>
		</tbody>
	</table>
</body>
</html>