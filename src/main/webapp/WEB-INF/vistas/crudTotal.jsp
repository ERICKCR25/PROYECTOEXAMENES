<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- CSS personalizado -->
<link rel="stylesheet" href="bootstrap/css/main.css">
<!--datables CSS básico-->
<link rel="stylesheet" type="text/css"
	href="datatables/datatables.min.css" />
<!--datables estilo bootstrap 4 CSS-->
<link rel="stylesheet" type="text/css"
	href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Agrega Preguntas</title>
</head>
<body>

	<div class="container principal">
		<br>
		<header>
			
			<c:forEach items="${examen}" var="x">
				<form class="text-center" action="listaPreguntasExamen"
					accept-charset="UTF-8" method="POST">
					<h2 class="text-center text-light">${x.nombre}</h2>
					<div class="form-row">
						<div class="form-group col-md-11">
							<h3 class="text-left text-light">${x.descripcion}</h3>
						</div>
						<div class="form-group col-md-1">
							<input type="text" class="form-control " id="idlista" name="idlista" value="${x.idexamen}" readonly="readonly">
						</div>
						
					</div>
				</form>
			</c:forEach>
			<form id="idFormElimina" action="eliminaPregunta">
				<input type="hidden" id="elimina" name="elimina">
				<input type="hidden" id="eliminaex" name="eliminaex">
			</form>
		</header>
		<br> <br> 
		<div class="container">
			<form action="agregaPregunta">
				<input type="hidden" name="idExamen" value="${idExamen}" >
				<div class="form-row align-items-center">
					
					<div class="col-md-12">						
						<div class="input-group ">
							<div class="input-group-prepend">
								<div class="input-group-text">Pregunta:</div>
							</div>
							<input type="text" class="form-control" id="nPregunta" name="nPregunta" value="" placeholder="numero">
							<input type="text" class="form-control" id="valorTotal" name="valorTotal" placeholder="ingrese valorTotal">
							<input type="text" class="form-control" id="enunciado" name="enunciado" placeholder="ingrese pregunta">
							<select class="col-md-3 custom-select" id="idTipoPregunta" name="idTipoPregunta"onChange="muestraTipo()" reqeuired>
								<option value="">seleccione</option>
								<option value="1">normal</option>
								<option value="2">V o F</option>
								<option value="3">selección multiple</option>
							</select>
						</div>
						<br>
						<div class="text-center">
							<button type="submit" class="btn btn-warning" onclick="">
								<i class="fas fa-plus-circle"></i> Agregar Pregunta
							</button>
						</div>	
					</div>
					
				</div>
			</form>
		</div>		

		<div id="tipoNormal" class="container d-none">
			<br>
			<form>
				<div class="form-row align-items-center">
					<div class="col-md-12">					
  						<textarea class="form-control" id="respuestaNormal"placeholder="Ingresa Respuesta"></textarea>
					</div>					
				</div>
			</form>
			<br>
		</div>

		<div id="tipoVoF" class="container d-none">
			<br>
			<form id="formularioDeRespuestas">
			<div class="form-row align-items-center">
				<div class="col-md-10 my-1">
					<div class="custom-control custom-radio mr-sm-2">
							<input class="form-check-input" type="radio" name="radioPregunta" id="radioPregunta">
							<label class="form-check-label" for="gridRadios1">
           					 Verdadero
          					</label>
					</div>
					<div class="custom-control custom-radio mr-sm-2">
							<input class="form-check-input" type="radio" name="radioPregunta" id="radioPregunta" >
							<label class="form-check-label" for="gridRadios1">
           					 Falso
          					</label>
					</div>
				</div>							
			</div>
			</form>
			<br>
		</div>
		<div id="tipoSeleccionMultiple" class="container d-none">
			<br>
			<form id="formularioDeRespuestasMultiples">			
				<div class="form-row align-items-center " id="listaPreguntas">
					<ol id="listaordenada" class="col-md-12">
					<li><div class="col-md-12" id="divPregunta">
						<div class="input-group ">
							<div class="custom-control custom-radio my-auto">
								<input class="form-check-input" type="radio" name="radioPregunta" id="nuevo_li">
							</div>
								<input type="text" class="form-control" id="inlineFormInputName"placeholder="Ingrese Respuesta">
							<div class="col-xs-2  ml-2 text-right ">
								<button type="button" class="btn btn-primary" onclick="return add_li()" value="añadir li"><i class="fas fa-plus-circle"></i></button>
								<button type="button" class="btn btn-primary"><i class="fas fa-minus-circle"></i></button>
							</div>
						</div>
						</div><br></li>
						
					</ol>
					
					
					
				</div>
			</form>
			<br>
		</div>
		<br>
		
		
		
			<form hidden>
				<input type="text" id="nuevo_li">
				<br><input type="button" onclick="return add_li()" value="añadir li">
			 </form>
		
		
		
		
		
				<ol id="listadordenada" hidden>

        		</ol>
        
        
        
        
        
        
        

			
		<hr>

	
		<div class="container">
			

				<c:forEach items="${preguntas}" var="x" varStatus="cuenta">
				<div class="list-group">
					<a  class="list-group-item list-group-item-action" onmouseenter="muestraBotones(${x.nPregunta})" onmouseleave="ocultaBotones(${x.nPregunta})">

						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1">${x.nPregunta}.  ${x.enunciado}</h5>
							<small>puntua como ${x.valorTotal}</small>
						</div>
						<div class="text-right" id="div_editar">
							<button type="button" class="btn btn-success d-none" id="btnEditar${x.nPregunta}"
								onclick="editarPregunta('${x.idPregunta}','${x.nPregunta}','${x.enunciado}','${x.idExamen}','${x.valorTotal}','${x.idTipoPregunta}');">
								<i class="fas fa-pencil-alt"></i>
							</button>
							<button type="button" class="btn btn-danger d-none" id="btnEliminar${x.nPregunta}"
								onclick="eliminarPregunta('${x.idPregunta}');">
								<i class="far fa-trash-alt"></i>
							</button>
						</div>					
						</a>
				</div>
					<!--  ${not cuenta.last ? "" : "<br><div class='text-ligth text-center'><h2>ULTIMA PREGUNTA</h2></div>"}-->
					<c:if test="${status.last}">
					${x.nPregunta}
					</c:if>
					</c:forEach>
			<br>
			<!--  <div class="col-md-2 text-center">
				<p id="cant">${cantPreguntas}</p>
			</div>-->
			<div class="text-right">
				<button type="button" class="btn btn-warning" data-toggle="button"
					aria-pressed="false">
					<i class="far fa-save"></i> Guardar Examen
				</button>
			</div>
			<br> <br>
		</div>
		
		<div class="modal fade" id="idModalActualiza" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header "
							style="padding: 35px 50px; text-align: center; background-color: #31A7EA;">
							<h4 style="margin: auto;">
								<i class="fas fa-file-medical"></i>&nbsp;Editar Pregunta
							</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="modal_form_actualiza" action="actualizaPregunta" class="form-horizontal" method="get">
								<div class="form-group">
									<label for="id_ID" class="col-form-label">ID de la Pregunta:</label> 
									<input class="form-control" id="id_act_idPregunta" name="idPregunta" readonly="readonly" type="text">
								</div>
								<input type="hidden" name="nPregunta" id="id_act_nPregunta" value="">
								
								<div class="form-group">
									<label for="id_act_nombre" class="col-form-label">Enunciado</label>
									<textarea type="text" class="form-control" id="id_act_enunciado" name="enunciado" placeholder="Ingrese el enunciado"></textarea>
      							</div>
      							<input type="hidden" name="idExamen" id="id_act_idExamen">
								<div class="form-group">
									<label for="id_act_valorTotal" class="col-form-label">Valor de Pregunta</label>
									 <input type="text" class="form-control" id="id_act_valorTotal" name="valorTotal" placeholder="Ingrese el puntaje de la pregunta">
								</div>
								<div class="form-group">
									<label for="id_act_tipoPregunta">Tipo de pregunta</label> 
									<select class="custom-select" id="id_act_tipoPregunta" name="idTipoPregunta">
										<option value="">Seleccione</option>
										<option value="1">Normal</option>
										<option value="2">V o F</option>
										<option value="3">Seleccion Multiple</option>
									</select>
								</div>
						</div>
						<div class="panel panel-default">
		                            <div class="panel-heading text-center">
		                                <h5 class="panel-title"><a data-toggle="collapse" data-parent="#listaDeRespuestas" href="#listaDeRespuestas">Respuestas de esta Pregunta<i class="fas fa-angle-down"></i></a></h5>
		                            </div>
		                            <div id="listaDeRespuestas" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                	<div class="form-group col-md-12">
		                                     <div class="form-row align-items-center  justify-content-between">
												<div class="col-auto my-1">
						
													<div class="custom-control custom-radio">
														<input class="form-check-input" type="radio" name="radioPregunta" id="radioPregunta"  disabled>
													</div>
												</div>	
												<div class="col-md-7 my-1">
													<input type="text" class="form-control" id="inlineFormInputName"placeholder="Ingrese Respuesta">
												</div>
					
												<div class="col-auto my-1 float-right">
													<button type="button" class="btn btn-primary"><i class="fas fa-plus-circle"></i></button>
													<button type="button" class="btn btn-primary"><i class="fas fa-minus-circle"></i></button>
												</div>
											</div>
											</div>
		                                </div>
		                            </div>
		                            <br>
		                        </div>						
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">ACTUALIZAR</button>
						</div>
						</form>
					</div>
				</div>
			</div>			
			 














	</div>


	<script src="jquery/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- datatables JS -->
	<script type="text/javascript" src="datatables/datatables.min.js"></script>
	<script src="https://kit.fontawesome.com/2e81971293.js"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		function eliminarPregunta(id) {
			var ex = document.getElementById('idlista').value;
			$('input[id=elimina]').val(id);
			$('input[id=eliminaex]').val(ex);
			$('#idFormElimina').submit();
		}
		function registrar(id) {
			$('input[id=id_reg_idexam]').val(id);
			$('#id_form_registra').submit();
		}
		function editarPregunta(idPregunta,numero,enunciado,id,valorTotal,tipoPregunta) {			
			$('input[id=id_act_idPregunta]').val(idPregunta);
			$('input[id=id_act_nPregunta]').val(numero);
			$('textarea[id=id_act_enunciado]').val(enunciado);
			$('input[id=id_act_idExamen]').val(id);
			$('input[id=id_act_valorTotal]').val(valorTotal);	
			$('select[id=id_act_tipoPregunta]').val(tipoPregunta);
			$('#idModalActualiza').modal("show");
		}

		function muestraBotones(id) {
			var idBoton = parseInt(id);			
			$("#btnEditar"+idBoton).removeClass("d-none");
			$("#btnEliminar"+idBoton).removeClass("d-none");
		}
		function ocultaBotones(id) {
			var idBoton = parseInt(id);
			$("#btnEditar"+idBoton).addClass("d-none");
			$("#btnEliminar"+idBoton).addClass("d-none");
		}

		function muestraModal() {			
			
			$('#idModalRegistra').modal("show");
		}

		function addRespuesta(){
			var br= document.getElementById('listaPreguntas');
			var element="<div class='col-md-12'><div class='input-group'><div class='custom-control custom-radio my-auto'><input class='form-check-input' type='radio' name='radioPregunta' id='radioPregunta'></div><input type='text' class='form-control' id='inlineFormInputName'placeholder='Ingrese Respuesta'><div class='col-xs-4  ml-2 text-right'><button type='button' class='btn btn-primary'><i class='fas fa-plus-circle'></i></button>&nbsp;<button type='button' class='btn btn-primary' onclick='eliminar(this)'><i class='fas fa-minus-circle'></i></button></div></div></div><br>";
			br.innerHTML = element;
			document.getElementById("listaPreguntas").appendChild(br);
		}
		

		

		function muestraTipo() {
			var sel = parseInt(document.getElementById('tipoPregunta').value);
			switch (sel) {
			case 1:
				$("#tipoNormal").removeClass("d-none");
				$("#tipoVoF").addClass("d-none");
				$("#tipoSeleccionMultiple").addClass("d-none");

				break;
			case 2:
				$("#tipoNormal").addClass("d-none");
				$("#tipoSeleccionMultiple").addClass("d-none");
				$("#tipoVoF").removeClass("d-none");
				break;
			case 3:
				$("#tipoNormal").addClass("d-none");
				$("#tipoVoF").addClass("d-none");
				$("#tipoSeleccionMultiple").removeClass("d-none");
				break;
			default:
				
				$("#tipoNormal").addClass("d-none");
				$("#tipoVoF").addClass("d-none");
				$("#tipoSeleccionMultiple").addClass("d-none");
			}
		}
	</script>
	<script>
		function add_li() {

			var nuevoLi = document.getElementById("nuevo_li").value;

			if (nuevoLi.length > 0) {

				if (find_li(nuevoLi)) {

					var li = document.createElement('li');

					li.id = nuevoLi;

					li.innerHTML = "<div class='col-md-12'><div class='input-group'><div class='custom-control custom-radio my-auto'><input class='form-check-input' type='radio' name='radioPregunta' id='radioPregunta'></div><input type='text' class='form-control' id='inlineFormInputName'placeholder='Ingrese Respuesta'><div class='col-xs-4  ml-2 text-right'><button type='button' class='btn btn-primary' onclick='return add_li()' value='añadir li'><i class='fas fa-plus-circle'></i></button>&nbsp;<button type='button' class='btn btn-primary' onclick='eliminar(this)'><i class='fas fa-minus-circle'></i></button></div></div></div><br>";

					
					document.getElementById("listaordenada").appendChild(li);

				}

			}

			return false;

		}

		/**

		 * Funcion que busca si existe ya el <li> dentrol del <ul>

		 * Devuelve true si no existe.

		 */

		function find_li(contenido) {

			var el = document.getElementById("listaordenada").getElementsByTagName("li");

			for (var i = 0; i < el.length; i++) {

				if (el[i].innerHTML == contenido)

					return false;
			}

			return true;

		}

		/**

		 * Funcion para eliminar los elementos

		 * Tiene que recibir el elemento pulsado

		 */

		function eliminar(elemento) {

			var id = elemento.parentNode.getAttribute("id");

			node = document.getElementById(id);

			node.parentNode.removeChild(node);

		}
	</script>

</body>
</html>