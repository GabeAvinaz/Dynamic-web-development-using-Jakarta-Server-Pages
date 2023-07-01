/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *JS to show and hide each form
 * also checks that end date occurs after start to fit DB constraint
 * also changes input for amount depending on type choice
 */
function hideForms(){
	document.getElementById('userForm').setAttribute('style', 'display:none');
	document.getElementById('couponForm').setAttribute('style', 'display:none');
	document.getElementById('storeForm').setAttribute('style', 'display:none');
	document.getElementById('percentInput').setAttribute('style', 'display:none');
}

function showUser() {
	document.getElementById('userForm').setAttribute('style', 'display:block; background-color: lightgrey; width: 600px; margin: auto; padding: 20px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19),  0 6px 6px rgba(0,0,0,0.23);');
	document.getElementById('couponForm').setAttribute('style', 'display:none');
	document.getElementById('storeForm').setAttribute('style', 'display:none');
}

function showStore() {
	document.getElementById('userForm').setAttribute('style', 'display:none');
	document.getElementById('couponForm').setAttribute('style', 'display:none');
	document.getElementById('storeForm').setAttribute('style', 'display:block; background-color: lightgrey; width: 600px; margin: auto; padding: 20px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19),  0 6px 6px rgba(0,0,0,0.23);');
}

function showCoupon() {
	document.getElementById('userForm').setAttribute('style', 'display:none');
	document.getElementById('couponForm').setAttribute('style', 'display:block; background-color: lightgrey; width: 600px; margin: auto; padding: 20px; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19),  0 6px 6px rgba(0,0,0,0.23);');
	document.getElementById('storeForm').setAttribute('style', 'display:none');
}

function checkDate() {
    var d1 = new Date(document.getElementById("sDate").value);
    var d2 = new Date(document.getElementById("eDate").value);
    if (d2 <= d1) {
    	alert(d1)
    	alert(d2)
        alert("End Date needs to occur after Start Date");
        document.getElementById("eDate").valueAsDate = null;
    }
}

function checkAmt(selection) {
	if (selection.value == "FLATRATE"){
		document.getElementById('amtInput').setAttribute('style', 'display:block');
		document.getElementById('flatInput').setAttribute('style', 'display:block');
		document.getElementById('percentInput').setAttribute('style', 'display:none');
	}else if(selection.value == "PERCENT"){
		document.getElementById('amtInput').setAttribute('style', 'display:block');
		document.getElementById('flatInput').setAttribute('style', 'display:none');
		document.getElementById('percentInput').setAttribute('style', 'display:block');
	}else{
		document.getElementById('amtInput').setAttribute('style', 'display:none');
		//document.getElementById('percentInput').setAttribute('style', 'display:none');
	}
}

