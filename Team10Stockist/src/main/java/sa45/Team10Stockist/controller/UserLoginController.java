package sa45.Team10Stockist.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.User;
import sa45.Team10Stockist.service.ProductService;
import sa45.Team10Stockist.service.UserService;

@RequestMapping(value = "/home")
@Controller
public class UserLoginController {

	
	@Autowired
	private UserService uService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login", "user", new User());
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ModelAndView login( @ModelAttribute User user, BindingResult bindingresult, HttpSession session ) {
		
		ModelAndView mav = new ModelAndView("login");
		UserSession us = new UserSession();
		if (bindingresult.hasErrors()) {
			return mav;
		}
		if(uService.authenticate(user.getName(), user.getPassword())==null)
		{
		mav.addObject("error", "invalid username or password");
        return mav;
		}
		else{
			User u = uService.authenticate(user.getEmail(), user.getPassword());
			us.setUser(u);
			us.setSessionId(session.getId());
			mav = new ModelAndView("redirect:/home/catalogue");
			session.setAttribute("USERSESSION", us);  
		}
		return mav;
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		
		return "redirect:/home";

	}
	
}
