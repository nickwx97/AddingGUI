package controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart.CartProduct;
import Cart.ShoppingCart;
import Cart.dbProduct;

/**
 * Servlet implementation class UpdateCart
 */
@WebServlet("/UpdateCart")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCart() {
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
		
		Pattern p = Pattern.compile("\\d+");
		Matcher m = p.matcher(request.getParameter("changeQty"));
		
		if (!m.matches()){
			response.sendRedirect("displayCart.jsp");
			return;
		}
		
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int changeQty = Integer.parseInt(request.getParameter("changeQty"));
		
		HttpSession session = request.getSession();
		
		if(session == null){
			response.sendRedirect("product.jsp");
			return;
		}
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		CartProduct product = cart.getCartItems(cartNo);
		
		dbProduct check = new dbProduct();
		CartProduct dbProduct = check.dbItem(product.getProductID());
		int dbqty = dbProduct.getQty();
		
		if(dbqty >= changeQty){
			product.setQty(changeQty);
		}else{
			response.sendRedirect("Error.jsp?msg=Invalid+Quantity&prev=displayCart.jsp");
			return;
		}
		response.sendRedirect("displayCart.jsp");
	}

}
