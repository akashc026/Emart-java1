package emartCart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import emartPojo.Cart;

@Service
public class CartManagerImpl implements CartManager {

	@Autowired
	CartDAO dao;

	@Override
	public List getCart(int custid) {
		// TODO Auto-generated method stub
		return dao.getCart(custid);
	}

	@Override
	public void addToCart(Cart cart) {
		// TODO Auto-generated method stub
		dao.addToCart(cart);
	}

	@Override
	public void updateCart(Cart cart, int oid) {
		// TODO Auto-generated method stub
		dao.updateCart(cart, oid);
	}

	@Override
	public void deleteCart(int oid) {
		// TODO Auto-generated method stub
		dao.deleteCart(oid);
	}

	@Override
	public void deleteAll(int custid) {
		// TODO Auto-generated method stub
		dao.deleteAll(custid);
	}
}
