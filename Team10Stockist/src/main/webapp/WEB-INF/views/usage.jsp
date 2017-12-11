<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form method="POST">
.cellStyle{
     border: 1 
     column-span:5
}
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
			<select name='selectPart' id="selectPart" onchange ="showPartName()">
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
		</tr>
		<tr>
			<td colspan="4" align="right"><input type="reset" value="Clear" onclick="clearText()"></td>
			<td colspan="5" align="right"><button id="Add" onclick="addItemAndRow()">Add</button></td>
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
				<th colspan="5">Part Number</th>
				<th colspan="5">Part Name</th>
				<th colspan="5">Quantity</th>
				<th colspan="5"></th>
			</tr>
			<tr>
				<td colspan="5"><input id="txtTtpid" style="border:0"/></td>
				<td colspan="5"><input id="txtTtpName" style="border:0" /></td>
				<td colspan="5"><input id="txtTtQty" style="border:0" /></td>
				<td colspan="5"><button id="btnDelete" onclick= "deleteThisRow(this)"></button></td>
			</tr>
	</table>
	<table>
	<tr>
		<td colspan="4" align="right"><button type="submit" value="Submit">Submit</button></td>
		<td colspan="5" align="right"><button id="Cancel" id="Cancel" onclick="location.href='/team10stockist/home/catalogue'">Cancel</button></td>
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

function clearText()  
{
    document.getElementById('txtQty').value = "";
    document.getElementById('selectCustomer').selectedIndex = 0;
    document.getElementById('selectPart').selectedIndex = 0;
    document.getElementById('txtcName').value = "";
    document.getElementById('txtpName').value = "";
   // document.getElementById('transTime').valueAsDate =null;
}  

function addItemAndRow(){
	var a = selectPart.options[selectPart.selectedIndex].value;
	document.getElementById('txtTtpid').value = a ;
	var b = document.getElementById('txtpName').value;
	document.getElementById('txtTtpName').value =b;
	var c = document.getElementById('txtQty').value;
	document.getElementById('txtTtQty').value = c;
	var table = document.getElementById("transTable");
	var row = table.insertRow(2);
	var cell1=row.insertCell(0);
	cell1.className= 'cellStyle';
    var cell2=row.insertCell(1);
    cell2.className= 'cellStyle';
    var cell3=row.insertCell(2);
    cell3.className= 'cellStyle';
    clearText();
}

function deleteThisRow(btn){
	const no =btn.parentNode.parentNode.getElementsByClassName("partNumber")[0].innerHTML;
	const name =btn.parentNode.parentNode.getElementsByClassName("name")[0].innerHTML;
	if (window.confirm("Do you want to delete "+name+"( Part Number: "+no+" )?")) { 
		const deleteurl= "/team10stockist/home/catalogue/delete/"+ no;
		$.ajax({url: deleteurl});
		var row = btn.parentNode.parentNode;
		row.parentNode.removeChild(row);
		
	
	
}

</script>
</body>