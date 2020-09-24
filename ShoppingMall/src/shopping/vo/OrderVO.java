package shopping.vo;

public class OrderVO {
	private int orderNumber;
	private String userId;
	private int totalPrice;
	private String orderDate;
	private String address;
	private String payMethod;
	
	
	

	public int getOrderNumber() {
		return orderNumber;
	}




	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public int getTotalPrice() {
		return totalPrice;
	}




	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}




	public String getOrderDate() {
		return orderDate;
	}




	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getPayMethod() {
		return payMethod;
	}




	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}






	@Override
	public String toString() {
		return "주문번호 : "+orderNumber + "아이디  : "+userId + " 주문가격 : "+totalPrice+" 주문 날짜 : "+
				orderDate + " 배송주소 : " + address +" 지불방법 : "+ payMethod;
	}

}
