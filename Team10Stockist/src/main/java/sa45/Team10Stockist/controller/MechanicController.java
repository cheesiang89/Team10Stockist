package sa45.Team10Stockist.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sa45.Team10Stockist.javabeans.Usage;
import sa45.Team10Stockist.model.Customer;
import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.service.CustomerService;
import sa45.Team10Stockist.service.ProductService;


@Controller
@RequestMapping(value = "/mechanic")
public class MechanicController {
	
	@Autowired
	ProductService pservice;
	
	@Autowired
	CustomerService cservice;
	
	@RequestMapping(value = "/usage", method = RequestMethod.GET)
	public ModelAndView newUsagePage() {
		ModelAndView mav = new ModelAndView("usage");
//		ArrayList<Customer> customerlist = (ArrayList<Customer>)cservice.createCustomer();
//		mav.addObject("usage", customerlist);
		mav.addObject("usage");
		return mav;
	}
	
	
	
//	@RequestMapping(value = "/mechanic/usage",method = RequestMethod.POST)
//	public ModelAndView createNewTransaction(@ModelAttribute Product product, BindingResult result,
//		final RedirectAttributes redirectAttributes) {
//		
		
		
	//}
	
	
}
