package sa45.Team10Stockist.controller;

import java.util.List;
import javax.enterprise.inject.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.databind.ObjectMapper;
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
		List<Customer> customerlist = cservice.findAllCustomer();
		mav.addObject("customerlist",customerlist);
		List<Product> productlist = pservice.findAllProduct();
		mav.addObject("productlist", productlist);
		return mav;
	}

	@RequestMapping(value = "/usage/{customerId}", method= RequestMethod.GET)
	public @ResponseBody String findCustomerName(@PathVariable String customerId){
		return cservice.findCustomer(Integer.parseInt(customerId)).getCustomerName();
	}
	
	/*@RequestMapping(value = "/usage",method = RequestMethod.POST)
	public ModelAndView postDelivery(BindingResult result, final RedirectAttributes redirectAttributes) {
	
		
		return null;
	}
*/
	
}
