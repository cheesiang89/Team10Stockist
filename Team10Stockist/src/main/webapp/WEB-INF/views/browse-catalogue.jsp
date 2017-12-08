
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<h2 style="text-align: center; color: grey">Product Catalogue</h2>
	<div>
		<input type="text" id="searchText" name="search" style="width: 50%; padding-left: 30%" /> 
		<input type="button" id="searchButton" name="search" value="Search" onclick="filt()" />
	</div>
	<div>
		<select id="color" onchange="filt()">
			<option value="all">ALL</option>
			<option value="c1">c1</option>
			<option value="c2">c2</option>
			<option value="c3">c3</option>
			<option value="c4">c4</option>
		</select> 
		<select id="manufacturer" onchange="filt()">
			<option value="all">ALL</option>
			<option value="m1">m1</option>
			<option value="m2">m2</option>
			<option value="m3">m3</option>
			<option value="m4">m4</option>
		</select>
	</div>

	<c:import url="/WEB-INF/views/ProductsList.jsp" />
</body>
</html>