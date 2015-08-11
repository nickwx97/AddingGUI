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
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/MemberLoginServlet")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
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
		
		//get emails and password
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//validatation
		String emailRegex = "(?i)[a-z0-9!#$%&'*+/=?^_`{|}~.-]+@[a-z0-9-]+\\.([a-z0-9-]+)+(\\.[a-z0-9-]+)*"; 
		String passwordRegex = "(?i)^(?=.*[a-z])(?=.*\\d)[a-z\\d]{6,20}$";
		
		if(!email.matches(emailRegex)){
			response.sendRedirect("login.jsp?msg=Please enter a valid email address<br />");
			return;
		}else if(!password.matches(passwordRegex)){
			response.sendRedirect("login.jsp?msg=Password needs to be Alphanumeric with no special characters and at least 6 characters long.<br />");
			return;
		}
		
		//make the UserDetailsDB object and UserDetails object to retrieve info from database 
		UserDetailsDB db = new UserDetailsDB();
		UserDetails ud = db.getUserDetails(email, password);
		
//		System.out.println(ud.getUsertype());
		
		//check if ud is null, if null means user does not exist in database
		//if admin also push back to user login page as admin can't access their account
		if(ud==null || ud.getUsertype().equals("Administrator")){
			response.sendRedirect("login.jsp?email="+email+"&msg=Incorrect Login ID/Password");
		}else{
			//pass the information to the adminPage and set the session so info is persistant
			HttpSession session = request.getSession();
			session.setAttribute("userdetails", ud);
			response.sendRedirect("userMain.jsp");
		}
	}

}
