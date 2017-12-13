
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="editdiv">
<table>
<tr>
<td><span class="edititem">Supplier ID: </span></td>
<td><input style="text" id="text-sid" placeHolder="Supplier ID" class="edittext"/></td>
</tr>
<tr>
<td><span class="edititem">Supplier Name: </span></td>
<td><input style="text" id="text-sname" placeHolder="Supplier Name" class="edittext"/></td>
</tr>
<tr>
<td><span class="edititem">Contact Number: </span></td>
<td><input style="text" id="text-contact" placeHolder="Contact Name" class="edittext"/></td>
</tr>
<tr>
<td><span class="edititem">Supply: </span></td>
<td>
<select id="addPartSelect" name="Part">
	<option value="">All</option>
	<c:forEach var="p" varStatus="idx" items="${plist}">
				<option value="${p.partNumber}">${p.name} ( ${p.partNumber} )</option>
	</c:forEach>
</select>
</td>
<td>
<input type="button" value="Add Part" onclick="addPartRow()"/>
</td>
</tr>
</table>

</div>

<div class="editdiv">

<div id="productList"></div>

<div id="addRow" >

</div>

<!-- <div id="addButton">
<input type="button" value="Add" onclick="AddPartRow()"/>
</div> -->
<br>
</div>
<script>
function addPartRow(){
	var goToUrl="/team10stockist/admin/management/supplier/getProduct/"+$("#addPartSelect").val();
	
	$.ajax
	({url:goToUrl,success:
		function(productDetail){
			var ptable = $("#PartTable");
			ptable.append("<tr><td class=\"td-pid\">"+productDetail.partNumber+"</td>"+
					"<td class=\"td-pname\">"+productDetail.name+"</td>"+
					"<td>"+productDetail.color+"</td>"+
					"<td>"+productDetail.description+"</td>"+
					"<td>"+productDetail.dimension+"</td>"+
					"<td><input type=\"button\" value=\"Detail\" onclick=\"location.href='/team10stockist/home/catalogue/product/"+productDetail.partNumber +"'\"></td>"+
					"<td><input type=\"button\" value=\"Delete\" onclick=\"deletePartRow(this)\"></td></tr>")
		}
	})
}</script>
