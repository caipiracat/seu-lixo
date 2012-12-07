var cont = 0;
function contador() {
	document.getElementById('tempo').innerHTML=cont;
	cont = cont + 25;
	setTimeout("contador()", 1000);
}