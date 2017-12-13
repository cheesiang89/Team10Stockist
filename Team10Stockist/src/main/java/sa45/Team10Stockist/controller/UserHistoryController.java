package sa45.Team10Stockist.controller;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import sa45.Team10Stockist.model.Transaction;
import sa45.Team10Stockist.model.TransactionDetail;
import sa45.Team10Stockist.service.ProductService;

@RequestMapping(value = "/home")
@Controller
public class UserHistoryController {
	
	@Autowired
	private ProductService pService;

	
	@RequestMapping(value = "/catalogue/history/{partNumber}", method= RequestMethod.GET)
	public ModelAndView historyProduct(@PathVariable String partNumber, HttpSession session){
		ModelAndView mav = new ModelAndView("history");
		if (session.getAttribute("USERSESSION") == null) {
			mav.setViewName("redirect:/home");
		} else {
		Product p = pService.findProduct(Integer.parseInt(partNumber));
		List<TransactionDetail> tlist = p.getTransactionDetails();
		
		HashSet<Transaction> tset = new HashSet<Transaction>();
		for(TransactionDetail t : tlist) {
			tset.add(t.getTransaction());
		}		
		mav.addObject("tlist", tlist);
		}
		return mav;		
	}
	
	@RequestMapping(value = "/catalogue/history/{partNumber}", method = RequestMethod.POST)
	public ModelAndView historyProduct() {
		ModelAndView mav = new ModelAndView("redirect:/home/catalogue");	
		return mav;
	}
}
