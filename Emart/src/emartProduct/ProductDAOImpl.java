package emartProduct;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO
{
	@Autowired
	HibernateTemplate template;

	@Override
	public List getProducts()
	{
		List mylist = template.find("from Product");
		return mylist;
	}

	@Override
	public List getCategory() {
		// TODO Auto-generated method stub
		List mylist= template.find("from Catsubcat c where c.catid is null");
		return mylist;
	}

	@Override
	public List getSubcategory(String str) {
		// TODO Auto-generated method stub
		List mylist = template.find("from Catsubcat c where c.catid = (select d.cid from Catsubcat d where d.name=?)",str);
		return mylist;
	}

	@Override
	public List getPromotional() {
		// TODO Auto-generated method stub
		List mylist = template.find("from Product p where p.promotional = 1");
		return mylist;
	}

	@Override
	public List getAllProduct(String str) {
		// TODO Auto-generated method stub
				List mylist = template.find("from Product p where p.catsubcat.name=? and p.catsubcat.flag is true",str);
				if(mylist.isEmpty())
				{
					return getSubcategory(str);
				}
				else
					return mylist;
	}

	@Override
	public List getProductDetail(String str) {
		// TODO Auto-generated method stub
		List mylist = template.find("from Product p where p.name=?", str);
		return mylist;
	}

}
