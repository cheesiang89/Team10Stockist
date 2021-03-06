package sa45.Team10Stockist.controller;

import java.util.ArrayList;
import java.util.function.Supplier;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.service.ProductService;
import sa45.Team10Stockist.service.SupplierService;
import sa45.Team10Stockist.validator.ProductValidator;

@RequestMapping(value = "/admin")
@Controller
public class AdminManageProductController {

	@Autowired
	ProductService pservice;

	@Autowired
	ProductValidator pValidator;

	@InitBinder("product")
	private void initDepartmentBinder(WebDataBinder binder) {
		binder.addValidators(pValidator);
	}

	@RequestMapping(value = "/product/add", method = RequestMethod.GET)
	public ModelAndView newProductPage(HttpSession session) {
		Product p = new Product();
		ModelAndView mav = new ModelAndView("add", "product", p);
		if (session.getAttribute("USERSESSION") == null) {
			mav.setViewName("redirect:/home");
		}
		return mav;
	}

	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public ModelAndView createNewProduct(@ModelAttribute @Valid Product product, BindingResult result,
			final RedirectAttributes redirectAttributes) {

		if (result.hasErrors())
			return new ModelAndView("add");
		ModelAndView mav = new ModelAndView();
		pservice.createProduct(product);
		String message = "New Product" + product.getPartNumber() + "was successfully created.";
		mav.setViewName("redirect:/home/catalogue");
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	@RequestMapping(value = "/product/edit/{partNumber}", method = RequestMethod.GET)
	public ModelAndView editProductPage(@PathVariable String partNumber, HttpSession session) {

		ModelAndView mav = new ModelAndView("edit");
		if (session.getAttribute("USERSESSION") == null) {
			// Can be replaced with access denial
			mav.setViewName("redirect:/home");
		} else {
			int pnum = Integer.parseInt(partNumber);
			Product product = pservice.findProduct(pnum);
			mav.addObject("product", product);
		}
		return mav;

	}

	@RequestMapping(value = "/product/edit/{partNumber}", method = RequestMethod.POST)
	public ModelAndView editProductPage(@ModelAttribute Product product, BindingResult result,
			@PathVariable String partNumber, final RedirectAttributes redirectAttributes) {

		ModelAndView mav = new ModelAndView("redirect:/home/catalogue/product/" + product.getPartNumber());
		pservice.changeProduct(product);
		String message = "Product " + product.getPartNumber() + " sucessfully updated.";
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

}