package sa45.Team10Stockist.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.User;
import sa45.Team10Stockist.service.ProductService;

@RequestMapping(value = "/home")
@Controller
public class UserBrowseCatalogueController {

	@Autowired
	private ProductService pService;

	
	@RequestMapping(value = "/catalogue", method= RequestMethod.GET)
	public ModelAndView browseCataloguePage( @ModelAttribute User user,HttpSession session ) {
		ModelAndView mav = new ModelAndView("login");
		 		 mav = new ModelAndView("browse-catalogue");
			ArrayList<Product> productList = (ArrayList<Product>)pService.findAllProduct();
			mav.addObject("plist", productList);
			mav.addObject("session",session);
			return mav;
		
		}
	
	@RequestMapping(value = "/catalogue", method= RequestMethod.POST)
	public ModelAndView filteredCataloguePage(WebRequest request) {
		String searchParameter= request.getParameter("search");	
		String colorParameter = request.getParameter("color");	
		String manufacturerParameter = request.getParameter("manufacturer");	
	    String[] criteria = {searchParameter,colorParameter,manufacturerParameter};
	
		ModelAndView mav = new ModelAndView("browse-catalogue");
		ArrayList<Product> productList = (ArrayList<Product>)pService.findAllProductByCriteria(criteria);
		//ArrayList<Product> productList = (ArrayList<Product>)pService.findAllProductByCriteria(new String[] {"","",""});
		mav.addObject("plist", productList);
		return mav;
		
		}
		
	
	@RequestMapping(value = "/catalogue/delete/{partNumber}", method= RequestMethod.GET)
	public @ResponseBody void deleteProduct(@PathVariable String partNumber, final RedirectAttributes redirectAttributes){
		pService.removeProduct(pService.findProduct(Integer.parseInt(partNumber)));
	}

}
