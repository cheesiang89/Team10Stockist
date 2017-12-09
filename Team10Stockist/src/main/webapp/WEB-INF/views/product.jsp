<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>Product Page</h3>
<form:form method="POST" modelAttribute="product"
	action="${pageContext.request.contextPath}/home/catalog/product/{partNumber}">
	<table>
		<tbody>
			<tr>
				<td>Part Number</td>
				<td><form:input path="partNumber" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<td><form:input path="name" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Color</td>
				<td><form:input path="color" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:input path="description" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Dimension</td>
				<td><form:input path="dimension" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Shelf Location</td>
				<td><form:input path="shelfLocation" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Unit Price</td>
				<td><form:input path="unitPrice" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td><form:input path="manufacturer" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Min. Inventory Qty</td>
				<td><form:input path="minimumInventoryQuantity" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Stock Qty</td>
				<td><form:input path="stockQuantity" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Min. Reorder Qty</</td>
				<td><form:input path="MinimumReorderQuantity" readonly="true" /></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="submit" value="Back to Catalog" /></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
</form:form>

