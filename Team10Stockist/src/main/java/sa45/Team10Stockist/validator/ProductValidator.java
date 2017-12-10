package sa45.Team10Stockist.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import sa45.Team10Stockist.model.Product;

@Component
public class ProductValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return Product.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		Product product = (Product) arg0;
		if(StringUtils.isEmpty(product.getColor())) {
			arg1.rejectValue("color", "error.color");
		}

		if(StringUtils.isEmpty(product.getName())) {
			arg1.rejectValue("name","Product name is required ");
		}
		if(StringUtils.isEmpty(product.getDescription())) {
			arg1.rejectValue("description","Description is required ");
		}
		if(StringUtils.isEmpty(product.getDimension())) {
			arg1.rejectValue("dimension","Dimension is required ");
		}
		if(StringUtils.isEmpty(product.getShelfLocation())) {
			arg1.rejectValue("shelfLocation","Shelf location is required ");
		}
		if(StringUtils.isEmpty(product.getUnitPrice())){
			arg1.rejectValue("unitPrice", "Unit Price is required");
		}
		if(StringUtils.isEmpty(product.getManufacturer())) {
			arg1.rejectValue("manufacturer", "Manufacturer is required");
		}
		if(StringUtils.isEmpty(product.getMinimumInventoryQuantity())) {
			arg1.rejectValue("minimumInventoryQuantity","Please enter minimum inventory quantity");
		}
		if(StringUtils.isEmpty(product.getStockQuantity())) {
			arg1.rejectValue("stockQuantity","Please enter stock quantity  ");
		}
		if(StringUtils.isEmpty(product.getMinimumReorderQuantity())) {
			arg1.rejectValue("MinimumReorderQuantity","Please enter minimum reorder quantity");
		}
		System.out.println(product.toString());
		
	}

}
