package sa45.Team10Stockist.controller;

import java.util.ArrayList;

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


@RequestMapping(value = "/admin")
@Controller
public class AdminController {

	@Autowired
	ProductService pservice;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView newProductPage() {
		Product p = new Product();
		ModelAndView mav = new ModelAndView("add", "product", p);
		// mav.addObject("product", pservice.createProduct(p));
		return mav;
	}

	// When @ModelAttribute tag is used it means the whole form's data
	// is passed in as the parameters
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView createNewProduct(@ModelAttribute Product product, BindingResult result,
			final RedirectAttributes redirectAttributes) {

		ModelAndView mav = new ModelAndView();
		String message = "New Product" + product.getPartNumber() + "was successfully created.";

		pservice.createProduct(product);
		// This is a POST. Hence you only pass in the view path in a redirect
		// and not at the constructor.
		mav.setViewName("redirect:/admin/product");

		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	@RequestMapping(value = "/edit/{partNumber}", method = RequestMethod.GET)
	public ModelAndView editProductPage(@PathVariable String partNumber) {
		
		ModelAndView mav = new ModelAndView("edit");
		int pnum = Integer.parseInt(partNumber);
		Product product = pservice.findProduct(pnum);
		mav.addObject("product", product);
		return mav;

	}

	@RequestMapping(value = "/edit/{partNumber}", method = RequestMethod.POST)
	public ModelAndView editProductPage(@ModelAttribute Product product, BindingResult result, @PathVariable String partNumber,
			final RedirectAttributes redirectAttributes) {
		
		ModelAndView mav = new ModelAndView("redirect:/admin/product/{partNumber}");
		pservice.changeProduct(product);
		String message = "Product " + product.getPartNumber() + " sucessfully updated.";
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	@RequestMapping(value = "/product/{partNumber}", method = RequestMethod.GET)
	public ModelAndView productPage(@PathVariable String partNumber) {
		
		ModelAndView mav = new ModelAndView("product");
		int pnum = Integer.parseInt(partNumber);
		Product product = pservice.findProduct(pnum);
		mav.addObject("product", product);
		return mav;

	}
	
	@RequestMapping(value = "/product/{partNumber}", method = RequestMethod.POST)
	public ModelAndView productPage(@ModelAttribute Product product, BindingResult result, @PathVariable String partNumber,
			final RedirectAttributes redirectAttributes) {
		
		ModelAndView mav = new ModelAndView("redirect:/admin/add");
		
		return mav;
	}
}
