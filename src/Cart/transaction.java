package Cart;

import java.sql.*;

import com.mysql.jdbc.Connection;

import connection.CreateConnection;

public class transaction {
	private int transactionID;
	private int productID;
	private int qty;
	private double price;
	private String userID;
	
	public int getNewTransactionID() throws Exception{
		CreateConnection connection = new CreateConnection();
		Connection conn = (Connection) connection.getConnDB();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select transactionID from sales");
		
		if(rs.last()){
			return rs.getInt("transactionID") + 1;
		}else return 1;
	}
	
	public void saveTrans(){
		try{
			CreateConnection connection = new CreateConnection();
			Connection conn = (Connection) connection.getConnDB();
			
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("insert into sales(transactionID,productID,qty,price,userID,date) values("+this.getTransactionID()+","+this.getProductID()+","+this.getQty()+","+this.getPrice()+",'"+this.getUserID()+"',current_date())");
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	public transaction(int transactionID, int productID, int qty, double price,
			String userID) {
		super();
		this.transactionID = transactionID;
		this.productID = productID;
		this.qty = qty;
		this.price = price;
		this.userID = userID;
	}
	public transaction() {
		// TODO Auto-generated constructor stub
	}

	public int getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(int transactionID) {
		this.transactionID = transactionID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
}
