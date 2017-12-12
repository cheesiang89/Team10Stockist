package sa45.Team10Stockist.controller;

import java.util.ArrayList;
//import java.util.function.Supplier;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sa45.Team10Stockist.model.Product;
import sa45.Team10Stockist.model.Supplier;
import sa45.Team10Stockist.model.User;
import sa45.Team10Stockist.service.SupplierService;

@RequestMapping(value = "/admin")
@Controller
public class AdminReorderReportController {
	@Autowired
	SupplierService sservice;

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView reorderList(HttpSession session) {
		ModelAndView mav = new ModelAndView("report");
		if (session.getAttribute("USERSESSION") == null) {
			// Can be replaced with access denial
			mav.setViewName("redirect:/home");
		} else {
			ArrayList<Supplier> sList = sservice.findAllSupplier();
			ArrayList<List<Product>> pList = new ArrayList<List<Product>>();
			for (int i = 0; i < sList.size(); i++) {
				Supplier s = sList.get(i);
				pList.add(s.getProducts());
			}
			;
			mav.addObject("sList", sList);
			mav.addObject("pList", pList);
		}
		return mav;
	}
}
