package emartCustomer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import emartPojo.Customer;
import emartPojo.Login;

@RestController  
@CrossOrigin("http://localhost:4200")
public class CustomerController
{
	@Autowired
	CustomerManager manager;
	
	@GetMapping(value = "customers",headers = "Accept=application/json")
	public String getCustomer()
	{
		return new Gson().toJson(manager.CustList());
	}
	
	
	@PostMapping(value = "customers/register", headers = "Accept=application/json")  
	 public void regUser(@RequestBody Customer customer)
	 {
		System.out.println("addpro called");
		manager.regUser(customer);
	 }
	
	@PostMapping(value = "customers/login", headers = "Accept=application/json")  
	 public String loginUser(@RequestBody Login login)
	 {
		System.out.println("addpro called");
		List<Customer> c =(List<Customer>) manager.loginUser(login.getEmail(),login.getPassword());
		if(null != c)
			return new Gson().toJson(c);
		else
			return null;
	 }
	
	
	@PutMapping(value = "customers/update/{custid}",headers = "Accept=application/json")  
	 public void updateUser(@RequestBody Customer customer,@PathVariable int custid)
	 {
		manager.update1(customer,custid);
	 }
	
	
	@DeleteMapping(value = "customers/delete/{custid}", headers = "Accept=application/json")  
	 public void removepro(@PathVariable int custid)
	 {
		manager.delete(custid);
	 }
	
}
