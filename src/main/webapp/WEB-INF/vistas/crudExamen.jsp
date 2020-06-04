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

<title>CREA UN NUEVO EXAMEN</title>
</head>
<body>

	<div class="container">
		<h1>Crud de Examen</h1>
		<div class="col-md-23">
			<form id="idFormElimina" action="eliminaExamen">
				<input type="hidden" id="id_elimina" name="id">
			</form>

			<form accept-charset="UTF-8" action="listaExamenN"
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

							<table id="tableAlumno"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nombre</th>
										<th>Descripcion</th>
										<th>Cant Preg.</th>
										<th>Punt Aprob</th>
										<th>Porc Aprob</th>
										<th>Valor Total</th>
										<th>Actualiza</th>
										<th>Elimina</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${examenes}" var="x">
										<tr>
											<td>${x.idexamen}</td>
											<td>${x.nombre}</td>
											<td>${x.descripcion}</td>
											<td>${x.numPreguntas}</td>
											<td>${x.valorAprobatorio}</td>
											<td>${x.porAprobacion}</td>
											<td>${x.valorTotal}</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="editar('${x.idexamen}','${x.nombre}','${x.descripcion}','${x.claves}','${x.numPreguntas}','${x.valorAprobatorio}','${x.porAprobacion}','${x.valorTotal}');"
													class='btn btn-success'
													style='background-color: hsla(233, 100%, 100%, 0);'>
													<img src='images/edit.gif' width='auto' height='auto' />
												</button>
											</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="eliminar('${x.idexamen}');"
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
							Examen
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8"
							action="registraExamen" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Examen</a>
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
													for="id_reg_descripcion">descripcion</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_descripcion"
														name="descripcion"
														placeholder="Ingrese la fecha de inicio" type="text"
														maxlength="500" />
												</div>
											</div>
											<input type="hidden" name="claves" id="claves" value="">
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_numPreguntas">Numero de Preguntas</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_numPreguntas"
														name="numPreguntas"
														placeholder="Ingrese la fecha de inicio" type="text"
														maxlength="4" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_valorAprobatorio">Puntaje Aprobatorio</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_valorAprobatorio"
														name="valorAprobatorio"
														placeholder="Ingrese valorAprobatorio" type="text"
														maxlength="4" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_porAprobacion">Porcentaje Aprobatorio</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_porAprobacion"
														name="porAprobacion" placeholder="Ingrese porAprobacion"
														type="text" maxlength="5" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_valorTotal">Valor total</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_valorTotal"
														name="valorTotal" placeholder="Ingrese valorTotal"
														type="text" maxlength="6" />
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
							Exámen
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							action="actualizaExamen" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Exámen</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">ID</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_ID" readonly="readonly"
														name="idexamen" type="text" maxlength="100" />
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
													for="id_act_descripcion">descripcion</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_descripcion"
														name="descripcion" placeholder="Ingrese el descripcion"
														type="text" maxlength="500" />
												</div>
											</div>
											<input type="hidden" name="claves" id="id_act_claves"
												value="">
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_numPreguntas">Numero de Preguntas</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_numPreguntas"
														name="numPreguntas"
														placeholder="Ingrese el número de preguntas" type="text"
														maxlength="4" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_valorAprobatorio">Valore Aprobatorio</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_valorAprobatorio"
														name="valorAprobatorio"
														placeholder="Ingrese el valor Aprobatorio" type="text"
														maxlength="4" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_porAprobacion">Porcentaje Aprobatorio</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_porAprobacion"
														name="porAprobacion"
														placeholder="Ingrese el porcentaje de probacion"
														type="text" maxlength="5" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_valorTotal">Valor total</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_valorTotal"
														name="valorTotal" placeholder="Ingrese el valor Total"
														type="text" maxlength="6" />
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

		function editar(id, nombre, descripcion, claves, numPreguntas,
				valorAprobatorio, porAprobacion, valorTotal) {
			$('input[id=id_ID]').val(id);
			$('input[id=id_act_nombre]').val(nombre);
			$('input[id=id_act_descripcion]').val(descripcion);
			$('input[id=id_act_claves]').val(claves);
			$('input[id=id_act_numPreguntas]').val(numPreguntas);
			$('input[id=id_act_valorAprobatorio]').val(valorAprobatorio);
			$('input[id=id_act_porAprobacion]').val(porAprobacion);
			$('input[id=id_act_valorTotal]').val(valorTotal);
			$('#idModalActualiza').modal("show");
		}

		$(document).ready(function() {
			$('#tableAlumno').DataTable();
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
								descripcion : {
									selector : '#id_reg_descripcion',
									validators : {
										notEmpty : {
											message : 'La descripción es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								numPreguntas : {
									selector : '#id_reg_numPreguntas',
									validators : {
										notEmpty : {
											message : 'El numero de preguntas un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El numero de preguntas son  enteros'
										}
									}
								},
								valorAprobatorio : {
									selector : '#id_reg_valorAprobatorio',
									validators : {
										notEmpty : {
											message : 'El valor aprobatorio es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El valor aprobatorio es  entero'
										}
									}
								},
								porAprobacion : {
									selector : '#id_reg_porAprobacion',
									validators : {
										notEmpty : {
											message : 'El porcentaje de aprobación es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'porcentaje de aprobación  es  entero'
										}
									}
								},

								valorTotal : {
									selector : '#id_reg_valorTotal',
									validators : {
										notEmpty : {
											message : 'El valor total es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El valor total es  enteros'
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
								idexamen : {
									selector : '#id_ID',
									validators : {
										notEmpty : {
											message : 'El id Examen  es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El id Examen es  entero'
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
								descripcion : {
									selector : '#id_act_descripcion',
									validators : {
										notEmpty : {
											message : 'La descripción es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 2 a 500 caracteres',
											min : 2,
											max : 500
										}
									}
								},
								numPreguntas : {
									selector : '#id_act_numPreguntas',
									validators : {
										notEmpty : {
											message : 'El numero de preguntas un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El numero de preguntas son  enteros'
										}
									}
								},
								valorAprobatorio : {
									selector : '#id_act_valorAprobatorio',
									validators : {
										notEmpty : {
											message : 'El valor aprobatorio es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El valor aprobatorio es  entero'
										}
									}
								},
								porAprobacion : {
									selector : '#id_act_porAprobacion',
									validators : {
										notEmpty : {
											message : 'El porcentaje de aprobación es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'porcentaje de aprobación  es  entero'
										}
									}
								},
								valorTotal : {
									selector : '#id_act_valorTotal',
									validators : {
										notEmpty : {
											message : 'El valor total es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El valor total es  enteros'
										}
									}
								},
							}
						});
	</script>


</body>
</html>
