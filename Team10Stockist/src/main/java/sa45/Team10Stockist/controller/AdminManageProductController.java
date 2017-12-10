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
import sa45.Team10Stockist.model.Supplier;
import sa45.Team10Stockist.repository.SupplierRepository;
import sa45.Team10Stockist.service.ProductService;


@RequestMapping(value = "/admin")
@Controller
public class AdminManageProductController {

	@Autowired
	ProductService pservice;
	
	@Autowired
	SupplierRepository sservice;

	@RequestMapping(value = "/product/add", method = RequestMethod.GET)
	public ModelAndView newProductPage() {
		Product p = new Product();
		ModelAndView mav = new ModelAndView("add", "product", p);
		return mav;
	}

	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public ModelAndView createNewProduct(@ModelAttribute Product product, BindingResult result,
			final RedirectAttributes redirectAttributes) {

		ModelAndView mav = new ModelAndView();
		pservice.createProduct(product);
		String message = "New Product" + product.getPartNumber() + "was successfully created.";
		mav.setViewName("redirect:/home/catalogue");
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}

	@RequestMapping(value = "/product/edit/{partNumber}", method = RequestMethod.GET)
	public ModelAndView editProductPage(@PathVariable String partNumber) {
		
		ModelAndView mav = new ModelAndView("edit");
		int pnum = Integer.parseInt(partNumber);
		Product product = pservice.findProduct(pnum);
		mav.addObject("product", product);
		return mav;

	}

	@RequestMapping(value = "/product/edit/{partNumber}", method = RequestMethod.POST)
	public ModelAndView editProductPage(@ModelAttribute Product product, BindingResult result, @PathVariable String partNumber,
			final RedirectAttributes redirectAttributes) {
		
		ModelAndView mav = new ModelAndView("redirect:/home/catalogue/product/" + product.getPartNumber());
		pservice.changeProduct(product);
		String message = "Product " + product.getPartNumber() + " sucessfully updated.";
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}
	
	@RequestMapping(value = "/report", method= RequestMethod.GET)
	public ModelAndView reportPage(){
		ModelAndView mav = new ModelAndView("report");
		ArrayList<Supplier> supplierList = (ArrayList<Supplier>)sservice.findAll();
		mav.addObject("supplierList", supplierList);
		return mav;		
	}

}
