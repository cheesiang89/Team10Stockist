package sa45.Team10Stockist.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sa45.Team10Stockist.model.TransactionDetail;

@Component
public class TransactionDetailValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return TransactionDetailValidator.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		TransactionDetailValidator transDetail=(TransactionDetailValidator)arg0;
		ValidationUtils.rejectIfEmpty(arg1, "id", "error.transDetail.id.empty");		
		ValidationUtils.rejectIfEmpty(arg1, "quantity", "error.transDetail.quantity.empty");
		ValidationUtils.rejectIfEmpty(arg1, "product", "error.transDetail.product.empty");
		ValidationUtils.rejectIfEmpty(arg1, "transaction", "error.transDetail.transaction.empty");
		System.out.println(transDetail.toString());
		
		
	}

}