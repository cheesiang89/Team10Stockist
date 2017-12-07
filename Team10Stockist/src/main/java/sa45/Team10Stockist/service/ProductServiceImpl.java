package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Resource
	ProductRepository prepo;
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.ProductService#findAllProduct()
	 */
	@Override
	@Transactional
	public ArrayList<Product> findAllProduct() {
		ArrayList<Product> plist = (ArrayList<Product>) prepo.findAll();
		return plist;
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.ProductService#findProduct(int)
	 */
	@Override
	@Transactional
	public Product findProduct(int part_number) {
		return prepo.findOne(part_number);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.ProductService#createProduct(sa45.Team10Stockist.model.Product)
	 */
	@Override
	@Transactional
	public Product createProduct(Product p) {
		return prepo.saveAndFlush(p);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.ProductService#changeProduct(sa45.Team10Stockist.model.Product)
	 */
	@Override
	@Transactional
	public Product changeProduct(Product p) {
		return prepo.saveAndFlush(p);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.ProductService#removeProduct(sa45.Team10Stockist.model.Product)
	 */
	@Override
	@Transactional
	public void removeProduct(Product p) {
		prepo.delete(p);
	}
}
