package dbAccess;

public class Category {

	private String categoryName;
	private String categoryDesc;
	private int categoryID;
	
	//constructor with only name and desc
	//used for insert
	//because categoryID is auto incremental
	public Category(String categoryName, String categoryDesc) {
		super();
		this.categoryName = categoryName;
		this.categoryDesc = categoryDesc;
	}
	
	//constructor with only categoryID
	//used for delete	
	public Category(int categoryID) {
		super();
		this.categoryID = categoryID;
	}
	
	//constructor with all parameter
	//used for update
	public Category(String categoryName, String categoryDesc, int categoryID) {
		super();
		this.categoryName = categoryName;
		this.categoryDesc = categoryDesc;
		this.categoryID = categoryID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDesc() {
		return categoryDesc;
	}

	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
}
