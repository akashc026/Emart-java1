package emartCustomer;

import java.util.List;

import emartPojo.Customer;

public interface CustomerDAO 
{
	void regUser(Customer c);
	List<Customer> customers();
	List<Customer> loginUser(String user,String pass);
	void updateUser(Customer customer, int id);
	void deleteUser(int id);
}



