package Cart;

public class RecalCart {
	private ShoppingCart calcCart;
	
	public RecalCart(){
		
	}
	
	public ShoppingCart Recal(ShoppingCart oldCart){		
		
		for(int i = 0; i < oldCart.cartSize(); i++){//retrieve every item from cart
			boolean requireInsert = true;
			int id = oldCart.getCartItems(i).getProductID();//keep id of current item
			
			if(calcCart != null){//check if newcart exists
				
				for(int x = 0; x < calcCart.cartSize(); x++){//run thru newcart item's
					
					int newQty = 0;//prepare var for repeated id
					
					if (id == calcCart.getCartItems(x).getProductID()){//if oldcart item id = newcart product id
						newQty = calcCart.getCartItems(x).getQty() + oldCart.getCartItems(i).getQty();//add the similar product the qty tgt
						calcCart.getCartItems(x).setQty(newQty);//set total qty to newcart qty
						requireInsert = false;
					}	
				}
				if (requireInsert){
					calcCart.addToCart(oldCart.getCartItems(i));
				}
				
			}else{
				calcCart = new ShoppingCart(oldCart.getCartItems(i));//if newcart empty, make new cart with a item
			}
		}
		return calcCart;
	}
}
