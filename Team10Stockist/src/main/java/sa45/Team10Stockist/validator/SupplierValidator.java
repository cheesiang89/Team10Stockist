package sa45.Team10Stockist.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import sa45.Team10Stockist.model.Supplier;


@Component
public class SupplierValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return Supplier.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		Supplier supplier=(Supplier) arg0;
		ValidationUtils.rejectIfEmpty(arg1, "supplierId", "error.supplier.supplierId.empty");		
		ValidationUtils.rejectIfEmpty(arg1, "supplierName", "error.supplier.supplierName.empty");
		
		System.out.println(supplier.toString());
		
	}

}