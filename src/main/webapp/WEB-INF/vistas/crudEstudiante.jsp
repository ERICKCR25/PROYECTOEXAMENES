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

<title>AÑADIR ESTUDIANTE</title>
</head>
<body>

	<div class="container">
		<h1>Crud de Estudiante</h1>
		<div class="col-md-23">
			<form id="idFormElimina" action="eliminaEstudiante">
				<input type="hidden" id="id_elimina" name="id">
			</form>

			<form accept-charset="UTF-8" action="listaEstudianteN"
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

							<table id="tableEstudiante"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nombre</th>
										<th>Apellido Paterno</th>
										<th>Apellido Materno</th>
										<th>Dni</th>
										<th>Fecha Nacimiento</th>
										<th>Colegio</th>
										<th>Celular</th>
										<th>idDistrito</th>
										<th>Actualiza</th>
										<th>Elimina</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${estudiantes}" var="x">
										<tr>
											<td>${x.idEstudiante}</td>
											<td>${x.nombre}</td>
											<td>${x.apellidoPaterno}</td>
											<td>${x.apellidoMaterno}</td>
											<td>${x.dni}</td>
											<td>${x.fechNac}</td>
											<td>${x.colegio}</td>
											<td>${x.celular}</td>
											<td>${x.idDistrito}</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="editar('${x.idEstudiante}','${x.nombre}','${x.apellidoPaterno}','${x.apellidoMaterno}','${x.dni}','${x.fechNac}','${x.colegio}','${x.celular}','${x.idDistrito}');"
													class='btn btn-success'
													style='background-color: hsla(233, 100%, 100%, 0);'>
													<img src='images/edit.gif' width='auto' height='auto' />
												</button>
											</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="eliminar('${x.idEstudiante}');"
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
							Estudiante
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8"
							action="registraEstudiante" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Estudiante</a>
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
													for="id_reg_apellidoPaterno">Apellido Paterno</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_apellidoPaterno"
														name="apellidoPaterno"
														placeholder="Ingrese apellidoPaterno" type="text"
														maxlength="500" />
												</div>
											</div>
											<input type="hidden" name="claves" id="claves" value="">
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_apellidoMaterno">Apellido Materno</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_apellidoMaterno"
														name="apellidoMaterno"
														placeholder="Ingrese apellidoMaterno" type="text"
														maxlength="500" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_dni">Dni</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_dni"
														name="dni"
														placeholder="Ingrese DNI" type="text"
														maxlength="8" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_fechNac">Fecha de Nacimiento</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_fechNac"
														name="fechNac" placeholder="Ingrese Fecha de nacimiento"
														type="text" maxlength="10" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_colegio">Colegio</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_colegio"
														name="colegio" placeholder="Ingrese colegio"
														type="text" maxlength="500" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_celular">Celular</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_celular"
														name="celular" placeholder="Ingrese celular"
														type="text" maxlength="9" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_idDistrito">Id Distrito</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_idDistrito"
														name="idDistrito" placeholder="Ingrese idDistrito"
														type="text" maxlength="4" />
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
							Estudiante
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							action="actualizaEstudiante" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Estudiante</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">ID</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_ID" readonly="readonly"
														name="idEstudiante" type="text" maxlength="100" />
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
													for="id_act_apellidoPaterno">Apellido Paterno</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_apellidoPaterno"
														name="apellidoPaterno" placeholder="Ingrese el apellidoPaterno"
														type="text" maxlength="500" />
												</div>
											</div>
											<input type="hidden" name="claves" id="id_act_claves"
												value="">
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_apellidoMaterno">Apellido Materno</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_apellidoMaterno"
														name="apellidoMaterno"
														placeholder="Ingrese el número de preguntas" type="text"
														maxlength="500" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_dni">Dni</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_dni"
														name="dni"
														placeholder="Ingrese el dni" type="text"
														maxlength="8" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_fechNac">Fecha de Nacimiento</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_fechNac"
														name="fechNac"
														placeholder="Ingrese el fechNac "
														type="text" maxlength="10" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_colegio">Colegio</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_colegio"
														name="colegio" placeholder="Ingrese colegio"
														type="text" maxlength="500" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_celular">Celular</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_celular"
														name="celular" placeholder="Ingrese celular"
														type="text" maxlength="9" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_idDistrito">id Distrito</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_idDistrito"
														name="idDistrito" placeholder="Ingrese el valor Total"
														type="text" maxlength="4" />
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

		function editar(id, nombre, apellidoPaterno,  apellidoMaterno,
				dni, fechNac,colegio,celular,idDistrito) {
			$('input[id=id_ID]').val(id);
			$('input[id=id_act_nombre]').val(nombre);
			$('input[id=id_act_apellidoPaterno]').val(apellidoPaterno);
			$('input[id=id_act_apellidoMaterno]').val(apellidoMaterno);
			$('input[id=id_act_dni]').val(dni);
			$('input[id=id_act_fechNac]').val(fechNac);
			$('input[id=id_act_colegio]').val(colegio);
			$('input[id=id_act_celular]').val(celular);
			$('input[id=id_act_idDistrito]').val(idDistrito);
			$('#idModalActualiza').modal("show");
		}

		$(document).ready(function() {
			$('#tableEstudiante').DataTable();
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
								apellidoPaterno : {
									selector : '#id_reg_apellidoPaterno',
									validators : {
										notEmpty : {
											message : 'La apellidoPaterno es un campo obligatorio'
										},
										stringLength : {
											message : 'El apellidoPaterno es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								apellidoMaterno : {
									selector : '#id_reg_apellidoMaterno',
									validators : {
										notEmpty : {
											message : 'El apellidoMaterno un campo obligatorio'
										},
										stringLength : {
											message : 'El apellidoMaterno es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								dni : {
									selector : '#id_reg_dni',
									validators : {
										notEmpty : {
											message : 'El dni es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{8}$/,
											message : 'El dni es  entero de 8 caracteres'
										}
									}
								},
								fechNac : {
									selector : '#id_reg_fechNac',
									validators : {
										notEmpty : {
											message : 'El fechNac es un campo obligatorio'
										},
										regexp : {
											regexp : /^\d{4}([\-/.])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/,
											message : 'Fecha es aa-mm-dd'
										}
									}
								},
								colegio : {
									selector : '#id_reg_colegio',
									validators : {
										notEmpty : {
											message : 'El colegio un campo obligatorio'
										},
										stringLength : {
											message : 'El colegio es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								celular : {
									selector : '#id_reg_celular',
									validators : {
										notEmpty : {
											message : 'El celular es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{9}$/,
											message : 'El celular es  entero con 9 caracteres'
										}
									}
								},
								idDistrito : {
									selector : '#id_reg_idDistrito',
									validators : {
										notEmpty : {
											message : 'El idDistrito es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El idDistritoes  entero'
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
								
								idEstudiante : {
									selector : '#id_ID',
									validators : {
										notEmpty : {
											message : 'El id Estudiante es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El id Estudiante es  entero'
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
								apellidoPaterno : {
									selector : '#id_act_apellidoPaterno',
									validators : {
										notEmpty : {
											message : 'El apellidoPaterno es un campo obligatorio'
										},
										stringLength : {
											message : 'El apellido Paterno es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								apellidoMaterno : {
									selector : '#id_act_apellidoMaterno',
									validators : {
										notEmpty : {
											message : 'El apellidoMaternos un campo obligatorio'
										},
										stringLength : {
											message : 'El apellidoMaternos es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
									
								},
								dni : {
									selector : '#id_act_dni',
									validators : {
										notEmpty : {
											message : 'El dni es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{8}$/,
											message : 'El dni es  entero con 8 caracteres'
										}
									}
								},
								fechNac : {
									selector : '#id_act_fechNac',
									validators : {
										notEmpty : {
											message : 'El fechNac es un campo obligatorio'
										},
										regexp : {
											regexp : /^\d{4}([\-/.])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/,
											message : 'Fecha es aa-mm-dd'
										}
									}
								},
								colegio : {
									selector : '#id_act_colegio',
									validators : {
										notEmpty : {
											message : 'El colegio un campo obligatorio'
										},
										stringLength : {
											message : 'El colegio es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								celular : {
									selector : '#id_act_celular',
									validators : {
										notEmpty : {
											message : 'El celular es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{9}$/,
											message : 'El celular es  entero con 9 caracteres'
										}
									}
								},
								idDistrito : {
									selector : '#id_act_idDistrito',
									validators : {
										notEmpty : {
											message : 'El idDistrito es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El idDistritoes  entero'
										}
									}
								},
							}
						});
	</script>


</body>
</html>
