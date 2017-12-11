package sa45.Team10Stockist.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import sa45.Team10Stockist.model.User;


@Component
public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return User.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
		User user=(User)arg0;
		ValidationUtils.rejectIfEmpty(arg1, "userId", "error.user.userId.empty");		
		ValidationUtils.rejectIfEmpty(arg1, "name", "error.user.name.empty");
		ValidationUtils.rejectIfEmpty(arg1, "password", "error.user.password.empty");
		ValidationUtils.rejectIfEmpty(arg1, "role", "error.user.role.empty");

		System.out.println(user.toString());
		
	}

}