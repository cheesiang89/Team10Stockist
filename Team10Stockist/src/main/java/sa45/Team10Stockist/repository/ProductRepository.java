package sa45.Team10Stockist.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sa45.Team10Stockist.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
