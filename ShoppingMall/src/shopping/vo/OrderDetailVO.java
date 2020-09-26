package shopping.vo;

public class OrderDetailVO {
	  private String userId;
	
		private String productId;
		private String productOption;
		private int productCount;
		private int productPrice;
		private int price;
		
		public String getProductOption() {
			return productOption;
		}
		public void setProductOption(String productOption) {
			this.productOption = productOption;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		
		
		public String getProductId() {
			return productId;
		}
		public void setProductId(String productId) {
			this.productId = productId;
		}
		public int getProductCount() {
			return productCount;
		}
		public void setProductCount(int productCount) {
			this.productCount = productCount;
		}
		public int getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(int productPrice) {
			this.productPrice = productPrice;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
}
