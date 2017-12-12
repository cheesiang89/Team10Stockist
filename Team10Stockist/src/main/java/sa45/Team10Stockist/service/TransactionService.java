package sa45.Team10Stockist.service;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import sa45.Team10Stockist.model.Transaction;

public interface TransactionService {

	void saveTrans(Transaction t);

	ArrayList<Transaction> findAllTransaction();

}