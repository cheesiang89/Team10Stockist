package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import sa45.Team10Stockist.javabeans.ProductNSupplierBean;
import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.Supplier;
import sa45.Team10Stockist.repository.ProductRepository;
import sa45.Team10Stockist.repository.SupplierRepository;

@Service
public class ProductNSupplierBeanServiceImpl implements ProductNSupplierBeanService {

	//For returning a set of beans that contains both supplier properties and the products properties
	//that the supplier carry.
	
	@Resource
	ProductRepository prepo;
	
	@Resource
	SupplierRepository srepo;
	
	@Transactional
	public ArrayList<ProductNSupplierBean> getBean() {
		ArrayList<ProductNSupplierBean> beanlist = new ArrayList<ProductNSupplierBean>();
		
		for (Supplier s : srepo.findAll()) {
			ProductNSupplierBean nBean = new ProductNSupplierBean();
			nBean.setSupplierId(s.getSupplierId());
			nBean.setSupplierName(s.getSupplierName());
			
			for (Product p : s.getProducts()) {
				
				nBean.setPartNumber(p.getPartNumber());
				nBean.setUnitPrice(p.getUnitPrice());
				nBean.setStockQuantity(p.getStockQuantity());
				nBean.setMinimumInventoryQuantity(p.getMinimumInventoryQuantity());
				nBean.setMinimumReorderQuantity(p.getMinimumReorderQuantity());
				
				if (p.getMinimumInventoryQuantity() > p.getStockQuantity())
				{
					if((p.getMinimumInventoryQuantity()-p.getStockQuantity())<p.getMinimumReorderQuantity()) {
						nBean.setOrderQty(p.getMinimumReorderQuantity());
					}else {
						nBean.setOrderQty(p.getMinimumInventoryQuantity()-p.getStockQuantity());
					}
				}else {
					nBean.setOrderQty(0);
				}

				if (p.getMinimumInventoryQuantity() > p.getStockQuantity())
				{
					if((p.getMinimumInventoryQuantity()-p.getStockQuantity())<p.getMinimumReorderQuantity()) {
						nBean.setPrice(p.getMinimumReorderQuantity()*p.getUnitPrice());
					}else {
						nBean.setPrice((p.getMinimumInventoryQuantity()-p.getStockQuantity())*p.getUnitPrice());
					}
				}else {
					nBean.setPrice(0.0);
				}
			}
			beanlist.add(nBean);
		}
		
		return beanlist;
	}

	//For counting the total price for each supplier in the reorder report
	
	@Transactional
	public double getTotalReorderPriceBySupplier(int supplierid) {
		double totalReorderPrice = 0;
		for (ProductNSupplierBean comboBean : getBean()) {
			if (comboBean.getSupplierId() == supplierid) {
				totalReorderPrice += comboBean.getPrice();
			}
		}
		return totalReorderPrice;
	}
}
