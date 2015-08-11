package Cart;

import java.sql.*;

import connection.CreateConnection;



public class dbProduct {
	
	public dbProduct(){}
	
	public CartProduct dbItem(int i){
		
		CreateConnection connection = new CreateConnection();
		Connection conn;
		try {
			
			conn = connection.getConnDB();
			String sql = "select productName,model,brand,category,price,qty,productID from product where productID = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			CartProduct product = new CartProduct(rs.getInt("productID"),rs.getString("productName"),rs.getString("model"),rs.getString("brand"),rs.getString("category"),rs.getDouble("price"), rs.getInt("qty"));
			conn.close();
			return product;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int dbUpdate(int qty, int productID){
		CreateConnection connection = new CreateConnection();
		Connection conn;
		
		try{
			conn = connection.getConnDB();
			
			int x = dbItem(productID).getQty();
			qty = x-qty;
			
			String sql = "update product set qty=? where productID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, productID);
            int y = pstmt.executeUpdate();
			conn.close();
			return y;
		}catch (Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
}
