package sa45.Team10Stockist.controller;

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
import sa45.Team10Stockist.service.ProductService;

@RequestMapping(value = "/home")
@Controller
public class UserViewProductController {

	@Autowired
	ProductService pservice;
	
	
	@RequestMapping(value = "/catalogue/product/{partNumber}", method = RequestMethod.GET)
	public ModelAndView productPage(@PathVariable String partNumber) {
		
		ModelAndView mav = new ModelAndView("product");
		int pnum = Integer.parseInt(partNumber);
		Product product = pservice.findProduct(pnum);
		mav.addObject("product", product);
		return mav;

	}
	
	@RequestMapping(value = "/catalogue/product/{partNumber}", method = RequestMethod.POST)
	public ModelAndView productPage() {
		
		ModelAndView mav = new ModelAndView("redirect:/home/catalogue");
		
		return mav;
	}
}
