package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbAccess.CategoryDB;
import dbAccess.Category;

/**
 * Servlet implementation class DeleteCategoryServlet
 */
@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategoryServlet() {
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
		
		int categoryID = Integer.parseInt(request.getParameter("deleteThisCat"));
		
		//create categoryDB and category object to delete from database
		//run the delete and store return result as boolean
		Category cat = new Category(categoryID);
		CategoryDB db = new CategoryDB();
		boolean success = db.deleteCategory(cat);
		
		//pass the information to a jsp
		String type = "deleteCat";
		request.setAttribute("result", success);
		request.setAttribute("type", type);
		RequestDispatcher rd = request.getRequestDispatcher("genericResultPage.jsp");
		rd.forward(request, response);
		
	}

}
