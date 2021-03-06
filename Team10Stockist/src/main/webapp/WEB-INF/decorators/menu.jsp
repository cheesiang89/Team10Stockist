<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	

<c:url value="/logout" var="logout" />
<ul>
	<c:if test="${!empty sessionScope.USERSESSION}">
		<c:choose>
			<c:when test="${sessionScope.USERSESSION.user.role eq 'admin' }">

				<li><spring:url value="/home/catalogue" var="clist"
						htmlEscape="true" /> <a href="${clist}"> <spring:message
							code="menu.clist" />
				</a></li>
				<li><spring:url value="/admin/product/add" var="alist"
						htmlEscape="true" /> <a href="${alist}"> <spring:message
							code="menu.admin.alist" />
				</a></li>
				<li><spring:url value="/admin/report" var="rlist"
						htmlEscape="true" /> <a href="${rlist}"> <spring:message
							code="menu.admin.rlist" />
				</a></li>
				<li><spring:url value="/admin/manage/supplier" var="mlist"
						htmlEscape="true" /> <a href="${mlist}"> <spring:message
							code="menu.admin.mlist" />
				</a></li>
				<li><spring:url value="/home/logout" var="logout"
						htmlEscape="true" /> <a href="${logout}"> <spring:message
							code="menu.logout" />
				</a></li>
				
			</c:when>
			<c:when test="${sessionScope.USERSESSION.user.role eq 'mechanic' }">
				<li><spring:url value="/home/catalogue" var="clist"
						htmlEscape="true" /> <a href="${clist}"> <spring:message
							code="menu.clist" />
				</a></li>
				<li><spring:url value="/mechanic/usage" var="ulist"
						htmlEscape="true" /> <a href="${ulist}"> <spring:message
							code="menu.mechanic.ulist" />
				</a></li>
				<li><spring:url value="/home/logout" var="logout"
						htmlEscape="true" /> <a href="${logout}"> <spring:message
							code="menu.logout" />
				</a></li>
			</c:when>
		</c:choose>
	</c:if>

</ul>