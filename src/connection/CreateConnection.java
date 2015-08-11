
package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class CreateConnection {

	public Connection getConnDB() throws Exception{
		
		try{
		//Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL ="jdbc:mysql://localhost/ead?user=root&password=root"; //here need to change the root password. the jspg also need to change 

		// Step 3: Establish connection to URL
		Connection conn =   DriverManager.getConnection(connURL);
		
		return conn;
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
		
	}
	
	
}
