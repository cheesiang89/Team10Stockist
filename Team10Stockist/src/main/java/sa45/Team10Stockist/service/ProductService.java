package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.transaction.Transactional;

import sa45.Team10Stockist.model.Product;

public interface ProductService {

	ArrayList<Product> findAllProduct();

	Product findProduct(int part_number);

	Product createProduct(Product p);

	Product changeProduct(Product p);

	void removeProduct(Product p);

}