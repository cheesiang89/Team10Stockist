package sa45.Team10Stockist.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import sa45.Team10Stockist.model.Transaction;

@Component
public class TransactionValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return Transaction.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		Transaction transaction=(Transaction)arg0 ;
		ValidationUtils.rejectIfEmpty(arg1, "transId", "error.transaction.transId.empty");		
		ValidationUtils.rejectIfEmpty(arg1, "datetime", "error.transaction.datetime.empty");

		System.out.println(transaction.toString());
	}

	

}