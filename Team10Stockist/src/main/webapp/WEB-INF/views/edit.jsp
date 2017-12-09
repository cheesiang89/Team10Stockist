<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>Product Edit Page</h3>
<form:form method="POST" modelAttribute="product"
	action="${pageContext.request.contextPath}/admin/product/edit/{partNumber}">
	<table>
		<tbody>
			<tr>
				<td>Part Number</td>
				<td><form:input path="partNumber" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<td><form:input path="name" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Color</td>
				<td><form:input path="color" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:input path="description" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Dimension</td>
				<td><form:input path="dimension" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Shelf Location</td>
				<td><form:input path="shelfLocation" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Unit Price</td>
				<td><form:input path="unitPrice" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td><form:input path="manufacturer" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Min. Inventory Qty</td>
				<td><form:input path="minimumInventoryQuantity" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Stock Qty</td>
				<td><form:input path="stockQuantity" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Min. Reorder Qty</</td>
				<td><form:input path="MinimumReorderQuantity" /></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" value="Update" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

