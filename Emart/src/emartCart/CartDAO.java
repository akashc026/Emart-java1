package emartCart;

import java.util.List;

import emartPojo.Cart;

public interface CartDAO {
	
	List getCart(int custid);
	void addToCart(Cart cart);
	void updateCart(Cart cart,int oid);
	void deleteCart(int oid);
	void deleteAll(int custid);
}
