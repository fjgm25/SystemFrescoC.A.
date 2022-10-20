<div class="container">
	<div class="row">
		<div class="col-lg-4">
			<br>
			<div class="mesas">
				<h3>Seleccionar Una Mesa</h3>
				<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">

					<?php
					require 'Views/modules/ventas/conexion.php';
					ob_start();
					$usuariologueado = $_SESSION['nombreusuario'];
					$consulta = "select * from mesas WHERE estado=1 order by codmesa asc";
					$ejecutar_consulta = $conexion->query($consulta);
					$columna = 0;
					foreach ($ejecutar_consulta as $key) :
						$columna = $columna + 1;
						echo '<button style="text-decoration: none; padding: 10px; font-weight: 600; font-size: 15px; color: #ffffff; background-color: #1883ba; border-radius: 6px; text-transform: uppercase; margin: 5px; width:90px;" type="button" onclick="miFunction(this)" class="btn_save" id="' . $key['codmesa'] . '" name="' . $key['codmesa'] . '" value="' . $key['mesa'] . '">' . $key['mesa'] . '</button>';
						if ($columna == 3) {
							echo '<br>';
							$columna = 0;
						}
					endforeach



					?>
					<br>
					
					<div class="row">
						<div class="col-md-3">
							<a href="http://gastronomiadelestadotachira.blogspot.com/" class="btn btn-success" target="_blank">Muestra de Platillos</a>
							<span id="usuariologueado" style="display: none"><?php echo $usuariologueado; ?></span>
						</div>
					</div>
				</div>
			</div>
			<br><br>
		</div>
		<div class="col-lg-8">

			<br><img id="imagen" name="imagen" src="assets/img/foto1.jpg" width="700" height="348">

			<div id="detallemesa" name="detallemesa" style="display: none;" class="container" style="overflow: auto; width: 720px; height: 400px;">
				<center>
					<h1><i class="fa fa-table" aria-hidden="true"> </i><label id="nombremesa" name="nombremesa"></label></h1>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bebidas" data-whatever="@mdo"><i class="fa fa-plus-square"> </i> ADICIONAR PEDIDOS </button>
				</center>

				<?php require 'Views/modal/modal_agregar_productos.php'; ?>
				<label>Atendido por:</label>
				<select id="atendidopor">
					<?php
					$consulta = "select E.ID_empleado, E.nombres, E.apellidos, C.descripcion from empleado E, cargos C where E.estado=1 and C.estado=1 and E.cargo=C.idcargo";
					$ejecutar_consulta = $conexion->query($consulta);
					foreach ($ejecutar_consulta as $key) :
						echo '<option value="' . $key['ID_empleado'] . '">' . $key['nombres'] . ' ' . $key['apellidos'] . '-' . $key['descripcion'] . '</option>';
					endforeach
					?>
				</select>
				<br><br><br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID PROD</th>
							<th>NOMBRE PRODUCTO</th>
							<th>PRECIO UNI.</th>
							<th>CANT</th>
							<th>TOTAL</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="tablapedidos">


					</tbody>
					<tfoot>
						<tr>
							<td scope="row"><i class="fa fa-usd fa-spin fa-2x"></i></td>
							<td>TOTAL</td>
							<td></td>
							<td></td>
							<td id="total" name="total"><i class="fa fa-usd"></i></td>
						</tr>
					</tfoot>
				</table>
				<span id="codmesa" style="display: none"></span>
				<button type="button" class="btn btn-danger" onclick="facturar()">$ Finalizar Venta</button>

			</div>

			<script type="text/javascript">
				function miFunction(comp) {
					let id = comp.id;
					let nombre = ' ' + comp.value;
					$('#codmesa').html(id);
					$('#imagen').fadeOut();
					$('#detallemesa').fadeIn();
					$('#nombremesa').html(nombre);
					$('#tablapedidos').html('');
					$('#total').html('<i class="fa fa-usd"></i>&nbsp;<b><span></span></b>');
					var acum = 0;


					$.ajax({
						type: 'POST',
						url: 'Views/modules/ventas/ventasMesas.php',
						data: {
							action: 'VerMesa',
							codmesa: id
						},
						success: function(data) {
							if (data.trim() != "") {
								//alert(data);  
								//console.log(data); 
								$('#tablapedidos').html(data);
								$('#tablapedidos tr').each(function() {
									var campo = $(this).find('td').eq(4).html();
									acum = acum + parseFloat(campo);
								});

								$('#total').html('<i class="fa fa-usd"></i>&nbsp;<b><span>' + acum + '</span></b>');


							} else {
								//alert("La data recibida está vacia");
							}

						},
						error: function() {
							alert("No se ha podido obtener la información");
						}
					});


				}

				//----------  Para recibir todo lo que la modal de agregar productos me envía

				$('#productospedidos').bind('submit', function() {

					var acumnew = 0;
					var acumold = 0;
					var acumact = 0;
					var cuerpotablanew = '';
					var cuerpotablaold = '';
					var cuerpotablaact = '';
					var myTableArray = [];
					var arrayEnviar = [];

					$('#tablapedidos tr').each(function() {
						var valor = $(this).find('td').eq(4).html();
						acumold = acumold + parseFloat(valor);
					});


					// saber cuales select de la modal están llenos

					$('#productospedidos select').each(function() {

						var valor = $(this).val();

						if (valor.trim() != '' && valor.trim() != '0') {
							//i++; // cantidad de filas para la tabla
							var arrayvalor = valor.split('-');

							cuerpotablanew = "<tr id='row" + arrayvalor[0] + "'><td>" + arrayvalor[0] + "</td>" +
								"<td>" + arrayvalor[1] + "</td>" +
								"<td id='preuni" + arrayvalor[0] + "' style='width:10px'>" + arrayvalor[2] + "</td>" +
								"<td><input class='form-control form-control-sm' id='" + arrayvalor[0] + "' style='width:80px' type='text' value='1' onchange='totalizar(" + arrayvalor[0] + ")' /></td>" +
								"<td id='totaluni" + arrayvalor[0] + "'>" + arrayvalor[2] + "</td><td><button onclick='eliminarProducto(" + arrayvalor[0] + ")' type='button'><i class='fa fa-trash-o btn btn-danger btn-sm'></i></button></td></tr>";


							var bandera = 0;
							$('#tablapedidos tr').each(function() {
								var campo = $(this).find('td').eq(0).html();
								if (campo == arrayvalor[0]) {
									bandera = 1;
								}
							});

							if (bandera == 0) {
								acumnew = acumnew + parseFloat(arrayvalor[2]);

								$('#tablapedidos').append(cuerpotablanew);
							} else {
								alert('El producto ya ha sido cargado, edite su cantidad!');
							}
						}

					});


					acumact = acumold + acumnew;


					// $('#tablapedidos').html(cuerpotablaact);
					$('#total').html('<i class="fa fa-usd"></i>&nbsp;<b><span>' + acumact + '</span></b>');

					// montar el contenido de la tabla en un arreglo para pasarlo por ajax a ventasMesas.php

					$('#tablapedidos tr').each(function() {
						var arrayOfThisRow = [];
						var idproducto = '';

						for (var i = 0; i <= 4; i++) {
							if (i == 3) {
								var campo = $('#' + idproducto).val();
							} else {
								var campo = $(this).find('td').eq(i).html();
								if (i == 0) {
									idproducto = campo;
								}
							}

							arrayOfThisRow.push(campo);
						}
						myTableArray.push(arrayOfThisRow);
					});


					$('#bebidas').modal('hide');
					// el array generado está en myTableArray
					//alert(myTableArray); 

					var codmesa = $('#codmesa').html();
					var usuario = $('#usuariologueado').html();
					var listempleado = $('#atendidopor option:selected').text();
					var arrayempleado = listempleado.split('-');
					var empleado = arrayempleado[0];
					var mesa = $('#nombremesa').html();


					$.ajax({
						type: 'POST',
						url: 'Views/modules/ventas/ventasMesas.php',
						data: {
							action: myTableArray,
							codmesa: codmesa,
							usuario: usuario,
							empleado: empleado,
							mesa: mesa
						},
						success: function(data) {
							if (data.trim() != "") {
								//alert(data);  
								//console.log(data);                	
							} else {
								//alert("La data recibida está vacia");
							}

						},
						error: function() {
							alert("No se ha podido obtener la información");
						}
					});



					return false;
				})


				function totalizar(idproducto) {
					var arrayOfThisRow = [];
					var acum2 = 0;
					var cantidad = $('#' + idproducto).val();
					var preuni = $('#preuni' + idproducto).html();
					var totaluni = parseFloat(cantidad) * parseFloat(preuni);
					$('#totaluni' + idproducto).html(totaluni);

					$('#tablapedidos tr').each(function() {
						var valor = $(this).find('td').eq(4).html();
						acum2 = acum2 + parseFloat(valor);

					});

					$('#total').html('<i class="fa fa-usd"></i>&nbsp;<b>' + acum2 + '</b>');


					// montar el contenido de la tabla en un arreglo para pasarlo por ajax a ventasMesas.php

					arrayOfThisRow.push(idproducto);
					arrayOfThisRow.push(preuni);
					arrayOfThisRow.push(cantidad);
					arrayOfThisRow.push(totaluni);

					var codmesa = $('#codmesa').html();
					var usuario = $('#usuariologueado').html();
					var listempleado = $('#atendidopor option:selected').text();
					var arrayempleado = listempleado.split('-');
					var empleado = arrayempleado[0];
					var mesa = $('#nombremesa').html();

					$.ajax({
						type: 'POST',
						url: 'Views/modules/ventas/ventasMesas.php',
						data: {
							action: "cambio cantidad mesa",
							arreglo: arrayOfThisRow,
							codmesa: codmesa,
							usuario: usuario,
							empleado: empleado,
							mesa: mesa
						},
						success: function(data) {
							if (data.trim() != "") {
								alert(data);
								//console.log(data);

							} else {
								//alert("La data recibida está vacia");
							}

						},
						error: function() {
							alert("No se ha podido obtener la información");
						}
					});



				}


				$('#bebidas').on('hidden.bs.modal', function() {
					$('#listabebida').val('0');
					$('#listaplatocarne').val('0');
					$('#listaensalada').val('0');
					$('#listanavideno').val('0');
					$('#listapanes').val('0');
					$('#listadesayuno').val('0');
					$('#listaadicionales').val('0');
					$('#listapizza').val('0');
					$('#listapostre').val('0');
				});


				function eliminarProducto(idproducto) {
					var codmesa = $('#codmesa').html();
					//alert('row'+idproducto);
					$('#row' + idproducto).remove();
					var acumx = 0;
					$('#tablapedidos tr').each(function() {
						var valor = $(this).find('td').eq(4).html();
						acumx = acumx + parseFloat(valor);

					});

					$('#total').html('<i class="fa fa-usd"></i>&nbsp;<b>' + acumx + '</b>');


					$.ajax({
						type: 'POST',
						url: 'Views/modules/ventas/ventasMesas.php',
						data: {
							action: "EliminarOrdenProducto",
							codmesa: codmesa,
							idproducto: idproducto
						},
						success: function(data) {
							if (data.trim() != "") {
								//alert(data);  
								//console.log(data);                   

							} else {
								//alert("La data recibida está vacia");
							}

						},
						error: function() {
							alert("No se ha podido obtener la información");
						}
					});
				}

				function facturar() {
					var usuariox = $('#usuariologueado').html();
					//alert(usuariox);
					var codmesa = $('#codmesa').html();
					if ($('#tablapedidos').html() == '') {
						alert('Debe cargar productos para facturar!');
					} else {



						$.ajax({
							type: 'POST',
							url: 'Views/modules/ventas/ventasMesas.php',
							data: {
								action: "FacturarMesa",
								codmesa: codmesa,
								usuario: usuariox
							},
							success: function(data) {
								if (data.trim() != "") {
									var mesa = $('#nombremesa').html();
									//alert(data);  
									//console.log(data); 
									$('#tablapedidos').html('');
									alert('Los productos de la mesa ' + mesa + ' han sido facturados, ahora esta mesa está disponible!');


									window.open("Views/modules/ventas/facturas_PDF.php?mesa=" + mesa, "Generar reporte", "toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, fullscreen=yes");


								} else {
									//alert("La data recibida está vacia");
								}

							},
							error: function() {
								alert("No se ha podido obtener la información");
							}
						});
					}


				}
			</script>

		</div>

	</div>
</div>