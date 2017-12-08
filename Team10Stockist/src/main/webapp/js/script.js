
	function filt() {
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
		var row = btn.parentNode.parentNode;
		row.parentNode.removeChild(row);

 		var request = XMLHttpRequest();
		var url = "DeleteProductRow?partNumber=" + btn.name;

		var inputs = document.getElementsByTagName("INPUT");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type === 'button') {
				inputs[i].disabled = true;
			}
		}

		request.onreadystatechange = function(){taskFinish(btn);};
		request.open("GET", url, true);
		request.send(); 

	}
