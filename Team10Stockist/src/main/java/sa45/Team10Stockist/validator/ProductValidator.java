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
//		Product product = (Product) arg0;
//		if(StringUtils.isEmpty(product.getColor())) {
//			arg1.rejectValue("color", "error.color");
//		}
//		System.out.println(product.toString());
		
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "name", "error.name", "Name is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "color", "error.color", "Color is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "description", "error.description", "Description is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "dimension", "error.dimension", "Dimension is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "shelfLocation", "error.shelfLocation", "Shelf Location is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "unitPrice", "error.unitPrice", "Unit Price is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "manufacturer", "error.manufacturer", "Manufacturer is required.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "minimumInventoryQuantity", "error.minimumInventoryQuantity", "Please enter minimum inventory quantity.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "stockQuantity", "error.stockQuantity", "Please enter stock quantity.");
		ValidationUtils.rejectIfEmptyOrWhitespace(arg1, "MinimumReorderQuantity", "error.MinimumReorderQuantity", "Please enter minimum reorder quantity.");
	}

}