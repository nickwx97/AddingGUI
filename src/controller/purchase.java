package controller;

import java.io.IOException;
import java.util.regex.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart.*;

/**
 * Servlet implementation class purchase
 */
@WebServlet("/purchase")
public class purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public purchase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		dbProduct Item = new dbProduct();
		CartProduct product = Item.dbItem(Integer.parseInt(request.getParameter("productID")));
	
		
		Pattern p = Pattern.compile("\\d+");
		Matcher m = p.matcher(request.getParameter("qty"));
		
		if (!m.matches()){
			response.sendRedirect("Error.jsp?msg=Invalid+Quantity&prev=products.jsp");
			return;
		}
		
		int dbqty = product.getQty();
		int qty = Integer.parseInt(request.getParameter("qty"));

		product.setQty(qty);
		
		HttpSession session = request.getSession();
		
		if(dbqty >= qty && qty>0){
			
			if(session.getAttribute("cart") == null){
				ShoppingCart cart = new ShoppingCart(product);
				session.setAttribute("cart", cart);
			}else{
				ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
				cart.addToCart(product);
				session.setAttribute("cart", cart);
			}

			response.sendRedirect("displayCart.jsp");
			
		}else{
			response.sendRedirect("Error.jsp?msg=Invalid+Quantity&prev=products.jsp");
		}
	}

}
