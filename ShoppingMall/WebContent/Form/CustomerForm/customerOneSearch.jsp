<%@page import="shopping.vo.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/ShoppingMall/css/search.css">
</head>
<body>
	<%
		CustomerVO customer = (CustomerVO) request.getAttribute("customer");
	%>
	<%@ include file="/header/header.jsp"%>
	<div class="my_page">
		<h3>마이페이지</h3>
		<div class="member_info_size">
			<table>
				<tr>
					<td class="member">아이디</td>
					<td class="info"><%=customer.getId()%></td>
				</tr>
				<tr>
					<td class="member">비밀번호</td>
					<td class="info"><%=customer.getPassword()%></td>
				</tr>
				<tr>
					<td class="member">이름</td>
					<td class="info"><%=customer.getName()%></td>
				</tr>
				<tr>
					<td class="member">성별</td>
					<td class="info"><%=customer.getGender()%></td>
				</tr>
				<tr>
					<td class="member">전화번호</td>
					<td class="info"><%=customer.getTel()%></td>
				</tr>
				<tr>
					<td class="member">주소</td>
					<td class="info"><%=customer.getAddress()%></td>
				</tr>
				<tr>
					<td class="member">이메일</td>
					<td class="info"><%=customer.getEmail()%></td>
				</tr>
			</table>
		</div>
		<table>
			<tr>
				<td><a
					href="CustomerUpdateFormServlet?customerId=<%=customer.getId()%>"><input
						class="update_button" type="submit" value="회원정보수정"></a></td>
			</tr>
			<tr>
				<td><a href="deleteCustomer?customerId=<%=customer.getId()%>"><input
						class="delete_button" type="submit" value="회원탈퇴"></a></td>
			</tr>
		</table>
	</div>
</body>
</html>