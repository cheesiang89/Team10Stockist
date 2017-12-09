package sa45.Team10Stockist.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sa45.Team10Stockist.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	@Query("SELECT p FROM Product p WHERE "
			+"(:search ='' OR ( p.partNumber LIKE concat('%', :search ,'%')OR p.name LIKE concat('%', :search ,'%')))"
			  +"AND (:color = '' OR p.color LIKE concat('%', :color ,'%') )"
		      + "AND (:manufacturer = '' OR p.manufacturer LIKE concat ('%', :manufacturer, '%'))")
		      ArrayList<Product> findProductsByCriteria(
		    		  @Param("search") String search,
		    			  @Param("color") String color,
		    		  @Param("manufacturer") String manufacturer);

//	"SELECT c FROM customer c WHERE "
//    + "(:name = '' OR c.name LIKE concat('%', :name ,'%'') "
//    + "AND (:country = '' OR c.country LIKE concat ('%', :country, '%'')"
}
