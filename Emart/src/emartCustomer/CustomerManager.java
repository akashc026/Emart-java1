package emartCustomer;

import java.util.List;

import emartPojo.Customer;

public interface CustomerManager
{
	void regUser(Customer c);
	List<Customer> CustList();
	List<Customer> loginUser(String user,String pass);
	void delete(int id);
	void update1(Customer customer,int id);
	
}
