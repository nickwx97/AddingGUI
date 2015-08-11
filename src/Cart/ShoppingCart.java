package Cart;

import java.util.ArrayList;

public class ShoppingCart {
	
	private ArrayList<CartProduct> cart;
	
	public ShoppingCart(CartProduct product){
		cart = new ArrayList<CartProduct>();
		addToCart(product);
	}


	public void addToCart(CartProduct product) {
		cart.add(product);
	}
	
	public CartProduct getCartItems(int i){
		
		CartProduct product = cart.get(i);
		
		return product;
	}
	
	public void removeFromCart(int i){
		cart.remove(i);
	}
	
	public int cartSize(){
		return cart.size();
	}
}
