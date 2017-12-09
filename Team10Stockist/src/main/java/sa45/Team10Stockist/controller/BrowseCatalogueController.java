package sa45.Team10Stockist.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import org.springframework.beans.factory.annotation.Autowired;
import sa45.Team10Stockist.repository.ProductRepository;
import sa45.Team10Stockist.service.ProductService;
import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.Transaction;
import sa45.Team10Stockist.model.TransactionDetail;;


//TODO
// 1. Check session login data (Admin/mechanic)
// 2. Delete product
//3. Adjust filter list
//4. Get product list
@RequestMapping(value = "/home")
@Controller
public class BrowseCatalogueController {
	@Autowired
	private ProductService pService;

	
	@RequestMapping(value = "/catalogue", method= RequestMethod.GET)
	public ModelAndView browseCataloguePage() {
		ModelAndView mav = new ModelAndView("login");
		//UserSession us = (UserSession) session.getAttribute("USERSESSION");
		//if (us.getSessionId() != null) {
		mav = new ModelAndView("browse-catalogue");
		ArrayList<Product> productList = (ArrayList<Product>)pService.findAllProduct();
		mav.addObject("plist", productList);
		return mav;
		//}
		//return mav;
	}
	
	/*@RequestMapping(value = "/catalogue/delete/{partNumber}", method= RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable String partNumber, final RedirectAttributes redirectAttributes){
		
		pService.removeProduct(pService.findProduct(Integer.parseInt(partNumber)));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/home/catalogue");
		return mav;
		
	}*/
	
	@RequestMapping(value = "/catalogue/delete/{partNumber}", method= RequestMethod.GET)
	public @ResponseBody void deleteProduct(@PathVariable String partNumber, final RedirectAttributes redirectAttributes){
		
		pService.removeProduct(pService.findProduct(Integer.parseInt(partNumber)));
	}
	
	@RequestMapping(value = "/catalogue/history/{partNumber}", method= RequestMethod.GET)
	public ModelAndView historyProduct(@PathVariable String partNumber){
		ModelAndView mav = new ModelAndView("historyjsp");
		Product p = pService.findProduct(Integer.parseInt(partNumber));
		/*ArrayList<TransactionDetail> tlist = (ArrayList<TransactionDetail>)p.getTransactionDetails();*/
		List<TransactionDetail> tlist = p.getTransactionDetails();
		
		HashSet<Transaction> tset = new HashSet<Transaction>();
		for(TransactionDetail t : tlist) {
			tset.add(t.getTransaction());
		}
		
		mav.addObject("p", p);
		mav.addObject("tlist", tlist);
		mav.addObject("tset", tset);
		return mav;
		
	}
	
	/*@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home/login";

	}*/
	
}
