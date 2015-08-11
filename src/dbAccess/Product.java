package dbAccess;

public class Product {

	private String productName;
	private String model;
	private String brand;
	private String category;
	private String productDesc;
	private String spec;
	private double price; 
	private int qty;
	private String img;
	private String owner;
	private int productID;
	
	//constructor without productID as it is auto incremental in database
	//used for insert
	public Product(String productName, String model, String brand,
			String category, String productDesc, String spec, double price,
			int qty, String img, String owner) {
		super();
		this.productName = productName;
		this.model = model;
		this.brand = brand;
		this.category = category;
		this.productDesc = productDesc;
		this.spec = spec;
		this.price = price;
		this.qty = qty;
		this.img = img;
		this.owner = owner;
	}
	
	//constructor with productID only
	//used for delete
	public Product(int productID) {
		super();
		this.productID = productID;
	}

	//constructor with all parameter
	//used for update
	public Product(String productName, String model, String brand,
			String category, String productDesc, String spec, double price,
			int qty, String img, String owner, int productID) {
		super();
		this.productName = productName;
		this.model = model;
		this.brand = brand;
		this.category = category;
		this.productDesc = productDesc;
		this.spec = spec;
		this.price = price;
		this.qty = qty;
		this.img = img;
		this.owner = owner;
		this.productID = productID;
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

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}
	
	
	
}
