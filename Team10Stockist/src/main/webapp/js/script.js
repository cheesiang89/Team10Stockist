
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
			if (color != "all" & c != color) {
				inputs[i].style.display = "none";
			} else if (manufacturer != "all" & m != manufacturer) {
				inputs[i].style.display = "none";
			}else if (!n.includes(searchtext)){
				inputs[i].style.display = "none";
			}
		}
	}
	function filtALL() {
		for (var i = 1; i < inputs.length; i++) {
			inputs[i].style.display = "";
		}
	}
