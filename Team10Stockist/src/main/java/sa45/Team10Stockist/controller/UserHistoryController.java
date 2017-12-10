package sa45.Team10Stockist.controller;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView historyProduct(@PathVariable String partNumber){
		ModelAndView mav = new ModelAndView("history");
		Product p = pService.findProduct(Integer.parseInt(partNumber));
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
}
