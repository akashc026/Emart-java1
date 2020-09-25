package emartProduct;

import java.util.List;

public interface ProductManager
{
	//void addProduct(Product p);
	List getProducts();
	List getCategory();
	List getSubcategory(String str);
	List getPromotional();
	List getAllProduct(String str);
	List getProductDetail(String str);
}
