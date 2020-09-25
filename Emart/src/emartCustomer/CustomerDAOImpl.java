package emartCustomer;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import emartPojo.Customer;

@Repository
@Transactional
public class CustomerDAOImpl implements CustomerDAO
{
	@Autowired
	HibernateTemplate template;

	@Override
	public void regUser(Customer c) {
		// TODO Auto-generated method stub
		c.setPoints(100);
		template.save(c);		
	}

	

	@Override
	public List<Customer> customers() {
		// TODO Auto-generated method stub
	List<Customer>mylist=(List<Customer>) template.find("from Customer c");
	return mylist;
	
	}

	@Override
	public List<Customer> loginUser(String user,String pass) {
		// TODO Auto-generated method stub
		List<Customer> mylist=(List<Customer>) template.find("from Customer c where c.email=? and c.password=?",user,pass);
		if(mylist.isEmpty())
			return null;
		return mylist;
	}



	@Override
	public void updateUser(Customer customer, int id) {
		// TODO Auto-generated method stub
		System.out.println("update");
		template.bulkUpdate("update Customer c set c.cname=?,c.email=?,c.mobno=?,c.age=?,c.gender=?,c.password=?,c.address=?,c.address1=?,c.primemember=?,c.points=? where c.custid=?",customer.getCname(),customer.getEmail(),customer.getMobno(),customer.getAge(),customer.getGender(),customer.getPassword(),customer.getAddress(),customer.getAddress1(),customer.isPrimemember(),customer.getPoints(),id);
	}

	
	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		template.delete(template.get(Customer.class, id));
	}

	
}