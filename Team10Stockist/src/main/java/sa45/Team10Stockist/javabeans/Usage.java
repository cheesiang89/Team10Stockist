package sa45.Team10Stockist.javabeans;

import sa45.Team10Stockist.model.Customer;
import sa45.Team10Stockist.model.Product;

public class Usage {

	private final Customer customer;
	private final Product product;
	
	public Usage() {
		this.customer = new Customer();
		this.product = new Product();
		// TODO Auto-generated constructor stub
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public Product getProduct() {
		return product;
	}

	@Override
	public String toString() {
		return "Usage [customer=" + customer + ", product=" + product + "]";
	}

	
}
