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
				id="selectCustomer" onchange="showCustomerName()">
					<option value="">Select Customer ID</option>
					<c:forEach items="${customerlist}" var="customer">
						<option value="${customer.customerId}">${customer.customerId}</option>
					</c:forEach>
			</select></td>
			<td><spring:message code="fieldLabel.partNumber" /></td>
			<td colspan="3">
			<select name='selectPart' id="selectPart" onchange ="showPartDetails()">
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
				<input id="txtcName" size="25" readonly= "readonly"/>
			</td>
			<td><spring:message code="fieldLabel.partName" /></td>
			<td colspan="3">
				<input id="txtpName" size="25" readonly= "readonly"/>
			</td>
		</tr>
		<tr>
			<td><spring:message code="fieldLabel.date" /></td>
			<td colspan="3"><input type="date" id="transTime" name="transTime" size="25"/></td>
			<td><spring:message code="fieldLabel.quantity" /></td>
			<td colspan="3">
				<input id="txtQty" size="25" />
			</td>
			<td><spring:message code="fieldLabel.unitprice" /></td>
			<td colspan="3">
				<input id="txtUprice" size="25" readonly= "readonly"/>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right"><input type="reset" value="Clear" onclick="clearText()"></td>
			<td colspan="5" align="right"><input type="button" id="Add" value="Add" onclick="addItemAndRow()"/></td>
		</tr>
	</table>
	<table>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
		</table>
	<table id="transTable" border="1">
			<tr>
				<th>Part Number</th>
				<th>Part Name</th>
				<th>Quantity</th>
				<th>Unit Price</th>
				<th>Total Price</th>
				<th></th>
			</tr>
	</table>
	<table>
	<tr>
		<td colspan="10" align="left"><input type="button" value="Submit"/></td>
		<td colspan="10"></td>
		<td colspan="10"></td>
		<td colspan="10"></td>
		<td colspan="10"></td>
		<td colspan="10"></td>
		<td colspan="10" align="right"><input type="button" id="Cancel" value="Cancel" onclick="location.href='/team10stockist/home/catalogue'"/></td>
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

function showPartDetails() {
 	var a = selectPart.options[selectPart.selectedIndex].value;
	var txtpName = document.getElementById('txtpName');
	var searchurl1="/team10stockist/mechanic/usage/part/"+a;
	$.ajax({url: searchurl1, success:function(result1){txtpName.value = result1}}); 
	var txtUprice = document.getElementById('txtUprice');
	var searchurl2="/team10stockist/mechanic/usage/part/price/"+a;
	$.ajax({url: searchurl2, success:function(result2){txtUprice.value =result2}}); 
}

function clearText()  
{
    document.getElementById('txtQty').value = "";
    document.getElementById('selectCustomer').selectedIndex = 0;
    document.getElementById('selectPart').selectedIndex = 0;
    document.getElementById('txtcName').value = "";
    document.getElementById('txtpName').value = "";
    document.getElementById('txtUprice').value = "";
}

var index=1;
function addItemAndRow(){
	if(txtQty.value == ""){
		window.alert("Part quantity cannot be empty.");
	}
	else {
		var t = $("#transTable");
		t.append("<tr><td><input id=\"txtTtpid"+index+"\" readonly= \"readonly\" style=\"border:0\"/></td>"+
				"<td><input id=\"txtTtpName"+index+"\" readonly= \"readonly\" style=\"border:0\"/></td>"+
				"<td><input id=\"txtTtQty"+index+"\" style=\"border:0\"/></td>"+
				"<td><input id=\"txtTtPrice"+index+"\" readonly= \"readonly\" style=\"border:0\"/></td>"+
				"<td><input id=\txtTtSubTotal"+index+"\" readonly= \"readonly\" style=\"border:0\"/></td>"+
				"<td><input type=\"button\" id=\"btnDlt"+index+"\" class=\"Delete\" value=\"Delete\" onclick= \"deleteThisRow(this)\"/></td></tr>");
			var a = selectPart.options[selectPart.selectedIndex].value;
			var aId = "txtTtpid"+index;
			document.getElementById(aId).value = a;
			var b = document.getElementById('txtpName').value;
			var bId = "txtTtpName"+index;
			document.getElementById(bId).value = b;
			var c = document.getElementById('txtQty').value;
			var cId = "txtTtQty"+index;
			document.getElementById(cId).value = c; 
			var d = document.getElementById('txtUprice').value;
			var dId = "txtTtPrice"+index;
			document.getElementById(dId).value = d; 		
		index++;
	    document.getElementById('txtQty').value = "";
	    document.getElementById('selectPart').selectedIndex = 0;
	    document.getElementById('txtpName').value = "";
	    document.getElementById('txtUprice').value = "";	
	}
}


function deleteThisRow(btn){
	var row = btn.parentNode.parentNode;
	row.parentNode.removeChild(row);
	
	}   

</script>
</body>