package sa45.Team10Stockist.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.iss.cats.controller.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import sa45.Team10Stockist.repository.ProductRepository;
import sa45.Team10Stockist.service.ProductService;
import sa45.Team10Stockist.model.Product;


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
		UserSession us = (UserSession) session.getAttribute("USERSESSION");
		if (us.getSessionId() != null) {
		mav = new ModelAndView("browse-catalogue");
		ArrayList<Product> productList = (ArrayList<Product>)pService.findAllProduct();
		mav.addObject("plist", productList);
		return mav;
		}
		return mav;
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home/login";

	}
}
