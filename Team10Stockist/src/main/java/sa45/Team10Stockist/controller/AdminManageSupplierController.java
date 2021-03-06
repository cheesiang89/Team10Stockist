package sa45.Team10Stockist.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.Supplier;
import sa45.Team10Stockist.model.User;
import sa45.Team10Stockist.service.ProductService;
import sa45.Team10Stockist.service.SupplierService;

@RequestMapping(value = "/admin")
@Controller
@ControllerAdvice
public class AdminManageSupplierController {
	@Autowired
	ProductService pservice;
	
	@Autowired
	SupplierService sservice;
	
	@RequestMapping(value = "/manage/supplier", method = RequestMethod.GET)
	public ModelAndView supplierManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView("supplier-management");
		
		if (session.getAttribute("USERSESSION") == null) {
			mav.setViewName("redirect:/home");
		} else {
			
			ArrayList<Product> plist = pservice.findAllProduct();
			mav.addObject("plist", plist);
			
			ArrayList<Supplier> slist = sservice.findAllSupplier();
			mav.addObject("slist", slist);
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/management/supplier/edit/{sid}", method = RequestMethod.GET)
	public @ResponseBody List<Product> supplierManagementEdit(@PathVariable String sid) {
		Supplier s = sservice.findSupplier(Integer.parseInt(sid));
		return s.getProducts();
	}
	
	@RequestMapping(value = "/management/supplier/getProduct/{pid}", method = RequestMethod.GET)
	public @ResponseBody Product getProductById(@PathVariable String pid) {
		Product p = pservice.findProduct(Integer.parseInt(pid));
		return p;
	}
	
	@RequestMapping(value = "/management/supplier/update", method = RequestMethod.POST)
	public @ResponseBody void updateSupplier(@RequestBody List<Map<String, String>> json) {
		Supplier s = new Supplier();
		s.setSupplierId(Integer.parseInt(json.get(0).get("supplierId")));
		s.setSupplierName(json.get(0).get("supplierName"));
		s.setContactNumber(Integer.parseInt(json.get(0).get("contact")));
		ArrayList<Product> plist = new ArrayList<Product>();
		System.out.println("0000001");
		for(Map<String,String> row : json) {
			int pNo = Integer.parseInt(row.get("partNumber"));
			Product p = pservice.findProduct(pNo);
			plist.add(p);
		}
		s.setProducts(plist);
		sservice.createSupplier(s);
	}
	
	
	@RequestMapping(value = "/management/supplier/delete/{sid}", method = RequestMethod.GET)
	public @ResponseBody void deleteProduct(@PathVariable String sid,
			final RedirectAttributes redirectAttributes) {
		sservice.removeSupplier(sservice.findSupplier((Integer.parseInt(sid))));
	}
}
