<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
<span>${p.name}</span>
<table>
<c:forEach var="tdetail" varStatus="idx" items="${tlist}" >
<tr>
<td>${tdetail.transaction.customer.customerName}</td>
</tr>
</c:forEach>
</table>

</body>
