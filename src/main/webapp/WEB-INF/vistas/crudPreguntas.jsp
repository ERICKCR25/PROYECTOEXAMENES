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
	<div class="container">
		<header>
			<c:forEach items="${examen}" var="x">
				<h2 class="text-center text-light">${x.nombre}</h2>
				<h3 class="text-center text-light">${x.descripcion}</h3>
				<form class="justify-text-center" action="listaPreguntasExamen"
					accept-charset="UTF-8" method="POST">
					<div class="form-row align-items-inline" id="filtro">
						<div class="col-xs-2">
							<input type="text" class="form-control" id="idlista"
								name="idlista" value="${x.idexamen}" readonly="readonly">
						</div>
						<div class="col-auto">
							<button type="submit" class="btn btn-primary">buscar</button>
						</div>
					</div>
				</form>
			</c:forEach>
		</header>
		<div class="container">
			<form id="idFormElimina" action="eliminaConcurso">
				<input type="hidden" id="id_elimina" name="id">
			</form>

			<form action="listaPreguntas" accept-charset="UTF-8">
				<div class="form-row align-items-inline" id="filtro">
					<div class="col-md-9">
						<label class="sr-only" for="inlineFormInputGroup">nombre</label>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fas fa-search"></i>
								</div>
							</div>
							<input type="text" class="form-control" id="id_nonbre_filtro"
								name="filtro" placeholder="enunciado de pregunta">
						</div>
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary">buscar</button>
					</div>
					<div class="col-auto">
						<button type="button" data-toggle='modal' onclick="registrar();"
							class="btn btn-warning">
							<i class="far fa-plus-square"></i> Nueva pregunta
						</button>
					</div>
				</div>
			</form>


			<div class="table-responsive">
				<table id="tablePreguntas"
					class="table table-striped table-bordered table-hover text-center"
					style="width: 100%">
					<thead class="thead-dark">
						<tr>
							<th>ID</th>
							<th>Numero</th>
							<th>Enunciado</th>
							<th>Valor Total</th>
							<th>Tipo preg</th>
							<th>Actualiza</th>
							<th>Elimina</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${preguntas}" var="x">
							<tr>
								<td>${x.idPregunta}</td>
								<td>${x.nPregunta}</td>
								<td>${x.enunciado}</td>
								<td>${x.valorTotal}</td>
								<td>${x.idTipoPregunta}</td>
								<td>
									<button type='button' data-toggle='modal'
										onclick="editar('${x.idPregunta}','${x.enunciado}','${x.valorTotal}','${x.idTipoPregunta}');"
										class='btn btn-success'>
										<i class="far fa-edit"></i>
									</button>
								</td>
								<td>
									<button type='button' data-toggle='modal'
										onclick="eliminar('${x.idPregunta}');" class="btn btn-danger">
										<i class="far fa-trash-alt"></i>
									</button>
								</td>
							</tr>


						</c:forEach>
					</tbody>
				</table>
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
									<label for="id_ID" class="col-form-label">ID de la Pregunta:</label> <input class="form-control" id="id_act_idPregunta" name="idPregunta" readonly="readonly" type="text">
								</div>
								<div class="form-group">
									<label for="id_act_nombre" class="col-form-label">Enunciado</label>
									<textarea type="text" class="form-control" id="id_act_enunciado" name="enunciado" placeholder="Ingrese el enunciado"></textarea>
      							</div>
								<div class="form-group">
									<label for="id_act_valorTotal" class="col-form-label">Valor de Pregunta</label>
									 <input type="text" class="form-control" id="id_act_valorTotal" name="valorTotal" placeholder="Ingrese el puntaje de la pregunta">
								</div>
								<div class="form-group">
									<label for="id_act_tipoPregunta">Tipo de pregunta</label> 
									<select class="form-control" id="id_act_tipoPregunta">
										<option value="">Seleccione</option>
										<option value="1">Normal</option>
										<option value="2">V o F</option>
										<option value="3">Seleccion Multiple</option>
									</select>
								</div>
						</div>						
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">ACTUALIZAR</button>
						</div>
						</form>
					</div>
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
		function eliminar(id) {
			$('input[id=id_elimina]').val(id);
			$('#idFormElimina').submit();
		}
		function registrar(id) {
			$('input[id=id_reg_idexam]').val(id);
			$('#id_form_registra').submit();
		}

		function registrar() {
			$('#idModalRegistra').modal("show");
		}

		function editar(idPregunta,enunciado,valorTotal,tipoPregunta) {			
			$('input[id=id_act_idPregunta]').val(idPregunta);
			$('textarea[id=id_act_enunciado]').val(enunciado);
			$('input[id=id_act_valorTotal]').val(valorTotal);	
			$('select[id=id_act_tipoPregunta]').val(tipoPregunta);
			$('#idModalActualiza').modal("show");
		}

		$(document)
		.ready(
				function() {
					$('#tablePreguntas')
							.DataTable(
									{
										//para cambiar el lenguaje a español
										"language" : {
											"lengthMenu" : "Mostrar _MENU_ registros",
											"zeroRecords" : "No se encontraron resultados",
											"info" : "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
											"infoEmpty" : "Mostrando registros del 0 al 0 de un total de 0 registros",
											"infoFiltered" : "(filtrado de un total de _MAX_ registros)",
											"sSearch" : "Buscar:",
											"oPaginate" : {
												"sFirst" : "Primero",
												"sLast" : "Último",
												"sNext" : "Siguiente",
												"sPrevious" : "Anterior"
											},
											"sProcessing" : "Procesando...",
										}
									});
				});
	</script>

	<script type="text/javascript">
		$('#id_form_registra')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								nombre : {
									selector : '#id_reg_nombre',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 5 a 100 caracteres',
											min : 5,
											max : 100
										}
									}
								},
								fechaInicio : {
									selector : '#id_reg_fechaInicio',
									validators : {
										notEmpty : {
											message : 'La fecha de inicio es un campo obligatorio'
										},
										date : {
											format : 'YYYY-MM-DD',
											message : 'La fecha de inicio tiene formato YYYY-MM-DD',
										}
									}
								},
								fechaFin : {
									selector : '#id_reg_fechaFin',
									validators : {
										notEmpty : {
											message : 'La fecha de fin es un campo obligatorio'
										},
										date : {
											format : 'YYYY-MM-DD',
											message : 'La fecha de fin tiene formato YYYY-MM-DD',
										}
									}
								},
								estado : {
									selector : '#id_reg_estado',
									validators : {
										notEmpty : {
											message : 'El estado es un campo obligatorio'
										},
									}
								},
							}
						});
	</script>

	<script type="text/javascript">
		$('#id_form_actualiza')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								nombre : {
									selector : '#id_act_nombre',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 5 a 100 caracteres',
											min : 5,
											max : 100
										}
									}
								},
								fechaInicio : {
									selector : '#id_act_fechaInicio',
									validators : {
										notEmpty : {
											message : 'La fecha de inicio es un campo obligatorio'
										},
										date : {
											format : 'YYYY-MM-DD',
											message : 'La fecha de inicio tiene formato YYYY-MM-DD',
										}
									}
								},
								fechaFin : {
									selector : '#id_act_fechaFin',
									validators : {
										notEmpty : {
											message : 'La fecha de fin es un campo obligatorio'
										},
										date : {
											format : 'YYYY-MM-DD',
											message : 'La fecha de fin tiene formato YYYY-MM-DD',
										}
									}
								},
								estado : {
									selector : '#id_act_estado',
									validators : {
										notEmpty : {
											message : 'El estado es un campo obligatorio'
										},
									}
								},

							}
						});
	</script>


</body>
</html>
