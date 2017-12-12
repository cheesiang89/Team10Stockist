<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>New Product Page</h3>
<form:form method="POST" modelAttribute="product"
	action="${pageContext.request.contextPath}/admin/product/add">
	<table align="center">
		<tbody>
			<tr>
				<td>Product Name</td>
				<td><form:input path="name" />
					<form:errors path="name" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Color</td>
				<td><form:input path="color" />
					<form:errors path="color" cssStyle="color: red;" /></td>
				<td></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:input path="description" />
					<form:errors path="description" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Dimension</td>
				<td><form:input path="dimension" /> <form:errors
						path="dimension" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Shelf Location</td>
				<td><form:input path="shelfLocation" />
					<form:errors path="shelfLocation" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Unit Price</td>
				<td><form:input path="unitPrice" />
					<form:errors path="unitPrice" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Manufacturer</td>
				<td><form:input path="manufacturer" />
					<form:errors path="manufacturer" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Min. Inventory Qty</td>
				<td><form:input path="minimumInventoryQuantity" />
					<form:errors path="minimumInventoryQuantity" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Stock Qty</td>
				<td><form:input path="stockQuantity" />
					<form:errors path="stockQuantity" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td>Min. Reorder Qty</</td>
				<td><form:input path="MinimumReorderQuantity" />
					<form:errors path="MinimumReorderQuantity" cssStyle="Color:red;"></form:errors></td>
				<td></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="Create" /></td>
			</tr>
		</tbody>
	</table>
</form:form>