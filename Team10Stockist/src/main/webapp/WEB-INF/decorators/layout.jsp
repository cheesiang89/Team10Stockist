	<!-- ======== Header ======== -->
<div>
		<%@include file="header.jsp"%>
</div>
	<!-- ======== Body ======== -->
	<table style="width: 100%">
		<tr>
			<td style="width: 180; border: 1" valign="top">
				<div>
					<%@ include file="menu.jsp"%>
				</div>
			</td>
			</tr>
			<tr>
			<td>
				<div>
					<h3>
						<
						<spring:message code="${bodyTitle}" />
					</h3>
					<decorator:body />
				</div>
			</td>
		</tr>
	</table>

	<!-- ======== Footer ======== -->
	<%@include file="footer.jsp"%>

