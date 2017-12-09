package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import sa45.Team10Stockist.model.SupplierCatalog;
import sa45.Team10Stockist.repository.SupplierCatalogRepository;

@Service
public class SupplierCatalogServiceImpl implements SupplierCatalogService {
	@Resource
	SupplierCatalogRepository screpo;

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierCatalogService#findAllSupplierCatalog()
	 */
	@Override
	@Transactional
	public ArrayList<SupplierCatalog> findAllSupplierCatalog() {
		ArrayList<SupplierCatalog> sclist = (ArrayList<SupplierCatalog>) screpo.findAll();
		return sclist;
	}

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierCatalogService#findSupplierCatalog(int)
	 */
	@Override
	@Transactional
	public SupplierCatalog findSupplierCatalog(int supplierId) {
		return screpo.findOne(supplierId);
	}

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierCatalogService#createSupplierCatalog(sa45.Team10Stockist.model.SupplierCatalog)
	 */
	@Override
	@Transactional
	public SupplierCatalog createSupplierCatalog(SupplierCatalog sc) {
		return screpo.saveAndFlush(sc);
	}

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierCatalogService#changeSupplierCatalog(sa45.Team10Stockist.model.SupplierCatalog)
	 */
	@Override
	@Transactional
	public SupplierCatalog changeSupplierCatalog(SupplierCatalog sc) {
		return screpo.saveAndFlush(sc);
	}

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.SupplierCatalogService#removeSupplierCatalog(sa45.Team10Stockist.model.SupplierCatalog)
	 */
	@Override
	@Transactional
	public void removeSupplierCatalog(SupplierCatalog sc) {
		screpo.delete(sc);
	}
}
