package sa45.Team10Stockist.controller;

import java.util.*;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.databind.ObjectMapper;
import sa45.Team10Stockist.javabeans.Usage;
import sa45.Team10Stockist.model.*;
import sa45.Team10Stockist.service.CustomerService;
import sa45.Team10Stockist.service.ProductService;
import sa45.Team10Stockist.service.TransactionDetailService;
import sa45.Team10Stockist.service.TransactionService;


@Controller
@RequestMapping(value = "/mechanic")
public class MechanicController {
	
	@Autowired
	ProductService pservice;
	
	@Autowired
	TransactionService tservice;
	
	@Autowired
	CustomerService cservice;

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private TransactionDetailService transactionDetailService;
	
	@RequestMapping(value = "/usage", method = RequestMethod.GET)
	public ModelAndView newUsagePage() {
		ModelAndView mav = new ModelAndView("usage");
		List<Customer> customerlist = cservice.findAllCustomer();
		mav.addObject("customerlist",customerlist);
		List<Product> productlist = pservice.findAllProduct();
		mav.addObject("productlist", productlist);
		List<Transaction> translist = tservice.findAllTransaction();
		mav.addObject("translist",translist);
		return mav;
	}

/*	@RequestMapping(value="/usage/transaction",method = RequestMethod.GET)
	public @ResponseBody String findTransactionLength() {
		 Integer Arrlength = (tservice.findAllTransaction().size())+1;
		 String l = Arrlength.toString();
		 return l;
	}
	*/
	
	@RequestMapping(value = "/usage/customer/{customerId}", method= RequestMethod.GET)
	public @ResponseBody String findCustomerName(@PathVariable String customerId){
		return cservice.findCustomer(Integer.parseInt(customerId)).getCustomerName();
	}
	
	@RequestMapping(value = "/usage/part/{partNumber}", method= RequestMethod.GET)
	public @ResponseBody String findProductName(@PathVariable String partNumber){
		return pservice.findProduct(Integer.parseInt(partNumber)).getName();
	}
	
	@RequestMapping(value = "/usage/part/price/{partNumber}", method= RequestMethod.GET)
	public @ResponseBody String findProductPrice(@PathVariable String partNumber){
		Double unitPrice = pservice.findProduct(Integer.parseInt(partNumber)).getUnitPrice();
		String strUnitPrice = unitPrice.toString();
		return strUnitPrice;
	}
	
	
	@RequestMapping(value = "/usage",method = RequestMethod.POST)
	@ResponseBody
	/**
	 * json -> [{customerId: 3, partNumber: 78, quantity: 11}]
	 */
	public String approveTransaction(@RequestBody List<Map<String, Integer>> json, HttpSession session){
		UserSession us = (UserSession) session.getAttribute("USERSESSION");
		if (us == null) return "redirect:/home";
		User user= us.getUser();
		Date now = new Date();
		Integer customerId = json.get(0).get("customerId");
		Transaction transaction = new Transaction();
		transaction.setUser(user);
		transaction.setCustomer(cservice.findCustomer(customerId));
		transaction.setDatetime(now);
		transactionService.saveTrans(transaction); 
		for (Map<String, Integer> row: json) {
			Integer partNumber = row.get("partNumber");
			Integer quantity = row.get("quantity");
			TransactionDetail transactionDetail = new TransactionDetail();
			TransactionDetailPK pk = new TransactionDetailPK();
			pk.setTransId(transaction.getTransId());
			pk.setPartNumber(partNumber);
			transactionDetail.setId(pk);
			transactionDetail.setProduct(pservice.findProduct(partNumber));
			transactionDetail.setQuantity(quantity);
			transactionDetail.setTransaction(transaction);
			transactionDetailService.saveTransactionDetail(transactionDetail);
		}
		return "success";
	}
	

	
}