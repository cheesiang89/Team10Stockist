<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form method="POST">

<body>
<h3>IMS - New Usage Form</h3>
	<c:if test="${fn:length(customerlist) gt 0}"></c:if>
	<c:if test="${fn:length(productlist) gt 0}"></c:if>
	<table>
		<tr>
			<td><spring:message code="fieldLabel.customerId" /></td>
			<td colspan="3"><select name='selectCustomer'
				id="selectCustomer" onchange = "showCustomerName()">
					<option value="">Select Customer ID</option>
					<c:forEach items="${customerlist}" var="customer">
						<option value="${customer.customerId}">${customer.customerId}</option>
					</c:forEach>
			</select></td>
			<td><spring:message code="fieldLabel.partNumber" /></td>
			<td colspan="3">
			<select name='selectPart' id="selectPart" onchange = "showPartName()">
					<option value="">Select Part Number</option>
					<c:forEach items="${productlist}" var="product">
						<option value="${product.partNumber}">${product.partNumber}</option>
					</c:forEach>
			</select>	
			</td>
		</tr>
		<tr>
			<td><spring:message code="fieldLabel.customerName" /></td>
			<td colspan="3">
				<input id="txtcName" size="25"/>
			</td>
			<td><spring:message code="fieldLabel.partName" /></td>
			<td colspan="3">
				<input id="txtpName" size="25"/>
			</td>
		</tr>
		
	</table>
</form:form>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
function showCustomerName() {
	var a = selectCustomer.options[selectCustomer.selectedIndex].value;
	var txtcName = document.getElementById('txtcName');
	var searchurl="/team10stockist/mechanic/usage/customer/"+a;
	$.ajax({url: searchurl, success:function(result){txtcName.value =result}});
}

function showPartName() {
 	var a = selectPart.options[selectPart.selectedIndex].value;
	var txtpName = document.getElementById('txtpName');
	var searchurl="/team10stockist/mechanic/usage/part/"+a;
	$.ajax({url: searchurl, success:function(result){txtpName.value =result}}); 
}


</script>
</body>