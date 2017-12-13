<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sa45.Team10Stockist.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<body>


<div>
		<span>Part: </span>
		
		<select id="partSelect" name="Part" onchange="filt(this.value)">
				<option value="">All</option>
			<c:forEach var="p" varStatus="idx" items="${plist}">
				<option value="( ${p.partNumber} )">${p.name} ( ${p.partNumber} )</option>
			</c:forEach>
		</select>
		
		
		<span>Contact Number: </span>
		<input type="text" id="searchText" name="search"/> 
			
	<input type="button" id="searchButton" name="search" value="Search" style="margin-right:30px" onclick="search()"/>
	
</div>

<div>
	<c:import url="/WEB-INF/views/supplierList.jsp" />
</div>
<div>
	<input type="button" value="Add Supplier" onclick="addSupplier()"/>
</div>

<div id="myModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			<span id="sname" style="font-size:20px; align:center"></span>
			<span class="close" onclick="closePanel()">&times;</span>
		</div>

		<div id="panel" class="modal-body">
			<c:import url="/WEB-INF/views/editPanel.jsp" ></c:import>
		</div>
	</div>
</div>

<script>

var modal = document.getElementById("myModal");

var btn = document.getElementById("edit");

var span = document.getElementsByClassName("close")[0];

var panel = document.getElementById("panel");

var p = $("#productList");

function search(){
	const numberText = document.getElementById("searchText").value;
	//window.alert(numberText);
	const rows = $(".td-row");
	for (let i = 0; i < rows.length; i++) {
		rows[i].style.display = "";
	}
	document.getElementById("partSelect").selectedIndex=0;
	
	for (let i = 0; i < rows.length; i++) {
		const content = rows[i].getElementsByClassName("td-contact")[0].innerHTML;
		//window.alert(content);
		if (!content.includes(numberText)){
			rows[i].style.display="none";
		}
	};
}


function filt(filter) {
	const rows = $(".td-row")
	for (let i = 0; i < rows.length; i++) {
		rows[i].style.display = "";
	}
	for (let i = 0; i < rows.length; i++) {
		const content = rows[i].getElementsByClassName("td-part")[0].innerHTML;
		if (!content.includes(filter)){
			rows[i].style.display="none";
		}
	};
	
	/* const rows = $(".td-row")
	$(".td-row").css("display", "");
	$(".td-row").each(
		function(){
			const content = this.getElementsByClassName("td-part")[0].innerHTML;
			if (!content.includes(filter)){
				this.css("display", "none");
			}
		}			
	)*/
}


function addSupplier(){
	$("#sname").html("Adding New Supplier ");
	$("#text-sid").prop("readonly", false);
	$("#text-sid").val("");
	$("#text-sname").val("");
	$("#text-contact").val("");
	p.html("");
	var text;
	text = ("<table id=\"PartTable\">"+
			"<tr><th>Part Number</th>"+
			"<th>Name</th>"+
			"<th>Color</th>"+
			"<th>Description</th>"+
			"<th>Dimension</th>"+
			"<th>Detail</th>"+
			"<th>Delete</th>"+
			"</tr>");
	text = text + ("</table>");
	p.append(text);
	$("#updateButton").css("display", "none");
	$("#addButton").css("display", "inline");
	modal.style.display = "block";
}

/* function showPanel(btn){
	var sid = btn.parentNode.parentNode.getElementsByClassName("td-sid")[0].innerHTML;
	var sname = btn.parentNode.parentNode.getElementsByClassName("td-sname")[0].innerHTML;
	var contact = btn.parentNode.parentNode.getElementsByClassName("td-contact")[0].innerHTML;
	var goToUrl = ("/team10stockist/admin/management/supplier/edit/" + sid);
	var selectOption =

	<c:forEach var="p" varStatus="idx" items="${plist}">
	"<option value=\"( ${p.partNumber} )\">${p.name} ( ${p.partNumber} )</option>"+
	</c:forEach>

	
	$("#panel").html("");
	$("#sname").html("Supplier " + sname);
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
		"<td><span class=\"edititem\">Supply: </span></td>"+
		"<td>"+
		"<select id=\"addPartNumber\">"+
		"<option value="">All</option>"+
		selectOption+
		"</select>"+
		"<input type=\"button\" value=\"Add Part\">"+
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
} */

function showPanel (btn) {
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
			$("#sname").html("Supplier " + sname);
			$("#text-sid").prop("readonly", true);
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
					"<th>Delete</th>"+
					"</tr>");
			$.each
			(result, function(productIndex, productDetail)
				{
				
				//window.alert(productDetail.partNumber);
				
				text = text + ("<tr><td class=\"td-pid\">"+productDetail.partNumber+"</td>"+
						"<td class=\"td-pname\">"+productDetail.name+"</td>"+
						"<td>"+productDetail.color+"</td>"+
						"<td>"+productDetail.description+"</td>"+
						"<td>"+productDetail.dimension+"</td>"+
						"<td><input type=\"button\" value=\"Detail\" onclick=\"location.href='/team10stockist/home/catalogue/product/"+productDetail.partNumber +"'\"></td>"+
						"<td><input type=\"button\" value=\"Delete\" onclick=\"deletePartRow(this)\"></td></tr>");
				}
			)
			text = text + ("</table>");
			p.append(text);
			}
	});
	$("#updateButton").css("display", "inline");
	$("#addButton").css("display", "none");
	modal.style.display = "block";
}

function deleteSupplierRow(btn){
	const no =btn.parentNode.parentNode.getElementsByClassName("td-sid")[0].innerHTML;
	const name =btn.parentNode.parentNode.getElementsByClassName("td-sname")[0].innerHTML;
	if (window.confirm("Do you want to delete "+name+"( Supplier ID: "+no+" )?")) { 
		const deleteurl= "/team10stockist/admin/management/supplier/delete/"+ no;
		$.ajax({url: deleteurl});
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
