	<%-- ======== Header ======== --%>
<div>
		<%@include file="header.jsp"%>
</div>
	<%-- ======== Body ======== --%>
	<table style="width: 100%">
		<tr>
			<td style="width: 180; border: 1" valign="top">
				<div>
					<%@ include file="menu.jsp"%>
				</div>
			</td>
			<td>
				<div>
					<decorator:body />
				</div>
			</td>
		</tr>
	</table>

	<%-- ======== Footer ======== --%>
	<%@include file="footer.jsp"%>

