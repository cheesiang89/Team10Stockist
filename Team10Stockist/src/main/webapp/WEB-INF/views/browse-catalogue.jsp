
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
<form method="POST" action="${pageContext.request.contextPath}/home/catalogue">
	<h3>Product Catalogue</h3>
	
	<div>
	<input type="text" id="searchText" name="search" style="margin-right:30px"/> 
	<input type="submit" id="searchButton" name="search" value="Search"/>
	<div id="cat">
	<span>Color: </span>
		<select id="color" name="color" style="margin-right:30px"> <%--onchange="filt()" --%>
			<option value="">ALL</option>
			<option value="Blue">Blue</option>
			<option value="Red">Red</option>
			<option value="White">White</option>
			<option value="Yellow">Yellow</option>
		</select> 
		<span>Manufacturer: </span>
		<select id="manufacturer" name="manufacturer"> <%--onchange="filt()" --%>
			<option value="">ALL</option>
			<option value="Honda">Honda</option>
			<option value="Mitsubishi">Mitsubishi</option>
			<option value="Nissan">Nissan</option>
			<option value="Toyota">Toyota</option>
			<option value="Subaru">Subaru</option>
		</select>
		</div>
	</div>
</form>
	<c:import url="/WEB-INF/views/ProductsList.jsp" />
</body>
