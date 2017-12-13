<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<c:url value="/css/simple.css" var="ss" />
<link rel="STYLESHEET" type="text/css" href="${ss}" />
<c:url value="/css/SupplierManagement.css" var="smgt" />
<link rel="STYLESHEET" type="text/css" href="${smgt}" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

</head>
<body>
	<div>
		<h1 align="center">
			<spring:message code="title.application" />
		</h1>
		<h2 id="userName">
			<!-- user name from session state -->
			${sessionScope.USERSESSION.user.name}
		</h2>
	</div>

</body>