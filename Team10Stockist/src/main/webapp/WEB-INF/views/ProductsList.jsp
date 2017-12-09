<%@page import="java.io.PrintWriter"%>
<%@page import="sa45.Team10Stockist.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>

<%
	ArrayList<Product> plist = (ArrayList<Product>) request.getAttribute("plist");
	PrintWriter print = response.getWriter();
	StringBuffer t = new StringBuffer();
	t.append("<table id=\"products\">");
	t.append("<tr >");
	t.append("<th style=' padding-top: 12px;padding-bottom: 12px;text-align: left;background-color: #45c693;color: white;'>Part Number</th>");
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
		t.append("<td>" + p.getUnitPrice() + "</td>");
		/* t.append("<td><a href=\"http://google.com\" class=\"button\">Go1 to Google</a></td>"); */
		t.append("<td><input type=\"button\" value=\"History\" onclick=\"location.href='/team10stockist/home/catalogue/history/"+p.getPartNumber() +"'\"></td>");
		t.append("<td><input type=\"button\" value=\"Detail\" onclick=\"location.href='/team10stockist/home/catalogue/product/"+p.getPartNumber() +"'\"></td>");
		t.append("<td><input type=\"button\" value=\"Edit\" onclick=\"location.href='/team10stockist/admin/product/edit/"+p.getPartNumber() +"'\"></td>");
		t.append("<td><input type=\"button\" value=\"Delete\" onclick=\"deleteRow(this)\" name=\"" +p.getPartNumber() +"\"></td>");
		t.append("</tr>");
	}
	t.append("</table>");
	print.println(t);
%>
