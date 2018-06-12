/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).on("ready", function(){
    $("#dataForm").on("submit", function(){
    
     
        
        var products = {
            code: $("#code").val(),
            name: $("#name").val(),
            description: $("#description").val(),
            stock: $("#stock").val()
        }
        
        $("#products").val(JSON.stringify(products));

        alert("Se insertaron los datos");

        /*
        var products = $("#dataForm").serialize();
        
		*/
		 
 
    });
});
