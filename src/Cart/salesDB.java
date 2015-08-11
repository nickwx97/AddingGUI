package Cart;

import java.util.ArrayList;

public class salesDB {
	private ArrayList<transaction> sales;

	public transaction getSales(int i) {
		return sales.get(i);
	}

	public void addToSales(transaction trans) {
		if(sales !=null){
			sales.add(trans);
		}else {
			sales = new ArrayList<transaction>();
			sales.add(trans);
		}
		
	}
	
	public int size(){
		return sales.size();
	}
}
