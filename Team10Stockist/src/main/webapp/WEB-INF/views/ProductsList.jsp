<%@page import="java.io.PrintWriter"%>
<%@page import="sa45.Team10Stockist.model.Product"%>
<%@page import="sa45.Team10Stockist.controller.UserSession"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>


<%
String userRole = ((UserSession)session.getAttribute("USERSESSION")).getUser().getRole();
	ArrayList<Product> plist = (ArrayList<Product>) request.getAttribute("plist");
	DecimalFormat d=new DecimalFormat("0.00");
	NumberFormat formatter=NumberFormat.getCurrencyInstance();
	PrintWriter print = response.getWriter();
	StringBuffer t = new StringBuffer();
// 	t.append("<p>"+userRole.toUpperCase()+"</p>");
	t.append("<table id=\"products\">");
	t.append("<tr >");
	t.append("<th>Part Number</th>");
	t.append("<th>Name</th>");
	t.append("<th>Color</th>");
	t.append("<th>Manufacturer</th>");
	t.append("<th>Dimension</th>");
	t.append("<th>Unit Price</th>");
	t.append("<th colspan=\"4\"></th>");
	t.append("</tr>");
	for (Product p : plist) {
		t.append("<tr class=\"data\">");
		t.append("<td class=\"partNumber\">" + p.getPartNumber() + "</td>");
		t.append("<td class=\"name\">" + p.getName() + "</td>\n");
		t.append("<td class=\"color\">" + p.getColor() + "</td>\n");
		t.append("<td class=\"manufacturer\">" + p.getManufacturer() + "</td>");
		t.append("<td>" + p.getDimension() + "</td>");
		t.append("<td>" + formatter.format(p.getUnitPrice()) + "</td>");
		/* t.append("<td><a href=\"http://google.com\" class=\"button\">Go1 to Google</a></td>"); */
				
		t.append("<td><input type=\"button\" value=\"History\" onclick=\"location.href='/team10stockist/home/catalogue/history/"+p.getPartNumber() +"'\"></td>");
		t.append("<td><input type=\"button\" value=\"Detail\" onclick=\"location.href='/team10stockist/home/catalogue/product/"+p.getPartNumber() +"'\"></td>");
		if (userRole.equalsIgnoreCase("ADMIN")){
		t.append("<td><input type=\"button\" value=\"Edit\" onclick=\"location.href='/team10stockist/admin/product/edit/"+p.getPartNumber() +"'\"></td>");
		t.append("<td><input type=\"button\" value=\"Delete\" onclick=\"deleteRow(this)\" name=\"" +p.getPartNumber() +"\"></td>");
		}
		
		t.append("</tr>");
	}
	t.append("</table>");
	print.println(t);
%>
