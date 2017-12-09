
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
<form method="POST" action="${pageContext.request.contextPath}/home/catalogue">
	<h2 style="text-align: center; color: grey">Product Catalogue</h2>
	<div>
		<input type="text" id="searchText" name="search" style="width: 50%; padding-left: 30%" /> 
		<!-- <input type="button" id="searchButton" name="search" value="Search" onclick="filt()" /> -->
	</div>
	<div>
		<select name="color" id="color">
			<option value="">""</option>
			<option value="Blue">Blue</option>
			<option value="Red">Red</option>
			<option value="White">White</option>
			<option value="Yellow">Yellow</option>


		</select> 
		<select name="manufacturer" id="manufacturer">
			<option value="">""</option>
			<option value="Honda">Honda</option>
			<option value="Mitsubishi">Mitsubishi</option>
			<option value="Nissan">Nissan</option>
			<option value="Toyota">Toyota</option>
			<option value="Subaru">Subaru</option>
		</select>
	</div>
	<input type="submit" value="Search" />
</form>
	<c:import url="/WEB-INF/views/ProductsList.jsp" />
</body>
</html>