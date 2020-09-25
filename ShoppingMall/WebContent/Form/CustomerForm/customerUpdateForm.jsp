<%@page import="shopping.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="/ShoppingMall/css/update.css">
</head>
<body>
	<%
		CustomerVO customer = (CustomerVO) request.getAttribute("customerInfo");
	
		
	%>
	<%@ include file="/header/header.jsp"%>
	<div class="update_page">
		<h3>회원정보수정</h3>
		<div class="member_info_size">
			<form class="update_form" action="updateCustomer" method="post">
				<table>
					<tr>
						<td class="member">아이디</td>
						<td class="info"><input class="info_button" type="text"
							value="<%=customer.getId()%>" name="customerId" readonly></td>
					</tr>
					<tr>
						<td class="member">비밀번호</td>
						<td class="info"><input class="info_button" type="text"
							value="<%=customer.getPassword()%>" name="customerPassword"></td>
					</tr>
					<tr>
						<td class="member">이름</td>
						<td class="info"><input class="info_button" type="text"
							value="<%=customer.getName()%>" name="customerName"></td>
					</tr>
					<tr>
						<td class="member">성별</td>
						<td class="info"><input class="info_button" type="text"
							value="<%=customer.getGender()%>" name="customerGender"></td>
					</tr>
					<tr>
						<td class="member">전화번호</td>
						<td class="info"><input class="info_button" type="text"
							value="<%=customer.getTel()%>" name="customerTel"></td>
					</tr>
					<tr>
						<td class="member">주소</td>
						<td class="info"><input class="info_button" type="text"
							value="<%=customer.getAddress()%>" name="customerAddress"></td>
					</tr>
					<tr>
						<td class="member">이메일</td>
						<td class="info"><input class="info_button" type="text"
							value="<%=customer.getEmail()%>" name="customerEmail"></td>
					</tr>
				</table>
			
		</div>
		<table>
			<tr>
				<td>
						<input class="update_button" type="submit" value="회원정보수정하기">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>