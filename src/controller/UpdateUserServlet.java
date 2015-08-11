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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
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
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String newPassCheck = request.getParameter("newPassCheck");
		
		String passRegex = "(?i)^(?=.*[a-z])(?=.*\\d)[a-z\\d]{6,20}$";
		
		//oldPass cannot be empty
		if(oldPass.equals("")){
			response.sendRedirect("memberProfile.jsp?msg=Please key in your password.<br />");
			return;
		}else if(!oldPass.matches(passRegex)){
			response.sendRedirect("memberProfile.jsp?msg=Password needs to be Alphanumeric with no special characters and at least 8 characters long.<br />");
			return;
		}
		
		String finalPass = oldPass;
		boolean newPassEmpty = true;
		
		//check newPass
		if(!newPass.equals("")){
			newPassEmpty = false;
			
			if(newPassCheck.equals("")){
				response.sendRedirect("memberProfile.jsp?msg=Please don't leave field empty.<br />");
				return;
			}else if(!newPassCheck.equals(newPass)){
				response.sendRedirect("memberProfile.jsp?msg=Passwords don't match.<br />Please check if you have keyed in the same password.<br />");
				return;
			}else if(!newPass.matches(passRegex)){
				response.sendRedirect("memberProfile.jsp?msg=New password needs to be Alphanumeric with no special characters and at least 8 characters long.<br />");
				return;
			}else if(newPass.equals(oldPass)){
				response.sendRedirect("memberProfile.jsp?msg=New password cannot be the same as old password.<br />");
				return;
			}else{
				finalPass = newPass;
			}
		}
		
		if(!newPassCheck.equals("") && newPassEmpty){
			response.sendRedirect("memberProfile.jsp?msg=Please don't leave field empty.<br />");
			return;
		}
		
		
		String firstName = request.getParameter("firstname").trim();
		String lastName = request.getParameter("lastname").trim();
		
		
		//need to validate
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		//need to concate
		String dob = year+"-"+month+"-"+day;
		
		
		String address = request.getParameter("address").trim();
		
		//Store as string for validation first
		String contactString = request.getParameter("number");
		
		String email = request.getParameter("email");
		
		
		//other validation
		//alphanumeric, cannot pure numeric, 6 to 45 characters
		String alphanumericRegex = "(?i)^[0-9a-zA-Z]{6,45}$";
		//day
		String dayRegex = "^([1-2][0-9]|[3][0-1]|[1-9])$";
		//month
		String monthRegex = "^([1][0-2]|[1-9])$";
		//year
		String yearRegex = "^[0-9]{4}$";
		//number 
		String numberRegex = "^[0-9]{8}$";
		//white space
		String whiteRegex = "^\\s+$";
		
		
		if(userid.equals("") || firstName.equals("") || lastName.equals("") || year.equals("") || address.equals("") || contactString.equals("") || userid.matches(whiteRegex) || firstName.matches(whiteRegex) || lastName.matches(whiteRegex) || year.matches(whiteRegex) || address.matches(whiteRegex) || contactString.matches(whiteRegex)){
			response.sendRedirect("memberProfile.jsp?msg=Please don't leave empty field(s).<br />");
			return;
		}else if(!userid.matches(alphanumericRegex)){
			response.sendRedirect("memberProfile.jsp?msg=Username needs to be 6 to 45 characters long without special charaters.<br />");
			return;
		}else if(!day.matches(dayRegex) || !year.matches(yearRegex) || !month.matches(monthRegex)){
			response.sendRedirect("memberProfile.jsp?msg=Please enter a proper date.<br />");
			return;
		}else if(!contactString.matches(numberRegex)){
			response.sendRedirect("memberProfile.jsp?Please enter a proper Contact number.<br />");
			return;
		}
		
		//convert to int if validation pass
		int contactNum = Integer.parseInt(contactString);
		
		
		//check user password correct or not
		UserDetails udPass = new UserDetails();
		udPass.setPassword(oldPass);
		udPass.setEmail(email);
		UserDetailsDB db = new UserDetailsDB();
		boolean correctPass = db.checkPassword(udPass);
		
		//if correct pass received do update user
		if(correctPass){
			//create userdetails and userdetailsdb object to store user
			//store result in boolean
			UserDetails ud = new UserDetails(userid, finalPass, firstName, lastName, dob, address, contactNum, email);
			
			boolean success = db.updateUser(ud);
			
			
			//pass the information to a jsp
			String type = "updateUser";
			request.setAttribute("result", success);
			request.setAttribute("type", type);
			RequestDispatcher rd = request.getRequestDispatcher("genericResultPage.jsp");
			rd.forward(request, response);
		}else{
			response.sendRedirect("memberProfile.jsp?msg=Wrong pass");
		}
		
	}

}
