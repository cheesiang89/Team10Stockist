package sa45.Team10Stockist.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sa45.Team10Stockist.model.Supplier;

public interface SupplierRepository extends JpaRepository<Supplier, Integer> {
	
	/*@Modifying
	@Query("DELETE FORM Supplier s WHERE s.supplierId = :supplierId")
	void setUserInfoById(@Param("supplierId") String supplierId);*/
	
	
}
