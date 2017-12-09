<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				
<ul>
	
			
					<li><spring:url value="/home/catalogue" var="clist"
							htmlEscape="true" /> <a href="${clist}"> <spring:message
								code="menu.admin.clist" />
					</a></li>
					<li><spring:url value="/admin/reorder" var="rlist"
							htmlEscape="true" /> <a href="${rlist}"> <spring:message
								code="menu.admin.rlist" />
					</a></li>
					<li><spring:url value="/mechanic/usage" var="ulist"
							htmlEscape="true" /> <a href="${ulist}"> <spring:message
								code="menu.mechanic.ulist" />
					</a></li>
					<li><spring:url value="/home" var="logout" htmlEscape="true" />
						<a href="${logout}"> <spring:message code="menu.logout" />
					</a></li>
					
</ul>