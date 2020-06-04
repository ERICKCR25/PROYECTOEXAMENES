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

<title>AÑADIR EMPRESA</title>
</head>
<body>

	<div class="container">
		<h1>Crud de Empresa</h1>
		<div class="col-md-23">
			<form id="idFormElimina" action="eliminaEmpresa">
				<input type="hidden" id="id_elimina" name="id">
			</form>

			<form accept-charset="UTF-8" action="listaEmpresaN"
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

							<table id="tableEmpresa"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Nombre</th>
										<th>Ruc</th>
										<th>Direccion</th>
										<th>idDistrito</th>
										<th>Correo</th>
										<th>Actualiza</th>
										<th>Elimina</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${empresas}" var="x">
										<tr>
											<td>${x.idEmpresa}</td>
											<td>${x.nombre}</td>
											<td>${x.ruc}</td>
											<td>${x.direccion}</td>
											<td>${x.idDistrito}</td>
											<td>${x.correo}</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="editar('${x.idEmpresa}','${x.nombre}','${x.ruc}','${x.direccion}','${x.idDistrito}','${x.correo}');"
													class='btn btn-success'
													style='background-color: hsla(233, 100%, 100%, 0);'>
													<img src='images/edit.gif' width='auto' height='auto' />
												</button>
											</td>
											<td>
												<button type='button' data-toggle='modal'
													onclick="eliminar('${x.idEmpresa}');"
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
							Empresa
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8"
							action="registraEmpresa" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Empresa</a>
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
													for="id_reg_ruc">RUC</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_ruc"
														name="ruc"
														placeholder="Ingrese ruc" type="text"
														maxlength="11" />
												</div>
											</div>
										
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_reg_direccion">Direccion</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_direccion"
														name="direccion"
														placeholder="Ingrese direccion" type="text"
														maxlength="500" />
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
												<label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_correo"
														name="correo" placeholder="Ingrese correo" type="text"
														maxlength="200" />
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
							Empresa
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							action="actualizaEmpresa" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos del Empresa</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">ID</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_ID" readonly="readonly"
														name="idEmpresa" type="text" maxlength="100" />
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
													for="id_act_ruc">RUC</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_ruc"
														name="ruc"
														placeholder="Ingrese el ruc" type="text"
														maxlength="11" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label"
													for="id_act_direccion">Direccion</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_direccion"
														name="direccion"
														placeholder="Ingrese direccion" type="text"
														maxlength="500" />
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
												<label class="col-lg-3 control-label" for="id_act_correo">Correo</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_act_correo"
														name="correo" placeholder="Ingrese correo" type="text"
														maxlength="200" />
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

		function editar(id, nombre, ruc, direccion, idDistrito,correo ) {
			$('input[id=id_ID]').val(id);
			$('input[id=id_act_nombre]').val(nombre);
			$('input[id=id_act_ruc]').val(ruc);
			$('input[id=id_act_direccion]').val(direccion);
			$('input[id=id_act_idDistrito]').val(idDistrito);
			$('input[id=id_act_correo]').val(correo);
			$('#idModalActualiza').modal("show");
		}

		$(document).ready(function() {
			$('#tableEmpresa').DataTable();
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
								ruc: {
									selector : '#id_reg_ruc',
									validators : {
										notEmpty : {
											message : 'ruc es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{11}$/,
											message : 'El ruc es  entero de 11 caracteres'
										}
									}
								},
								direccion : {
									selector : '#id_reg_direccion',
									validators : {
										notEmpty : {
											message : 'direccion un campo obligatorio'
										},
										stringLength : {
											message : 'direccion es de 2 a 500 caracteres',
											min : 2,
											max : 500
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
											message : 'El idDistrito es  entero '
										}
									}
								},
								
								correo : {
									selector : '#id_reg_correo',
									validators : {
										notEmpty : {
											message : 'El correo es un campo obligatorio'
										},
										regexp : {
											regexp : /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/,
											message : 'El correo contiene @'
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

								idEmpresa : {
									selector : '#id_ID',
									validators : {
										notEmpty : {
											message : 'El idempresaes un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]+$/,
											message : 'El id empresa es  entero'
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
								ruc: {
									selector : '#id_act_ruc',
									validators : {
										notEmpty : {
											message : 'ruc es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{11}$/,
											message : 'El ruc es  entero de 11 caracteres'
										}
									}
								},
								direccion : {
									selector : '#id_act_direccion',
									validators : {
										notEmpty : {
											message : 'direccion un campo obligatorio'
										},
										stringLength : {
											message : 'direccion es de 2 a 500 caracteres',
											min : 2,
											max : 500
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
											message : 'El idDistrito es  entero '
										}
									}
								},
								
								correo : {
									selector : '#id_act_correo',
									validators : {
										notEmpty : {
											message : 'El correo es un campo obligatorio'
										},
										regexp : {
											regexp : /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/,
											message : 'El correo contiene @'
										}
									}
								},
							}
						});
	</script>


</body>
</html>
