package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbAccess.Category;
import dbAccess.CategoryDB;

/**
 * Servlet implementation class UpdateCategoryServlet
 */
@WebServlet("/UpdateCategoryServlet")
public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategoryServlet() {
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
		
		String catName = request.getParameter("catName").trim();
		String catDesc = request.getParameter("catDesc").trim();
		int catID = Integer.parseInt(request.getParameter("catID"));
		
		//create category and categoryDB object for update
		//use a boolean to store result after update
		Category cat = new Category(catName, catDesc, catID);
		CategoryDB db = new CategoryDB();
		
		boolean success = db.updateCategory(cat);
		
		//pass the information to a jsp
		String type = "updateCat";
		request.setAttribute("result", success);
		request.setAttribute("type", type);
		RequestDispatcher rd = request.getRequestDispatcher("genericResultPage.jsp");
		rd.forward(request, response);
	}

}
