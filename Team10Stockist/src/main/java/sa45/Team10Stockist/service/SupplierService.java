package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.transaction.Transactional;

import sa45.Team10Stockist.model.Supplier;

public interface SupplierService {

	ArrayList<Supplier> findAllSupplier();

	Supplier findSupplier(int supplierId);

	Supplier createSupplier(Supplier s);

	Supplier changeSupplier(Supplier s);

	void removeSupplier(Supplier s);

}