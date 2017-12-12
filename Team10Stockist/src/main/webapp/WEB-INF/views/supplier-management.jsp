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
				<span class="close">&times;</span>
			</div>

			<div id="panel" class="modal-body">
				<c:import url="/WEB-INF/views/editPanel.jsp" />
			</div>
		</div>
	</div>

	<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("edit");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var panel = document.getElementById("panel");

var p = $("#productList");




function AddPartRow(){
	//window.alert("S");
$("#PartTable").append("<tr><td>"<input>"</td>"+
			"<td>"+2+"</td>"+
			"<td>"+3+"</td>"+
			"<td>"+4+"</td>"+
			"<td>"+5+"</td>"+
			"<td><input type=\"button\" value=\"Detail\" onclick=\"location.href='/team10stockist/home/catalogue/product/"+6 +"'\"></td></tr>");
}
// When the user clicks the button, open the modal 
function edit (btn) {
	var sid = btn.name;
	var sname = btn.parentNode.parentNode.getElementsByClassName("td-sname")[0].innerHTML;
	var contact = btn.parentNode.parentNode.getElementsByClassName("td-contact")[0].innerHTML;
	var goToUrl = ("/team10stockist/admin/management/supplier/edit/" + sid);
	//window.alert(sid);
	//var goToUrl = 
	//alert('a');
	$.ajax
	({
		type:"get" , url: goToUrl, 
		success:function(result)
		{
			$("#sname").html("Edit " + sname);
			$("#text-sid").val(sid);
			$("#text-sname").val(sname);
			$("#text-contact").val(contact);
			p.html("");
			var text;
			text = ("<table id=\"PartTable\">"+
					"<tr><th>Part Number</th>"+
					"<th>Name</th>"+
					"<th>Color</th>"+
					"<th>Description</th>"+
					"<th>Dimension</th>"+
					"<th>Detail</th>"+
					"</tr>");
			$.each
			(result, function(productIndex, productDetail)
				{
				
				//window.alert(productDetail.partNumber);
				
				text = text + ("<tr><td>"+productDetail.partNumber+"</td>"+
						"<td>"+productDetail.name+"</td>"+
						"<td>"+productDetail.color+"</td>"+
						"<td>"+productDetail.description+"</td>"+
						"<td>"+productDetail.dimension+"</td>"+
						"<td><input type=\"button\" value=\"Detail\" onclick=\"location.href='/team10stockist/home/catalogue/product/"+productDetail.partNumber +"'\"></td></tr>");
				}
			)
			text = text + ("</table>");
			p.append(text);
			}
	});
	//alert("good");
	modal.style.display = "block";}
	

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
