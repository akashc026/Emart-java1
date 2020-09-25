package emartCart;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sun.jndi.url.dns.dnsURLContext;

import emartPojo.Cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

@Repository
@Transactional
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	HibernateTemplate template;

	@Override
	public List getCart(int custid) {
		// TODO Auto-generated method stub
		List mylist = template.find("from Cart c where c.customer.custid = ?",custid);
		return mylist;
	}

	@Override
	public void addToCart(Cart cart) {
		// TODO Auto-generated method stub
		
		if(cart.getCustomer().isPrimemember())
		{
			cart.setAmount(cart.getProduct().getPrimeprice() * cart.getQuantity());
		}
		else
			cart.setAmount(cart.getProduct().getPrice() * cart.getQuantity());
		
		template.save(cart);
	}

	@Override
	public void updateCart(Cart cart, int oid) {
		// TODO Auto-generated method stub
		
		if(cart.isPoints() && (!cart.getCustomer().isPrimemember()))
			cart.setAmount((cart.getProduct().getPrice() * cart.getQuantity()) - (cart.getQuantity() * cart.getProduct().getPoints()));
		else if(cart.getCustomer().isPrimemember())
			cart.setAmount(cart.getProduct().getPrimeprice() * cart.getQuantity());
		else
			cart.setAmount(cart.getProduct().getPrice() * cart.getQuantity());
		
		
		template.bulkUpdate("update Cart c set c.quantity=?,c.amount=?,c.points=? where oid=?",cart.getQuantity(),cart.getAmount(),cart.isPoints(),oid);
	}

	@Override
	public void deleteCart(int oid) {
		// TODO Auto-generated method stub
		template.bulkUpdate("update Cart c set c.product=null, c.customer=null where c.oid=?", oid);
		template.delete(template.get(Cart.class,oid));
	}

	@Override
	public void deleteAll(int custid) {
		// TODO Auto-generated method stub
		//List<Cart> mylist = (List<Cart>) template.find("from Cart c where c.customer.custid=?",custid);
		//int n = mylist.size();
		
		template.bulkUpdate("update Cart c set c.product=null, c.customer=null");
		
		template.bulkUpdate("delete from Cart c where c.customer=null");
	}
	
}
