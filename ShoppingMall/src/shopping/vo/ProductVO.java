package shopping.vo;

public class ProductVO {
	
	private String productName;
	private String productId;  
	private int productPrice;
	private String productSize;
	private String productType;
	
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	@Override
	public String toString() {
		return "product id: " + getProductId() + " product price: " + getProductPrice()
		+ " price size: " + getProductSize() + " price type: " + getProductType();
	}
	
	
	
	
	
	
	

}
