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
 * Servlet implementation class InsertCategoryServlet
 */
@WebServlet("/InsertCategoryServlet")
public class InsertCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCategoryServlet() {
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
		
		//create categoryDB and category object to insert into database
		//run the insert and store return result as boolean
		CategoryDB db = new CategoryDB();
		Category cat = new Category(catName, catDesc);
		boolean success = db.insertCategory(cat);
		
		//pass the information to a jsp
		String type = "insertCat";
		request.setAttribute("result", success);
		request.setAttribute("type", type);
		RequestDispatcher rd = request.getRequestDispatcher("genericResultPage.jsp");
		rd.forward(request, response);
		
		
	}

}
