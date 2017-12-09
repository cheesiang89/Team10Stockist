package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.transaction.Transactional;

import sa45.Team10Stockist.model.Customer;

public interface CustomerService {

	ArrayList<Customer> findAllCustomer();

	Customer findCustomer(int id);

	Customer createCustomer(Customer c);

	Customer changeCustomer(Customer c);

	void removeCustomer(Customer c);

}