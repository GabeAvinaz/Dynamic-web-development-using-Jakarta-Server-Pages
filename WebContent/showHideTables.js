/*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *JS to show and hide each table
 */
function hideTables(){
	document.getElementById('users').setAttribute('style', 'display:none');
	document.getElementById('coupons').setAttribute('style', 'display:none');
	document.getElementById('stores').setAttribute('style', 'display:none');
}

function showUsers() {
	document.getElementById('users').setAttribute('style', 'display:block');
	document.getElementById('coupons').setAttribute('style', 'display:none');
	document.getElementById('stores').setAttribute('style', 'display:none');
}

function showStores() {
	document.getElementById('users').setAttribute('style', 'display:none');
	document.getElementById('coupons').setAttribute('style', 'display:none');
	document.getElementById('stores').setAttribute('style', 'display:block');
}

function showCoupons() {
	document.getElementById('users').setAttribute('style', 'display:none');
	document.getElementById('coupons').setAttribute('style', 'display:block;');
	document.getElementById('stores').setAttribute('style', 'display:none');
}