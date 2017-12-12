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

	@RequestMapping(value="/usage/transaction",method = RequestMethod.GET)
	public @ResponseBody String findTransactionLength() {
		 Integer Arrlength = (tservice.findAllTransaction().size())+1;
		 String l = Arrlength.toString();
		 return l;
	}
	
	
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
		for (Map<String, Integer> row: json) {
			Integer customerId = row.get("customerId");
			Integer partNumber = row.get("partNumber");
			Integer quantity = row.get("quantity");
			Transaction transaction = new Transaction();
			transaction.setUser(user);
			transaction.setCustomer(cservice.findCustomer(customerId));
			transaction.setDatetime(now);
			transactionService.saveTrans(transaction);  // get the id
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
	
/*	@RequestMapping(value = "/course/edit/{id}", method = RequestMethod.POST)
	public ModelAndView approveOrRejectCourse(@ModelAttribute("approve") Approve approve, BindingResult result,
			@PathVariable Integer id, HttpSession session, final RedirectAttributes redirectAttributes) {
		if (result.hasErrors())
			return new ModelAndView("manager-course-detail");
		Course c = cService.findCourse(id);
		CourseEvent ce = new CourseEvent();
		UserSession us = (UserSession) session.getAttribute("USERSESSION");
		if (approve.getDecision().equalsIgnoreCase(Course.APPROVED)) {
			ce.setEventType(Course.APPROVED);
			c.setStatus(Course.APPROVED);
		} else {
			ce.setEventType(Course.REJECTED);
			c.setStatus(Course.REJECTED);
		}
		ce.setEventBy(us.getEmployee().getEmployeeId());
		ce.setComment(approve.getComment());
		ce.setTimeStamp(Calendar.getInstance().getTime());
		ce.setCourse(c);
		ArrayList<CourseEvent> celist = c.getEvents();
		celist.add(ce);
		c.setEvents(celist);
		System.out.println(c.toString());
		cService.changeCourse(c);
		ceService.createCourseEvent(ce);
		ModelAndView mav = new ModelAndView("redirect:/manager/pending");
		String message = "Course was successfully updated.";
		redirectAttributes.addFlashAttribute("message", message);
		return mav;
	}*/

	
}