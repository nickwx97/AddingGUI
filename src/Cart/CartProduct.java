package Cart;

public class CartProduct {
	private String productName;
	private String model;
	private String brand;
	private String category;
	private double price; 
	private int qty;
	private int productID;
	
	public CartProduct( int productID ,String productName, String model, String brand,
			String category, double price, int qty) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.model = model;
		this.brand = brand;
		this.category = category;
		this.price = price;
		this.qty = qty;
	}

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	
	
}
