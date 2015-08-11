package controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart.CartProduct;
import Cart.ShoppingCart;
import Cart.dbProduct;
import Cart.salesDB;
import Cart.transaction;

/**
 * Servlet implementation class PurchaseDB
 */
@WebServlet("/PurchaseDB")
public class PurchaseDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseDB() {
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
		HttpSession session = request.getSession();
		
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart == null){
			response.sendRedirect("product.jsp");
			return;
		}
		
		salesDB sales = (salesDB) session.getAttribute("sales");
		
		for(int i = 0; i < sales.size();i++){
			transaction trans = sales.getSales(i);	
			try {
				dbProduct prod = new dbProduct();
				if(trans.getQty() <= prod.dbItem(trans.getProductID()).getQty())
					trans.saveTrans();
				else{
					response.sendRedirect("Error.jsp?msg=Invalid+Quantity&prev=displayCart.jsp");
					return;
			}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		int i = 0;
		while(cart.cartSize() > 0){//go thru all the cart items
			CartProduct product = cart.getCartItems(i);//retrieve item
			int id = product.getProductID();//stores the product id
			int qty = product.getQty();//stores requested qty
			
			dbProduct stock = new dbProduct();//create item stock
			int stockqty = stock.dbItem(id).getQty();//store requested item db qty
			
			if(stockqty >= qty){//if more stock then requested
				int y = stock.dbUpdate(qty, id);//send confirmation to db

				if(y == 1){
					cart.removeFromCart(i);//remove item from cart
				}
			}
		}
		response.sendRedirect("products.jsp");
	}

}
