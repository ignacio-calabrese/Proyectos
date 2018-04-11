

$(document).on("ready", function() {
	//Mètodo jQuery ajax
/*
	var petition = $("#login").attr("action");
	var method = $("#login").attr("method");
	$("#login").on("submit", function(){
		$.ajax({
			beforeSend: function() {
				alert("Cargando");
				//$(Selector).spin({radius:N°, width:N°, height:N°, length:N°});
			},
			url: petition,
			type: method,
			data: $("#login").serialize(),
			success: function(response) {
				console.log(response)
			},
			error: function(jqXHR, status, error) {
				console.log(status);
				console.log(error);
			},
			complete: function(jqXHR, status) {
				console.log(status);
			},
			timeout:10000; 
		}); 
	});
	*/
	//Peticiones con el método GET
		
		$.get("index.html", function(data) {
			$("#json").html(data);
		});
		



	//Peticiones con el método POST

	/*
	var petición = $("#login").attr("action");
	var information = $("#login").serialize();
	$.post("index.html", petición, information, function(response, status, jqXHR) {
		console.log(response);
		console.log(status);
		console.log(jqXHR);
	});

	*/
});
