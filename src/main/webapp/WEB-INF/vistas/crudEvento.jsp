<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>AÑADIR EVENTO</title>
</head>
<body>

	<div class="container">
		<h1>Crud de Evento</h1>
		<div class="col-md-23">
			<form id="idFormElimina" action="eliminaEvento">
				<input type="hidden" id="id_elimina" name="id">
			</form>

			<form accept-charset="UTF-8" action="listaEventoN"
				class="simple_form" id="defaultForm2" method="get">
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							<input class="form-control" id="id_nonbre_filtro" name="filtro"
								placeholder="Ingrese el nombre" type="text" maxlength="500" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<button type="submit" class="btn btn-primary" id="validateBtnw1">FILTRA</button>
						<br>&nbsp;<br>
					</div>
					<div class="col-md-3">
						<button type="button" data-toggle='modal' onclick="registrar();"
							class='btn btn-success' id="validateBtnw2">REGISTRA</button>
						<br>&nbsp;<br>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="content">

							<table id="tableEvento"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nombre</th>
										<th>Fecha de Evento</th>
										<th>Fecha de publicacionto</th>
										<th>Fecha de Regustro</th>
										<th>idEmpresa</th>
										<th>Actualiza</th>
										<th>Elimina</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${eventos}" var="x">
										<tr>
											<td>${x.idEvento}</td>
											<td>${x.nombre}</td>
											<td>${x.fechaEvento}</td>
											<td>${x.fechaPublicacion}</td>
											<td>${x.fechaRegistro}</td>
											<td>${x.idEmpresa}</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="editar('${x.idEvento}','${x.nombre}','${x.fechaEvento}','${x.fechaPublicacion}','${x.fechaRegistro}','${x.idEmpresa}');"
													class='btn btn-success'
													style='background-color: hsla(233, 100%, 100%, 0);'>
													<img src='images/edit.gif' width='auto' height='auto' />
												</button>
											</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="eliminar('${x.idEvento}');"
													class='btn btn-success'
													style='background-color: hsla(233, 100%, 100%, 0);'>
													<img src='images/delete.gif' width='auto' height='auto' />
												</button>
											</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="modal fade" id="idModalRegistra">
			<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Registro de
							Evento
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8"
							action="registraEvento" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Evento</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre"
														name="nombre" placeholder="Ingrese el Nombre" type="text"
														maxlength="500" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_fechaEvento">Fecha de Evento</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaEvento"
														name="fechaEvento"
														placeholder="Ingrese fechaEvento" type="text"
														maxlength="10" />
												</div>
											</div>
										
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_fechaPublicacion">Fecha de Publicacion</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaPublicacion"
														name="fechaPublicacion"
														placeholder="Ingrese fechaPublicacion" type="text"
														maxlength="10" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_fechaRegistro">Fecha de Registro</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_fechaRegistro"
														name="fechaRegistro" placeholder="Ingrese fechaRegistro"
														type="text" maxlength="10" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_idEmpresa">Id Empresa</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_idEmpresa"
														name="idEmpresa" placeholder="Ingrese idEmpresa" type="text"
														maxlength="10" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="submit" class="btn btn-primary">REGISTRA</button>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</form>

					</div>
				</div>
			</div>

		</div>

		<div class="modal fade" id="idModalActualiza">
			<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Actualiza
							Evento
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							action="actualizaEvento" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Evento</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">ID</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_ID" readonly="readonly"
														name="idEvento" type="text" maxlength="100" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_nombre"
														name="nombre" placeholder="Ingrese el nombre" type="text"
														maxlength="500" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_fechaEvento">Fecha de Evento</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_fechaEvento"
														name="fechaEvento"
														placeholder="Ingrese el fechaEvento" type="text"
														maxlength="10" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_fechaPublicacion">Fecha de Publicacion</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_fechaPublicacion"
														name="fechaPublicacion"
														placeholder="Ingrese fechaPublicacion" type="text"
														maxlength="10" />
												</div>
											</div>
											
																						
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_fechaRegistro">Fecha de Registro</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_fechaRegistro"
														name="fechaRegistro" placeholder="Ingrese el fechaRegistro"
														type="text" maxlength="10" />
												</div>
											</div>
											
											
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_idEmpresa">Id Empresa</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_idEmpresa"
														name="idEmpresa" placeholder="Ingrese idEmpresa" type="text"
														maxlength="10" />
												</div>
											</div>
											
											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="submit" class="btn btn-primary">ACTUALIZA</button>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</form>

					</div>
				</div>
			</div>

		</div>

	</div>

	<script type="text/javascript">
		function eliminar(id) {
			$('input[id=id_elimina]').val(id);
			$('#idFormElimina').submit();
		}

		function registrar() {
			$('#idModalRegistra').modal("show");
		}

		function editar(id, nombre, fechaEvento, fechaPublicacion, fechaRegistro,idEmpresa ) {
			$('input[id=id_ID]').val(id);
			$('input[id=id_act_nombre]').val(nombre);
			$('input[id=id_act_fechaEvento]').val(fechaEvento);
			$('input[id=id_act_fechaPublicacion]').val(fechaPublicacion);
			$('input[id=id_act_fechaRegistro]').val(fechaRegistro);
			$('input[id=id_act_idEmpresa]').val(idEmpresa);
			$('#idModalActualiza').modal("show");
		}

		$(document).ready(function() {
			$('#tableEvento').DataTable();
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
											message : 'El nombre es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								fechaEvento: {
									selector : '#id_reg_fechaEvento',
									validators : {
										notEmpty : {
											message : 'fechaEvento es un campo obligatorio'
										},
										stringLength : {
											message : 'fechaEvento ',
											min : 10,
											max : 10
										}
									}
								},
								fechaPublicacion : {
									selector : '#id_reg_fechaPublicacion',
									validators : {
										notEmpty : {
											message : 'fechaPublicacion un campo obligatorio'
										},
										stringLength : {
											message : 'fechaPublicacion ',
											min : 10,
											max : 10
										}
									}
								},
								fechaRegistro : {
									selector : '#id_reg_fechaRegistro',
									validators : {
										notEmpty : {
											message : 'El fechaRegistro es un campo obligatorio'
										},
										stringLength : {
											message : 'fechaRegistro ',
											min : 10,
											max : 10
										}
									}
								},
								
								idEmpresa : {
									selector : '#id_reg_idEmpresa',
									validators : {
										notEmpty : {
											message : 'El idEmpresa es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El idEmpresa es  entero '
										}
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

								idEvento : {
									selector : '#id_ID',
									validators : {
										notEmpty : {
											message : 'El idEvento es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El id Evento es  entero'
										}
									}
								},
								nombre : {
									selector : '#id_act_nombre',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								fechaEvento: {
									selector : '#id_act_fechaEvento',
									validators : {
										notEmpty : {
											message : 'fechaEvento es un campo obligatorio'
										},
										stringLength : {
											message : 'fechaEvento ',
											min : 10,
											max : 10
										}
									}
								},
								fechaPublicacion : {
									selector : '#id_act_fechaPublicacion',
									validators : {
										notEmpty : {
											message : 'fechaPublicacion un campo obligatorio'
										},
										stringLength : {
											message : 'fechaPublicacion ',
											min : 10,
											max : 10
										}
									}
								},
								fechaRegistro : {
									selector : '#id_act_fechaRegistro',
									validators : {
										notEmpty : {
											message : 'El fechaRegistro es un campo obligatorio'
										},
										stringLength : {
											message : 'fechaRegistro ',
											min : 10,
											max : 10
										}
									}
								},
								
								idEmpresa : {
									selector : '#id_act_idEmpresa',
									validators : {
										notEmpty : {
											message : 'El idEmpresa es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El idEmpresa es  entero '
										}
									}
								},
							}
						});
	</script>


</body>
</html>
