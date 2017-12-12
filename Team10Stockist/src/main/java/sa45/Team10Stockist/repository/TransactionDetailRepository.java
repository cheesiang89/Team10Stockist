package sa45.Team10Stockist.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import sa45.Team10Stockist.model.TransactionDetail;

public interface TransactionDetailRepository extends JpaRepository<TransactionDetail, Integer> {

}