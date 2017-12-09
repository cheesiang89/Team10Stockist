<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<title>IMS - New Usage Form</title>
<h1>IMS - New Usage Form</h1>
<form:form method="POST" modelAttribute="usage"
	action="${pageContext.request.contextPath}/mechanic/usage">
	<table>
		<tr>
			<td><spring:message code="fieldLabel.customerId" /></td>
			<td colspan="3"><form:input type="text" size="30" path="customerId"/></td>
			<td colspan="3"><form:select size="30" path="customerId" items="${customerList}" /></td>
			<td><spring:message code="fieldLabel.partNumber" /></td>
			<td colspan="3"><form:input type="text" size="30" path="partNumber"/></td>
			<td colspan="3"><form:select size="30" path="partNumber"
					items="${productList}" /></td>
		</tr>
		<tr>
			<td><spring:message code="fieldLabel.customerName" /></td>
			<td colspan="3"><form:input type="text" size="30" path="customerName" readonly="true" /></td>
			<td><spring:message code="fieldLabel.partName" /></td>
			<td><form:input size="30" path="partName" readonly="true" /></td>
			<td align="right"><form:button value="Add"/></td>
			<td align="right"><form:button value="Add"
					onclick="addRow('tableID')" /></td>
		</tr>
		<tr>
			<td><spring:message code="fieldLabel.date" /></td>
			<td><form:input size="16" path="date" id="datepicker1" readonly="true"  /></td>
			<td><spring:message code="fieldLabel.quantity" /></td>
			<td><form:input size="16" path="quantity" /></td>
			<td align="right"><form:button value="Clear"/></td>
			<td align="right"><form:button value="Clear"
					onclick="clearFields()" /></td>
			<!-- Need to do validation to check quantity against inventory  -->
		</tr>
	</table>
	<table id="partTable" border="1">
		<tr>
		<th>No.</th>
		<th>Part ID</th>
		<th>Part Name</th>
		<th>Quantity</th>
		</tr>
		<tr>
			<td>1</td>
			<td>123</td>
			<td>tyre</td>
			<td>1</td>
		</tr>
	</table>

<table>
	<tr>
		<td>&nbsp;</td>
		<td colspan="2" align="left"><br></br> <form:button type="submit">
				<img
					src="${pageContext.request.contextPath}/image/button_submit.gif"
					alt="" align="middle">
			</form:button>&nbsp; <a href="javascript:history.back();"> <img
				src="${pageContext.request.contextPath}/image/button_cancel.gif"
				alt="" align="middle" border="0">
		</a></td>
	</tr>
</table>










</form:form>