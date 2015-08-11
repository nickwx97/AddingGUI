package dbAccess;

import java.sql.*;

import connection.CreateConnection;
import dbAccess.UserDetails;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;

public class UserDetailsDB {
	
	//for admin login
	public UserDetails getAdminDetails(String userid, String password){
		try{
		//create connection from java class
		CreateConnection connection = new CreateConnection();
		Connection conn = connection.getConnDB();
		
		String sql = "call verifyUser(?,?)";
		CallableStatement cs = conn.prepareCall(sql);
		cs.setString(1, userid);
		cs.setString(2, password);
		ResultSet rs = cs.executeQuery();
		
	
		if (rs.next()) {
			//get usertype from db
			String usertype = rs.getString("usertype"); 
			
			//create UserDetail object and store userid and usertype
			UserDetails ud = new UserDetails(userid, usertype);
			conn.close();
			return ud;
		}
		
		conn.close();
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
		return null;
	}
	
	//for user login
	public UserDetails getUserDetails(String email, String password){
		try{
		//create connection from java class
		CreateConnection connection = new CreateConnection();
		Connection conn = connection.getConnDB();
		
		String sql = "call verifyUser(?,?)";
		CallableStatement cs = conn.prepareCall(sql);
		cs.setString(1, email);
		cs.setString(2, password);
		ResultSet rs = cs.executeQuery();		
	
		if (rs.next()) {
			//get usertype from db
			//get userid from db
			String usertype = rs.getString("usertype");
			String userid = rs.getString("username");
			
			//create UserDetail object and store userid and usertype
			UserDetails ud = new UserDetails(email, userid, usertype);
			conn.close();
			return ud;
		}
		
		conn.close();
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
		return null;
	}
	
	//insert user
	public boolean insertUser(UserDetails ud){
		
		try{
			//create connection to database
			CreateConnection connection = new CreateConnection();
			Connection conn = connection.getConnDB();
			
			//the user type is always user and is active
			String insertUserString = "Insert into user (username, password, email, firstName, lastName, dob, address, contactNum, securityQuestionNumber, securityAnswer, usertype, active) values (?,?,?,?,?,?,?,?,?,?,'User','active') ";
			
			PreparedStatement pstmt = conn.prepareStatement(insertUserString);
			pstmt.setString(1, ud.getUserid());
			pstmt.setString(2, ud.getPassword());
			pstmt.setString(3, ud.getEmail());
			pstmt.setString(4, ud.getFirstName());
			pstmt.setString(5, ud.getLastName());
			pstmt.setString(6, ud.getDob());
			pstmt.setString(7, ud.getAddress());
			pstmt.setInt(8, ud.getContactNum());
			pstmt.setInt(9, ud.getSecQ());
			pstmt.setString(10, ud.getSecA());
			
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
	
	//update user
		public boolean updateUser(UserDetails ud){
			
			try{
				//create connection to database
				CreateConnection connection = new CreateConnection();
				Connection conn = connection.getConnDB();
					
					
				//the user type is always user and is active
				String insertUserString = "Update user set username=?, firstName=?, lastName=?, dob=?, address=?, contactNum=?, password=? where email=?";
				
				PreparedStatement pstmt = conn.prepareStatement(insertUserString);
				pstmt.setString(1, ud.getUserid());
				pstmt.setString(2, ud.getFirstName());
				pstmt.setString(3, ud.getLastName());
				pstmt.setString(4, ud.getDob());
				pstmt.setString(5, ud.getAddress());
				pstmt.setInt(6, ud.getContactNum());
				pstmt.setString(7, hashStr(ud.getPassword()));
				pstmt.setString(8, ud.getEmail());
				
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
		
		//check password
		public boolean checkPassword(UserDetails ud){
			try{
				//create connection to database
				CreateConnection connection = new CreateConnection();
				Connection conn = connection.getConnDB();
				
				//check user password
				String checkPassString = "select password from user where email=?";
				PreparedStatement passstmt = conn.prepareStatement(checkPassString);
				passstmt.setString(1, ud.getEmail());
				ResultSet rs = passstmt.executeQuery();
				rs.next(); //only 1 result should be returned

				
				String hash = hashStr(ud.getPassword());
				
				//if password is correct do update of user details
				if(rs.getString("password").equals(hash)){
					return true;
				}else{
					return false;
				}
			}catch(Exception e){
				System.out.println(e);
				return false;
			}
		}
		
		public static String hashStr(String password) throws NoSuchAlgorithmException{
			//hash password
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());
			
			byte byteData[] = md.digest();
			String hash = DatatypeConverter.printHexBinary(byteData).toLowerCase(); //because md5 hash in mysql is lowercase
			return hash;
			
		}

}
