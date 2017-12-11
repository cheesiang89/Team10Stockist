<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.NumberFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="sa45.Team10Stockist.model.Supplier"%>
<%@page import="sa45.Team10Stockist.model.Product"%>
<%@page import="sa45.Team10Stockist.controller.UserSession"%>


<%
	ArrayList<Supplier> sList = (ArrayList<Supplier>) request.getAttribute("sList");
	ArrayList<List<Product>> pList=(ArrayList<List<Product>>)request.getAttribute("pList");
	DecimalFormat d=new DecimalFormat("0.00");
	NumberFormat formatter=NumberFormat.getCurrencyInstance();
	int actualOrder=0;
	PrintWriter print = response.getWriter();
	StringBuffer t = new StringBuffer();
	t.append("<h3>Reorder Report</h3>");
	for (int i = 0; i < sList.size(); i++) {
		double total=0;
		t.append("<table id=\"products\">");
		t.append("<tr>");
		t.append("<th style=\"text-align:center\" colspan=\"7\"><b>Inventory Reorder Report for Supplier "+sList.get(i).getSupplierName()+"</b></th>");
		t.append("</tr>");
		t.append("<tr >");
		t.append("<th>Part Number</th>");
		t.append("<th>Unit Price</th>");
		t.append("<th>Qty</th>");
		t.append("<th>Reorder Qty</th>");
		t.append("<th>Min.Ord.Qty</th>");
		t.append("<th>Ord.Qty</th>");
		t.append("<th>Price</th>");
		t.append("</tr>");
		
		for(int j=0; j < pList.get(i).size(); j++){
			double subtotal =0 ;
			Product p = pList.get(i).get(j);
			t.append("<tr>");
			t.append("<td>" + p.getPartNumber() + "</td>");
			t.append("<td>" + p.getUnitPrice()+ "</td>");
			t.append("<td>" + p.getStockQuantity() + "</td>");
			t.append("<td>" + p.getMinimumInventoryQuantity() + "</td>");
			t.append("<td>" + p.getMinimumReorderQuantity()+ "</td>");
			if(p.getMinimumInventoryQuantity()>p.getStockQuantity()){
				if(p.getMinimumInventoryQuantity()-p.getStockQuantity()>p.getMinimumReorderQuantity())
				{
					actualOrder=p.getMinimumInventoryQuantity()-p.getStockQuantity();
					
				}else
				{
					actualOrder=p.getMinimumReorderQuantity();					
				}
				subtotal = actualOrder * p.getUnitPrice();
			}else{
				actualOrder=0;
			}
			t.append("<td>" + actualOrder + "</td>");
			total= total + subtotal;
			t.append("<td style=\"text-align:right\">" + d.format(subtotal)+ "</td>");
		}
		t.append("</tr>");
		t.append("<tr><td colspan=\"7\" style=\"text-align:right\"><b>"+formatter.format(total)+"</b></td></tr>");
		t.append("<br>");
	}
	t.append("</table>");
	print.println(t);
%>























