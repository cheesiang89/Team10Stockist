<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html>
<spring:url value="/css/simple.css" var="style" />
<link rel="STYLESHEET" type="text/css" href="${style}" />
<form:form modelAttribute="user" method="POST"
	action="${pageContext.request.contextPath}/home">

	<h3>Login</h3>
	<table class="framed" align="center">
		<tr>
			<td><spring:message code="fieldLabel.name" /></td>
			<td><form:input path="name" /></td>

		</tr>
		<tr>
			<td><spring:message code="fieldLabel.password" /></td>
			<td><form:password path="password" /></td>

		</tr>
		<tr>
			<td colspan="2" align="center"><div style="color: red">${error}</div></td>
			<td></td>
		</tr>
			<td><form:button name="submit" type="submit" value="s">
					<img
						src="${pageContext.request.contextPath}/image/button_login.gif"
						alt="">
				</form:button></td>
			<td align="right"><form:button name="cancel" type="reset" value="r">
					<img
						src="${pageContext.request.contextPath}/image/button_clear.gif"
						alt="">
				</form:button></td>

		</tr>
	</table>
</form:form>