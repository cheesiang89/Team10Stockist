package sa45.Team10Stockist.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sa45.Team10Stockist.repository.ProductRepository;
import sa45.Team10Stockist.service.ProductService;
import sa45.Team10Stockist.model.Product;
import org.springframework.beans.factory.annotation.Autowired;

@RequestMapping(value = "/home")
@Controller
public class BrowseCatalogueController {
	@Autowired
	private ProductService pService;
	
	@RequestMapping(value = "/catalogue", method= RequestMethod.GET)
	public ModelAndView browseCataloguePage() {
		ModelAndView mav = new ModelAndView("browse-catalogue");
		ArrayList<Product> productList = (ArrayList<Product>)pService.findAllProduct();
		mav.addObject("plist", productList);
		return mav;
	}
}
