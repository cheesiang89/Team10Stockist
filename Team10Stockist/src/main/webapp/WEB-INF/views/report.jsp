<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.NumberFormat" %>
<%
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMaximumFractionDigits(2);
    nf.setMinimumFractionDigits(2);
%>
<h3>Reorder Report</h3>
<c:forEach var="s" varStatus="idx" items="${supplierList}">
	<table style="cellspacing: 2; cellpadding: 2; border: 1; width: 100%">
		<tr style="text-align: center; background-color: #45c693">
			<td style="color: #ffffff">Inventory Reorder Report for Supplier
				${s.supplierName}</td>
		</tr>
		<tr style="text-align: center">
			<td>Part No.</td>
			<td>Unit.Price</td>
			<td>Qty</td>
			<td>Reorder Qty</td>
			<td>Min.Ord.Qty</td>
			<td>Ord.Qty</td>
			<td>Price</td>
		</tr>
		<c:forEach var="p" varStatus="idx" items="${s.products}">
			<tr>
				<td>${p.partNumber}</td>
				<td>${p.unitPrice}</td>
				<td>${p.stockQuantity}</td>
				<td>${p.minimumInventoryQuantity}</td>
				<td>${p.minimumReorderQuantity}</td>
				<td><c:if test="${p.stockQuantity<p.minimumInventoryQuantity}">
						<c:choose>
							<c:when
								test="${(p.minimumInventoryQuantity-p.stockQuantity)<p.minimumReorderQuantity}">
						${p.minimumReorderQuantity}
						</c:when>
							<c:otherwise>
						${p.minimumInventoryQuantity-p.stockQuantity}
					</c:otherwise>
						</c:choose>
					</c:if> <c:if test="${p.stockQuantity>=p.minimumInventoryQuantity}">
						0
						</c:if></td>
				<td class="num"><c:if
						test="${p.stockQuantity<p.minimumInventoryQuantity}">
						<c:choose>
							<c:when
								test="${(p.minimumInventoryQuantity-p.stockQuantity)<p.minimumReorderQuantity}">
						<c:set var = "price" value ="${p.minimumReorderQuantity * p.unitPrice}"/>
						<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price}" />
						</c:when>
							<c:otherwise>
						<c:set var = "price" value ="${p.minimumReorderQuantity * p.unitPrice}"/>
						<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${price}" />
						</c:otherwise>
						</c:choose>
					</c:if> <c:if test="${p.stockQuantity>=p.minimumInventoryQuantity}">
						0
						</c:if></td>
			</tr>
		</c:forEach>
	</table>
</c:forEach>
