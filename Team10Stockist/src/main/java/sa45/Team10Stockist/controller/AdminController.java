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

import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.service.ProductService;

@RequestMapping(value="/Admin")
@Controller
public class AdminController {
	
	@Autowired
	ProductService pservice;
	
	
	@RequestMapping(value = "/Add", method = RequestMethod.GET)
	public ModelAndView newStudentPage() {
		Product p = new Product();
		ModelAndView mav = new ModelAndView("Add", "product", p);
		mav.addObject("product", pservice.createProduct(p));
		return mav;
	}
	
	// When @ModelAttribute tag is used it means the whole form's data
	// is passed in as the parameters
	@RequestMapping(value = "/Add", method = RequestMethod.POST)
	public ModelAndView createNewProduct(@ModelAttribute Product product, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		
		ModelAndView mav = new ModelAndView();
		String message = "New Product" + product.getPartNumber() + "was successfully created.";
		
		pservice.createProduct(product);
		//This is a POST. Hence you only pass in the view path in a redirect
		//and not at the constructor.
		mav.setViewName("redirect:/Admin/Product");
		
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
}
