<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sa45.Team10Stockist.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>




	<div>
		<c:import url="/WEB-INF/views/supplierList.jsp" />
	</div>


	<div id="myModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span id="sname" style="font-size:20px; align:center"></span>
				<span class="close" onclick="closePanel()">&times;</span>
			</div>

			<div id="panel" class="modal-body">
				<%-- <c:import url="/WEB-INF/views/editPanel.jsp" /> --%>
			</div>
		</div>
	</div>

	<script>

var modal = document.getElementById("myModal");

var btn = document.getElementById("edit");

var span = document.getElementsByClassName("close")[0];

var panel = document.getElementById("panel");

var p = $("#productList");




function showPanel(btn){
	var sid = btn.parentNode.parentNode.getElementsByClassName("td-sid")[0].innerHTML;
	var sname = btn.parentNode.parentNode.getElementsByClassName("td-sname")[0].innerHTML;
	var contact = btn.parentNode.parentNode.getElementsByClassName("td-contact")[0].innerHTML;
	var goToUrl = ("/team10stockist/admin/management/supplier/edit/" + sid);
	$("#panel").html("");
	$("#sname").html("Edit " + sname);
	$("#panel").html(
		"<div class=\"editdiv\">"+
		"<table>"+
		"<tr>"+
		"<td><span class=\"edititem\">Supplier ID: </span></td>"+
		"<td><input style=\"text\" id=\"text-sid\" placeHolder=\"Supplier ID\" class=\"edittext\" value=\""+sid+"\"/></td>"+
		"</tr>"+
		"<tr>"+
		"<td><span class=\"edititem\">Supplier Name: </span></td>"+
		"<td><input style=\"text\" id=\"text-sname\" placeHolder=\"Supplier Name\" class=\"edittext\" value=\""+sname+"\"/></td>"+
		"</tr>"+
		"<tr>"+
		"<td><span class=\"edititem\">Contact Number: </span></td>"+
		"<td><input style=\"text\" id=\"text-contact\" placeHolder=\"Contact Name\" class=\"edittext\" value=\""+contact+"\"/></td>"+
		"</tr>"+
		"<tr>"+
		"<td>"+
		"<span class=\"edititem\">Supply: </span>"+
		"</td>"+
		"</tr>"+
		"</table>"+
		"</div>"
	);
	$.ajax
	({
		type:"get" , url: goToUrl, 
		success:function(result)
		{
			var text;
			text = ("<table id=\"PartTable\">"+
					"<tr><th>Part Number</th>"+
					"<th>Name</th>"+
					"<th>Color</th>"+
					"<th>Description</th>"+
					"<th>Dimension</th>"+
					"<th>Detail</th>"+
					"<th class=\"deletePartRowCol\">Delete</th>"+
					"</tr>");
			$.each
			(result, function(productIndex, productDetail)
				{
				
				text = text + ("<tr><td class=\"td-pid\">"+productDetail.partNumber+"</td>"+
						"<td class=\"td-pname\">"+productDetail.name+"</td>"+
						"<td>"+productDetail.color+"</td>"+
						"<td>"+productDetail.description+"</td>"+
						"<td>"+productDetail.dimension+"</td>"+
						"<td><input type=\"button\" value=\"Detail\" onclick=\"location.href='/team10stockist/home/catalogue/product/"+productDetail.partNumber +"'\"></td>"+
						"<td><input type=\"button\" value=\"Delete\" class=\"deletePartRowCol\" onclick=\"deletePartRow(this)\"></td></tr>");
				}
			)
			text = text + ("</table>");
			$("#panel").append(text);
			}
	});
	modal.style.display = "block";
}


function deleteSupplierRow(btn){
	const no =btn.parentNode.parentNode.getElementsByClassName("td-sid")[0].innerHTML;
	const name =btn.parentNode.parentNode.getElementsByClassName("td-sname")[0].innerHTML;
	if (window.confirm("Do you want to delete "+name+"( Supplier ID: "+no+" )?")) { 
		/* const deleteurl= "/team10stockist/home/catalogue/delete/"+ no;
		$.ajax({url: deleteurl}); */
		var row = btn.parentNode.parentNode;
		row.parentNode.removeChild(row);
		
	}
}

function deletePartRow(btn){
	const no =btn.parentNode.parentNode.getElementsByClassName("td-pid")[0].innerHTML;
	const name =btn.parentNode.parentNode.getElementsByClassName("td-pname")[0].innerHTML;
	if (window.confirm("Do you want to delete "+name+"( Part Number: "+no+" )?")) {
		var row = btn.parentNode.parentNode;
		row.parentNode.removeChild(row);
		
	}
}

function closePanel(){
	modal.style.display = "none";
}


window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
