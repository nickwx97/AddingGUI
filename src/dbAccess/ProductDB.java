package dbAccess;

import dbAccess.Product;
import connection.CreateConnection;
import java.sql.*;

public class ProductDB {

	//method to insert product
	public boolean insertProduct(Product prod){
		
		try{
			
			CreateConnection connection = new CreateConnection();
			Connection conn = connection.getConnDB();
			
			String sqlInsertString = "Insert into product(productName,model,brand,category,productDesc,spec,price,qty,imgPath,owner) values(?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlInsertString);
			pstmt.setString(1, prod.getProductName());
			pstmt.setString(2, prod.getModel());
			pstmt.setString(3, prod.getBrand());
			pstmt.setString(4, prod.getCategory());
			pstmt.setString(5, prod.getProductDesc());
			pstmt.setString(6, prod.getSpec());
			pstmt.setDouble(7, prod.getPrice());
			pstmt.setInt(8, prod.getQty());
			pstmt.setString(9, prod.getImg());
			pstmt.setString(10, prod.getOwner());
			
			int recs = pstmt.executeUpdate();
			
			conn.close();
			
			if(recs==0){ //if 0 rows inserted means failed, i return false.
				return false;
			}else{
				return true;
			}
			
		}catch(Exception e){
			System.out.print(e);
			return false;
		}
	}
	
	//method to delete product
	public boolean deleteProduct(Product prod){
		
		try{
			
			CreateConnection connection = new CreateConnection();
			Connection conn = connection.getConnDB();
			
			String sqlDeleteString = "Delete from product where productID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlDeleteString);
			pstmt.setInt(1, prod.getProductID());
			
			int recs = pstmt.executeUpdate();
			
			conn.close();
			
			if(recs==0){ //if 0 rows deleted means failed, i return false.
				return false;
			}else{
				return true;
			}
			
		}catch(Exception e){
			System.out.print(e);
			return false;
		}
	}
	
	//method to update product
	public boolean updateProduct(Product prod){
		
		try{
			
			CreateConnection connection = new CreateConnection();
			Connection conn = connection.getConnDB();
			
			String sqlUpdateString = "Update product set productName=?,model=?,brand=?,category=?,productDesc=?,spec=?,price=?,qty=?,imgPath=?,owner=? where productID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlUpdateString);
			pstmt.setString(1, prod.getProductName());
			pstmt.setString(2, prod.getModel());
			pstmt.setString(3, prod.getBrand());
			pstmt.setString(4, prod.getCategory());
			pstmt.setString(5, prod.getProductDesc());
			pstmt.setString(6, prod.getSpec());
			pstmt.setDouble(7, prod.getPrice());
			pstmt.setInt(8, prod.getQty());
			pstmt.setString(9, prod.getImg());
			pstmt.setString(10, prod.getOwner());
			pstmt.setInt(11, prod.getProductID());
			
			int recs = pstmt.executeUpdate();
			
			conn.close();
			
			if(recs==0){ //if 0 rows updated means failed, i return false.
				return false;
			}else{
				return true;
			}
			
		}catch(Exception e){
			System.out.print(e);
			return false;
		}
	}
}
