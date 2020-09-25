package emartProduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductManagerImpl implements ProductManager
{
	@Autowired
	ProductDAO dao;


	@Override
	public List getProducts() {
		// TODO Auto-generated method stub
		return dao.getProducts();
	}
	

	@Override
	public List getCategory() {
		// TODO Auto-generated method stub
		return dao.getCategory();
	}


	@Override
	public List getSubcategory(String str) {
		// TODO Auto-generated method stub
		return dao.getSubcategory(str);
	}


	@Override
	public List getPromotional() {
		// TODO Auto-generated method stub
		return dao.getPromotional();
	}


	@Override
	public List getAllProduct(String str) {
		// TODO Auto-generated method stub
		return dao.getAllProduct(str);
	}


	@Override
	public List getProductDetail(String str) {
		// TODO Auto-generated method stub
		return dao.getProductDetail(str);
	}

}
