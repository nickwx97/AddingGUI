package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbAccess.UserDetails;
import dbAccess.UserDetailsDB;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUserServlet() {
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
		
		
		String userid = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		
		
		//need to validate
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		//need to concate
		String dob = year+"-"+month+"-"+day;
		
		
		
		
		String address = request.getParameter("address");
		int contactNum = Integer.parseInt(request.getParameter("number"));
		int secQ = Integer.parseInt(request.getParameter("secQ"));
		String secA = request.getParameter("secA");
		
		//create userdetails and userdetailsdb object to store user
		//store result in boolean
		UserDetails ud = new UserDetails(userid, password, email, firstName, lastName, dob, address, contactNum, secQ, secA);
		UserDetailsDB db = new UserDetailsDB();
		
		boolean success = db.insertUser(ud);
		
		
		//pass the information to a jsp
		String type = "createUser";
		request.setAttribute("result", success);
		request.setAttribute("type", type);
		RequestDispatcher rd = request.getRequestDispatcher("genericResultPage.jsp");
		rd.forward(request, response);
	}

}
