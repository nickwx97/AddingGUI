package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbAccess.Product;
import dbAccess.ProductDB;
import dbAccess.UserDetails;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
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
		
		
		int productID = Integer.parseInt(request.getParameter("productID"));
		String productName = request.getParameter("productName").trim();
		String model = request.getParameter("model").trim();
		String brand = request.getParameter("brand").trim();
		String category = request.getParameter("category").trim();
		String productDesc = request.getParameter("productDesc").trim();
		
		
		
		
		
		
		
		
// TAKE NOTE HERE NEED TO DO A CHECK IF IT'S BLACK SPACE!!!!!!! BECAUSE IT WILL STORE BLANK SPACE
		//join multiple specs together and space them with predefined charaters of semicolon ;
		String spec = "";
		String[] inputSpec = new String[10];
		for(int i=0;i<inputSpec.length;i++){
			if(request.getParameter("spec"+i).equals("") || request.getParameter("spec"+i)==null){
				inputSpec[i]="";
			}else{
				inputSpec[i]=request.getParameter("spec"+i).trim()+";";
			}
			spec+=inputSpec[i];
		}
		
		
		
		
//		also need to check there is at least 1 number
		double price = Double.parseDouble(request.getParameter("price"));
		
		
		
		
		
		
		
//need to check for non numbers, probably regex liao
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		
		
		
		
		//if imgpath empty or null put default picture
		String img;
		if(request.getParameter("img").trim().equals("") || request.getParameter("img").trim()==null){
			img = "Pictures\\Product-Image-Coming-Soon.png";
		}else{
			img = request.getParameter("img").trim();
		}
		
		//get user id from the session
		HttpSession session = request.getSession();
		UserDetails ud = (UserDetails)session.getAttribute("userdetails");
		String owner = ud.getUserid();
		
		//create product and productDB object to insert into
		//store result as a boolean
		Product prod = new Product(productName, model, brand, category, productDesc, spec, price, qty, img, owner, productID);
		ProductDB db = new ProductDB();
		
		boolean success = db.updateProduct(prod);
		
		//pass the information to a jsp
		String type = "updateProd";
		request.setAttribute("result", success);
		request.setAttribute("type", type);
		RequestDispatcher rd = request.getRequestDispatcher("genericResultPage.jsp");
		rd.forward(request, response);
		
	}

}
