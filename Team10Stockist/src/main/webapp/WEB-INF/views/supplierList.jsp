<%@page import="sa45.Team10Stockist.model.Product"%>
<%@page import="sa45.Team10Stockist.model.Supplier"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>


<%
	ArrayList<Supplier> slist = (ArrayList<Supplier>) request.getAttribute("slist");
	PrintWriter print = response.getWriter();
	StringBuffer t = new StringBuffer();
	t.append("<table>");
	t.append("<tr>");
	//col 1
	t.append("<th>Supplier ID<th>");
	//col 2
	t.append("<th>Supplier Name<th>");
	//col 3
	t.append("<th>Contact Number<th>");
	//col 4
	t.append("<th>Parts<td>");
	t.append("<th colspan=\"2\"></th>");
	t.append("</tr>");
	for (Supplier s : slist) {
		t.append("<tr>");
		//col 1
		t.append("<td class=\"td-sid\">"+s.getSupplierId()+"<td>");
		//col 2
		t.append("<td class=\"td-sname\">"+s.getSupplierName()+"<td>");
		//col 3
		t.append("<td class=\"td-contact\">"+s.getContactNumber()+"<td>");
		//col 4
		t.append("<td>");
		for(Product p : s.getProducts()){
			t.append(p.getName() + " ( "+p.getPartNumber()+" ) ");
			t.append("<br>");
		}
		t.append("<td>");
		t.append("<td><input onclick=\"showPanel(this)\" type=\"button\" value=\"Show\" name=\""+s.getSupplierId()+"\"></td>");
		t.append("<td><input type=\"button\" value=\"Delete\" onclick=\"deleteSupplierRow(this)\" ></td>");
		t.append("</tr>");
	}
	t.append("</table>");
	print.println(t);
%>