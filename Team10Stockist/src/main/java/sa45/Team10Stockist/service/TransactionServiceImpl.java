package sa45.Team10Stockist.service;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.Transaction;
import sa45.Team10Stockist.repository.CustomerRepository;
import sa45.Team10Stockist.repository.ProductRepository;
import sa45.Team10Stockist.repository.TransactionRepository;
import sa45.Team10Stockist.repository.UserRepository;

//For updating transaction & transaction detail table with transaction id, partId, 
//customerId, userId
public class TransactionServiceImpl implements TransactionService {

//	@Resource
//	CustomerRepository crepo;
//	@Resource
//	ProductRepository prepo;
//	@Resource
//	UserRepository urepo;
	@Resource
	TransactionRepository trepo;
	
	/* (non-Javadoc)
	 * @see sa45.Team10Stockist.service.TransactionService#saveTrans(sa45.Team10Stockist.model.Transaction)
	 */
	@Override
	@Transactional
	public void saveTrans(Transaction t) {
		trepo.saveAndFlush(t);
	}
	
	
	
}
