
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
<td><input style="text" id="text-contact" placeHolder="Contact Number" class="edittext"/></td>
<td>

</td>
</tr>
<tr>
<td><span class="edititem">Supply: </span></td>
<td>
<select id="addPartSelect" name="Part">
	<option value="">Select Part to Add</option>
	<c:forEach var="p" varStatus="idx" items="${plist}">
				<option value="${p.partNumber}">${p.name} ( ${p.partNumber} )</option>
	</c:forEach>
</select>
</td>
<td><input type="button" value="Add Part" onclick="addPartRow()"/></td>
</tr>
</table>

</div>

<div class="editdiv">

<div id="productList"></div>
<input id="updateButton" type="button" value="Update" onclick="updateSupplier()"/>
<br>
</div>
<script>

function addPartRow(){
	var pIdToAdd = $("#addPartSelect").val();
	var tds = $(".td-pid");
	var validator = 1;
	tds.each(function(index, td)
		{
				if (td.innerHTML==pIdToAdd){
					window.alert("This part is already supplied by this supplier");
					validator = 0;
				}
		
		});
	
	if(validator == 1)
	{
		if(pIdToAdd==""){window.alert("Please select a product first");}
		else{
				var goToUrl="/team10stockist/admin/management/supplier/getProduct/"+pIdToAdd;
	
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
								"<td><input type=\"button\" value=\"Delete\" onclick=\"deletePartRow(this)\"></td></tr>");
					}
				})
			}
	}
}

function updateSupplier(){
	//window.alert(document.getElementById("text-sname").value);
	var data = [];
	var tds = $(".td-pid");
	tds.each(function(index, td)
		{
		 	//alert(td.innerHTML);
		 	data.push({
		 		supplierId : document.getElementById("text-sid").value,
		 		supplierName : document.getElementById("text-sname").value,
		 		contact : document.getElementById("text-contact").value,
				partNumber: td.innerHTML,

			});
		}
	);
	
	$.ajax({
		method: 'POST',
		url: '/team10stockist/admin/management/supplier/update',
		data: JSON.stringify(data),
		contentType: 'application/json',
		success: function () {
		    alert('success');
		    window.location.reload(true);
		}
	}); 
}


</script>
