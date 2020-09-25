package emartCustomer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import emartPojo.Customer;

@Service
public class CustomerManagerImpl implements CustomerManager
{
	@Autowired
	CustomerDAO dao;

	@Override
	public void regUser(Customer c) {
		// TODO Auto-generated method stub
		dao.regUser(c);
	}
	
	@Override
	public List<Customer> CustList() {
		// TODO Auto-generated method stub
		return dao.customers();
	}
	
	@Override
	public List<Customer> loginUser(String user,String pass) {
		return dao.loginUser(user,pass);

	}
	
	@Override
	public void update1(Customer customer,int id) {
		// TODO Auto-generated method stub
		dao.updateUser(customer,id);
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		dao.deleteUser(id);
	}

	

	
}
