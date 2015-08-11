package dbAccess;

import connection.CreateConnection;
import dbAccess.Category;
import java.sql.*;

public class CategoryDB {
	
	
	//method to insert category
	public boolean insertCategory(Category cat){
		
		try{
			CreateConnection connection = new CreateConnection();
			Connection conn = connection.getConnDB();
			
			String sqlInsertString = "insert into productcat(categoryName, categoryDesc) values (?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlInsertString);
			pstmt.setString(1, cat.getCategoryName());
			pstmt.setString(2, cat.getCategoryDesc());
			
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
	
	//method to delete category
	public boolean deleteCategory(Category cat){
		
		try{
			CreateConnection connection = new CreateConnection();
			Connection conn = connection.getConnDB();
			
			String sqlDeleteString = "delete from productcat where categoryID = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlDeleteString);
			pstmt.setInt(1, cat.getCategoryID());
			
			int recs=pstmt.executeUpdate();
			
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
	
	//method to update category
	public boolean updateCategory(Category cat){
		
		try{
			CreateConnection connection = new CreateConnection();
			Connection conn = connection.getConnDB();
			
			String sqlUpdateString = "Update productcat set categoryName=?,categoryDesc=? where categoryID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sqlUpdateString);
			pstmt.setString(1, cat.getCategoryName());
			pstmt.setString(2, cat.getCategoryDesc());
			pstmt.setInt(3, cat.getCategoryID());
			
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
