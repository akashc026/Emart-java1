package emartProduct;

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
import com.google.gson.GsonBuilder;

@RestController  
@CrossOrigin("http://localhost:4200")
public class ProductController
{
	@Autowired
	ProductManager manager;
	
	@GetMapping(value = "products",headers = "Accept=application/json")  
	 public String showProducts()
	 {
		System.out.println(manager.getProducts());	
		return new Gson().toJson(manager.getProducts());
	 }
	
	@GetMapping(value="products/category",headers = "Accept=application/json")
	public String showCategory()
	{
		return new Gson().toJson(manager.getCategory());
	}
	
	@GetMapping(value="products/subcategory/{str}",headers = "Accept=application/json")
	public String showSubcategory(@PathVariable String str)
	{
		return new Gson().toJson(manager.getSubcategory(str));
	}
	
	@GetMapping(value="products/brands/{str}",headers = "Accept=application/json")
	public String showBrands(@PathVariable String str)
	{
		System.out.println(str);
		return new Gson().toJson(manager.getSubcategory(str));
	}
	
	@GetMapping(value="products/promotional",headers = "Accept=application/json")
	public String showPromotional()
	{
		return new Gson().toJson(manager.getPromotional());
	}
	
	@GetMapping(value="products/{str}", headers="Accept=application/json")
	public String getAllProducts(@PathVariable String str)
	{
		return new Gson().toJson(manager.getAllProduct(str));
	}
	
	@GetMapping(value = "products/details/{str}",headers="Accept=application/json")
	public String getProductDetail(@PathVariable String str)
	{
		return new Gson().toJson(manager.getProductDetail(str));
	}
	
}
