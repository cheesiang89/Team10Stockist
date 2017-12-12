package sa45.Team10Stockist.service;

import org.springframework.stereotype.Service;
import sa45.Team10Stockist.model.TransactionDetail;
import sa45.Team10Stockist.repository.TransactionDetailRepository;
import sa45.Team10Stockist.repository.TransactionRepository;

import javax.annotation.Resource;

/**
 * Created by xxx on 12/12/2017.
 */
@Service
public class TransactionDetailServiceImpl implements TransactionDetailService {
    @Resource
    private TransactionDetailRepository repository;
    @Override
    public void saveTransactionDetail(TransactionDetail detail) {
        repository.saveAndFlush(detail);
    }
}
