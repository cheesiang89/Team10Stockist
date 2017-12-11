package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.Supplier;
import sa45.Team10Stockist.repository.SupplierRepository;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Resource
	SupplierRepository srepo;
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierService#findAllSupplier()
	 */
	@Override
	@Transactional
	public ArrayList<Supplier> findAllSupplier() {
		ArrayList<Supplier> slist = (ArrayList<Supplier>) srepo.findAll();
		return slist;
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierService#findSupplier(int)
	 */
	@Override
	@Transactional
	public Supplier findSupplier(int supplierId) {
		return srepo.findOne(supplierId);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierService#createSupplier(sa45.Team10Stockist.model.Supplier)
	 */
	@Override
	@Transactional
	public Supplier createSupplier(Supplier s) {
		return srepo.saveAndFlush(s);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierService#changeSupplier(sa45.Team10Stockist.model.Supplier)
	 */
	@Override
	@Transactional
	public Supplier changeSupplier(Supplier s) {
		return srepo.saveAndFlush(s);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierService#removeSupplier(sa45.Team10Stockist.model.Supplier)
	 */
	@Override
	@Transactional
	public void removeSupplier(Supplier s) {
		srepo.delete(s);
	}
	
}
