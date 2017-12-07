<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<c:url value="/css/simple.css" var="ss" />
<link rel="STYLESHEET" type="text/css" href="${ss}" />
</head>
<body>
	<div>
		<%@include file="Header.jsp"%>
	</div>

	<table style="width: 100%">
		<tr>
			<td style="width: 180; border: 1" valign="top">
				<div>
					<%@ include file="Menu.jsp"%>
				</div>
			</td>
			<td>
				<div>
					<h3>
						<spring:message code="${bodyTitle}" />
					</h3>
					<decorator:body />
				</div>
			</td>
		</tr>
	</table>

	<!-- ======== Footer ======== -->
	<div id="footer" align="center">
		<hr>
		<small> &copy; ISS NUS SA45 Team 10 </small>
	</div>
</body>
</html>
