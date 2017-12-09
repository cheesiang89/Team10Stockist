package sa45.Team10Stockist.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import sa45.Team10Stockist.model.Customer;
import sa45.Team10Stockist.repository.CustomerRepository;


@Service
public class CustomerServiceImpl implements CustomerService {

	@Resource
	CustomerRepository crepo;
	

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.CustomerService#findAllCustomer()
	 */
	@Override
	@Transactional
	public ArrayList<Customer> findAllCustomer(){
		ArrayList<Customer> clist = (ArrayList<Customer>)crepo.findAll();
		return clist;
	}
	

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.CustomerService#findCustomer(int)
	 */
	@Override
	@Transactional
	public Customer findCustomer(int id) {
		return crepo.findOne(id);
	}
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.CustomerService#createCustomer(sa45.Team10Stockist.model.Customer)
	 */
	@Override
	@Transactional
	public Customer createCustomer(Customer c) {
		return crepo.saveAndFlush(c);
	}

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.CustomerService#changeCustomer(sa45.Team10Stockist.model.Customer)
	 */
	@Override
	@Transactional
	public Customer changeCustomer(Customer c) {
		return crepo.saveAndFlush(c);
	}
	

	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.CustomerService#removeCustomer(sa45.Team10Stockist.model.Customer)
	 */
	@Override
	@Transactional
	public void removeCustomer(Customer c) {
		crepo.delete(c);
	}
	
	
}
