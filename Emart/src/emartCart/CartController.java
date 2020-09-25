package emartCart;

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

import emartPojo.Cart;
import emartPojo.Customer;

@RestController  
@CrossOrigin("http://localhost:4200")
public class CartController {

	@Autowired
	CartManager manager;
	
	@GetMapping(value = "carts/{custid}",headers = "Accept=application/json")
	public String getCart(@PathVariable int custid)
	{
		return new Gson().toJson(manager.getCart(custid));
	}
	
	
	@PostMapping(value = "carts/addToCart", headers = "Accept=application/json")
	public void addToCart(@RequestBody Cart cart)
	{
		manager.addToCart(cart);
	}
	
	@PutMapping(value = "carts/update/{oid}",headers = "Accept=application/json")
	public void updateCart(@RequestBody Cart cart,@PathVariable int oid)
	{
		manager.updateCart(cart, oid);
	}
	
	@DeleteMapping(value = "carts/remove/{oid}", headers = "Accept=application/json")
	public void deleteCart(@PathVariable int oid)
	{
		manager.deleteCart(oid);
	}
	
	@DeleteMapping(value="carts/removeAll/{custid}",headers = "Accept=application/json")
	public void deleteAll(@PathVariable int custid)
	{
		manager.deleteAll(custid);
	}
}
