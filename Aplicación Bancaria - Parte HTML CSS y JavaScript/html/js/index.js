/*
 href="js/index.js" onclick="login()"  
 
function login(userName, password) {
	var http = new XMLHttpRequest();
	var url = "localhost";
	http.open("POST", url, true);
	http.setRequestHader("Content-Type", "aplication/json;charset=UTF-8");
	
	http.onreadystatechange = function() {
		if (http.readyState == 4 && http.status == 200) {
			alert(JSON.stringify(http.responseText));
		}
	};
	
	http.send(JSON.stringify({userName:userName, password:password}));	
};
*/

// Mostrar contraseña

function showPassword() {
    var password = document.getElementById("password");
    if (password.type === "password") {
        password.type = "text";
    } else {
        password.type = "password";
    }
};

