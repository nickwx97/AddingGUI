package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbAccess.Product;
import dbAccess.ProductDB;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
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
		
		int prodID = Integer.parseInt(request.getParameter("deleteThisProd"));
		
		//create product and productDB object to delete product from database
		//store result in a boolean
		Product prod = new Product(prodID);
		ProductDB db = new ProductDB();
		
		boolean success = db.deleteProduct(prod);
		
		//pass info to a jsp
		String type = "deleteProd";
		request.setAttribute("result", success);
		request.setAttribute("type", type);
		RequestDispatcher rd = request.getRequestDispatcher("genericResultPage.jsp");
		rd.forward(request, response);
	}

}
