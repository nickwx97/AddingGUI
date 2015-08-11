package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbAccess.UserDetails;
import dbAccess.UserDetailsDB;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//get userid and password
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		//validate
		String useridRegex = "(?i)^[0-9a-zA-Z]{4,45}$";
		String alphanumericNoSymbol = "(?i)^(?=.*[a-z])(?=.*\\d)[a-z\\d]{6,20}$";
		
		
		//if it's proper userid
		if(!userid.matches(useridRegex)){
			response.sendRedirect("adminLogin.jsp?msg=Please enter a valid username<br />");
			return;
		}
		
		
		//check if password is 8charcters long, 20characters max, alphanumric
		if(!password.matches(alphanumericNoSymbol)){
			response.sendRedirect("adminLogin.jsp?msg=Please enter your password<br />Password needs to be Alphanumeric with no special characters and at least 6 characters long.<br />");
			return;
		}
		
		
		
		//make the UserDetailsDB object and UserDetails object to retrieve info from database 
		UserDetailsDB db = new UserDetailsDB();
		UserDetails ud = db.getAdminDetails(userid, password);
		
		
		//check if ud is null, if null means user does not exist in database
		if(ud==null){
			response.sendRedirect("adminLogin.jsp?userid="+userid+"&msg=Incorrect Login ID/Password");
		}else{
			//pass the information to the adminPage and set the session so info is persistant
			HttpSession session = request.getSession();
			session.setAttribute("userdetails", ud);
			response.sendRedirect("adminMain.jsp");
		}
		
	}

}
