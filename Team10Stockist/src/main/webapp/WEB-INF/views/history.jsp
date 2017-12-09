<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form method="POST">
	<h3>
		${p.name} Transaction
	</h3>
	<c:if test="${fn:length(tlist) gt 0}">
		<table style="cellspacing: 2; cellpadding: 2; border: 1; width: 100%">
			<thead>
				<tr class="listHeading"
					; style="text-align: center; background-color: #45c693">
					<th style="color: #ffffff"><b>Transaction ID</b></th>
					<th style="color: #ffffff"><b>Date</b></th>
					<th style="color: #ffffff"><b>Product Name</b></th>
					<th style="color: #ffffff"><b>Quantity</b></th>
					<th style="color: #ffffff"><b>Customer Name</b></th>
					<th style="color: #ffffff"><b>User Name</b></th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="tdetail" varStatus="idx" items="${tlist}">
					<tr style="text-align: center">
						<td style="color: #1d8499">${tdetail.transaction.transId}</td>
						<td style="color: #1d8499">${tdetail.transaction.datetime}</td>
						<td style="color: #1d8499">${tdetail.product.name}</td>
						<td style="color: #1d8499">${tdetail.quantity}</td>
						<td style="color: #1d8499">${tdetail.transaction.customer.customerName}</td>
						<td style="color: #1d8499">${tdetail.transaction.user.name}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tbody>
			<div>
			<td><button><input type="submit" value="Back"/></button></td>	
			</div>
			</tbody>
	</c:if>
</form:form>