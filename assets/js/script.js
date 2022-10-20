$('#tablaProductos').DataTable({
	"language": {
            "sProcessing":     "Procesando...",
			"sLengthMenu":     "Mostrar _MENU_ registros",
			"sZeroRecords":    "No se encontraron resultados",
			"sEmptyTable":     "Ningún dato disponible en esta tabla",
			"sInfo":           "registros del _START_ al _END_ de un total de _TOTAL_ registros",
			"sInfoEmpty":      "registros del 0 al 0 de un total de 0 registros",
			"sInfoFiltered":   "(total de _MAX_ registros)",
			"sInfoPostFix":    "",
			"sSearch":         "Buscar:",
			"sUrl":            "",
			"sInfoThousands":  ",",
			"sLoadingRecords": "Cargando...",
			"oPaginate": {
				"sFirst":    "Primero",
				"sLast":     "Último",
				"sNext":     "Siguiente",
				"sPrevious": "Anterior"
			},
			"oAria": {
				"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
				"sSortDescending": ": Activar para ordenar la columna de manera descendente"
			}
        }
});

function soloMayusculas(campo_id) 
{
	var cadena = document.getElementById(campo_id).value;
	var cadena2 = cadena.toUpperCase();
	document.getElementById(campo_id).value = cadena2;
}

function soloMayusculasN(campo_id) 
{
	var cadena = document.getElementsByName(campo_id);
	var cadena2 = cadena[0].value.toUpperCase();
	document.getElementsByName(campo_id)[0].value= cadena2;
}

function SoloNumeros(evt) // solo permite insertar NUMEROS,EL PUNTO, ENTER, ESPACIO
{
	var nav4 = window.Event ? true : false;
	// NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57, '.' = 46
	var key = nav4 ? evt.which : evt.keyCode;
	return (key <= 13 || (key >= 48 && key <= 57));
}

function SoloLetras(evt){
       key = evt.keyCode || evt.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = "8-37-39-46";
       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }
        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }

function ImprimirVentas(fechaInicial,fechaFinal)
{
    var fechaI=fechaInicial;
    var fechaF=fechaFinal;
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	//objAjax1.open("POST","Controller/ventasController/ventasController.php?accion=imprimir");
	objAjax1.open("POST","Controller/ventasController/ventasController.php?accion=imprimir&fechaInicial="+fechaI+"&fechaFinal="+fechaF);
	objAjax1.responseType = 'arraybuffer';
	//var respuesta=objAjax1.responseText;
	//console.log(respuesta);
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		console.log(fechaInicial);
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirVentasC(fechaInicial,fechaFinal)
{
    var fechaI=fechaInicial;
    var fechaF=fechaFinal;
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	//objAjax1.open("POST","Controller/ventasController/ventasController.php?accion=imprimir");
	objAjax1.open("POST","Controller/ventasController/ventasController.php?accion=imprimirC&fechaInicial="+fechaI+"&fechaFinal="+fechaF);
	objAjax1.responseType = 'arraybuffer';
	//var respuesta=objAjax1.responseText;
	//console.log(respuesta);
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		console.log(fechaInicial);
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirVentasCC(fechaInicial,fechaFinal)
{
    var fechaI=fechaInicial;
    var fechaF=fechaFinal;
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	//objAjax1.open("POST","Controller/ventasController/ventasController.php?accion=imprimir");
	objAjax1.open("POST","Controller/ventasController/ventasController.php?accion=imprimirCC&fechaInicial="+fechaI+"&fechaFinal="+fechaF);
	objAjax1.responseType = 'arraybuffer';
	//var respuesta=objAjax1.responseText;
	//console.log(respuesta);
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		console.log(fechaInicial);
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirUsuarios()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	//objAjax1.open("POST","Controller/ventasController/ventasController.php?accion=imprimir");
	objAjax1.open("POST","Controller/usuariosController/reportUsuariosController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	//var respuesta=objAjax1.responseText;
	//console.log(respuesta);
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirHistoricoUsuarios()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax1.open("POST","Controller/usuariosController/historicoUsuariosController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirProductos()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax1.open("POST","Controller/productosController/reportProductosController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirHistoricoProductos()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax1.open("POST","Controller/productosController/historicoProductosController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirOrdenes()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax1.open("POST","Controller/ordenesController/reportOrdenesController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function ImprimirReservas()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax1.open("POST","Controller/reservasController/reportReservasController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}

function Backup()
{
	var objAjax=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax.open("POST","Controller/backupController/backupController.php?accion=backup");
	//objAjax.responseType = 'arraybuffer';
	objAjax.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax.readyState==4 && objAjax.status==200)
		{
			var respuesta=objAjax.responseText;
			console.log(respuesta);
			if (respuesta=='OK')
			{
				alert("Backup realizado exitosamente");
			}
			else
			{
				alert("Error, comunicarse con Soporte");
			}
		}	
	}
	objAjax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax.send(null);
}

function ImprimirEmpleados()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax1.open("POST","Controller/empleadosController/reportEmpleadosController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}


function ImprimirHistoricoEmpleados()
{
	var objAjax1=new XMLHttpRequest(); //Creo el objeto Ajax
	objAjax1.open("POST","Controller/empleadosController/historicoEmpleadosController.php?accion=imprimir");
	objAjax1.responseType = 'arraybuffer';
	objAjax1.onreadystatechange=function() //Aquí espera la respuesta
	{
		if (objAjax1.readyState==4 && objAjax1.status==200)
		{
			var filename = "";
	        var disposition = objAjax1.getResponseHeader('Content-Disposition');
	        if (disposition && disposition.indexOf('attachment') !== -1) {
	            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
	            var matches = filenameRegex.exec(disposition);
	            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
	        }
	        var type = objAjax1.getResponseHeader('Content-Type');

	        var blob;
	        if (typeof File === 'function') {
	            try {
	                blob = new File([this.response], filename, { type: type });
	            } catch (e) { /* Edge */ }
	        }
	        if (typeof blob === 'undefined') {
	            blob = new Blob([this.response], { type: type });
	        }

	        if (typeof window.navigator.msSaveBlob !== 'undefined') {
	            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
	            window.navigator.msSaveBlob(blob, filename);
	        } else {
	            var URL = window.URL || window.webkitURL;
	            var downloadUrl = URL.createObjectURL(blob);

	            if (filename) {
	                // use HTML5 a[download] attribute to specify filename
	                var a = document.createElement("a");
	                // safari doesn't support this yet
	                if (typeof a.download === 'undefined') {
	                    window.location.href = downloadUrl;
	                } else {
	                    a.href = downloadUrl;
	                    a.download = filename;
	                    document.body.appendChild(a);
	                    a.click();
	                }
	            } else {
	                window.location.href = downloadUrl;
	            }

	            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
	        }		
		}	
	}
	objAjax1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	objAjax1.send(null);
}
