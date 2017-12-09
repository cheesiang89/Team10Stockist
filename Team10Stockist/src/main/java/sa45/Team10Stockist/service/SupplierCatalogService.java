package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.transaction.Transactional;

import sa45.Team10Stockist.model.SupplierCatalog;

public interface SupplierCatalogService {

	ArrayList<SupplierCatalog> findAllSupplierCatalog();

	SupplierCatalog findSupplierCatalog(int supplierId);

	SupplierCatalog createSupplierCatalog(SupplierCatalog sc);

	SupplierCatalog changeSupplierCatalog(SupplierCatalog sc);

	void removeSupplierCatalog(SupplierCatalog sc);

}