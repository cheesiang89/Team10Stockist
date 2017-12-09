package sa45.Team10Stockist.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import sa45.Team10Stockist.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>  {

}


