package sa45.Team10Stockist.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sa45.Team10Stockist.model.Customer;


@Component
public class CustomerValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return Customer.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		Customer customer=(Customer) arg0;
		ValidationUtils.rejectIfEmpty(arg1, "customerId", "error.customer.customerId.empty");
		ValidationUtils.rejectIfEmpty(arg1, "customerName", "error.customer.customerName.empty");
		
		
		
	}
	

}