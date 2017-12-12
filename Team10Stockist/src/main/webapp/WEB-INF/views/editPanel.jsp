<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="editdiv">

<span class="edititem">Supplier ID: </span>
<br>
<input style="text" id="text-sid" placeHolder="Supplier ID" value=""/>
<br>
<span class="edititem">Supplier Name: </span>
<br>
<input style="text" id="text-sname" placeHolder="Supplier Name" value=""/>
<br>
<span class="edititem">Contact Number: </span>
<br>
<input style="text" id="text-contact" placeHolder="Contact Name" value=""/>
<br>
</div>
<div class="editdiv">
<span class="edititem">Supply: </span>
<div id="productList"></div>
<input type="button" value="Add" onclick="AddPartRow()"/>
<br>

</div>