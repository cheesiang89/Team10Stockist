package sa45.Team10Stockist.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sa45.Team10Stockist.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

	@Query("SELECT p from Product p WHERE p.minimumInventoryQuantity > p.stockQuantity")
	ArrayList<Product> findLowStockProducts();
	
//	@Query("SELECT p from Product p WHERE p.minimum_inventory_quantity > p.stock_quantity")
//	int countOrderQuantity(@Param("eid") String eid);
}
