
	function filt() {
		//window.alert("s");
		const inputs = $(".data")
		const color = $("#color").val();
		const manufacturer = $("#manufacturer").val();
		const searchtext = $("#searchText").val();
		for (let i = 0; i < inputs.length; i++) {
			inputs[i].style.display = "";
		}
		for (let i = 0; i < inputs.length; i++) {
			const c = inputs[i].getElementsByClassName("color")[0].innerHTML;
			const m = inputs[i].getElementsByClassName("manufacturer")[0].innerHTML;
			const n = inputs[i].getElementsByClassName("partNumber")[0].innerHTML;
			if (color != "All" & c != color) {
				inputs[i].style.display = "none";
			} else if (manufacturer != "All" & m != manufacturer) {
				inputs[i].style.display = "none";
			}else if (!n.includes(searchtext)){
				inputs[i].style.display = "none";
			}
		}
	}
	function deleteRow(btn) {
		/*window.alert(window.location.pathname);*/
		//window.alert("s");
		const no =btn.parentNode.parentNode.getElementsByClassName("partNumber")[0].innerHTML;
		const name =btn.parentNode.parentNode.getElementsByClassName("name")[0].innerHTML;
		if (window.confirm("Do you want to delete "+name+"( Part Number: "+no+" )?")) { 
			const deleteurl= "/team10stockist/home/catalogue/delete/"+ no;
			$.ajax({url: deleteurl});
			var row = btn.parentNode.parentNode;
			row.parentNode.removeChild(row);
			
	}
}
