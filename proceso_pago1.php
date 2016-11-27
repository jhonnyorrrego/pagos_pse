<?php
$atras="";
include_once($atras."conexion.php");
global $conexion;

require_once('lib/nusoap.php');
$client=new nusoap_client(WEBSERVICE,true);
$bancos=$conexion->validar_bancos_cache($client);

$idpersona=$_POST["idpersona"];
$sql1="select * from persona per left join pais on per.country=pais.iso2 where per.idpersona=".$idpersona;
$datos_persona=$conexion->listar_datos($sql1);

$_SESSION["idpersona"]=$idpersona;//Guardo en sesion el idpersona para llamarlo al final de la transaccion y consultar su estado
?>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
  <head>
	<script src="<?php echo($atras); ?>js/jquery-3.1.1.js"></script>
    <script src="<?php echo($atras); ?>js/bootstrap.js"></script>
    <script src="<?php echo($atras); ?>js/jquery.validate.js"></script>
    <script src="<?php echo($atras); ?>js/jquery.validate.es.js"></script>
    <script src="<?php echo($atras); ?>js/bootstrap-datetimepicker.min.js"></script>
    
    <script src="<?php echo($atras); ?>js/noty/packaged/jquery.noty.packaged.js"></script>
    <?php include_once($atras."js/noty/generador_noty.php"); ?>
        
    <link rel="stylesheet" type="text/css" href="<?php echo($atras);?>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo($atras);?>css/bootstrap-datetimepicker.min.css"/>   
    
    <style>
    body,div,table,td{
      font-family:Verdana;
      font-size: 12px;
    }
    .form-control{
      width: 50%;
    }
    label.error{
      color:red;
    }
    </style>
  </head>
  <body>
	<a href="index.php">Volver al formulario de pago</a>
	<div class="container">
		<table class="table" style="width:60%">
			<thead>
			<tr>
				<td colspan="2" style="text-align:center"><b>Informaci&oacute;n de la persona</b></td>
			</tr>
			</thead>
			<tr>
				<td style="width:30%"><b>N&uacute;mero de documento</b></td>
				<td style="width:70%"><?php echo($datos_persona[0]["document"]); ?></td>
			</tr>
			<tr>
			<?php
			$documenttype=array('CC'=>'C&eacute;dula de ciudan&iacute;a colombiana', 'CE'=>'C&eacute;dula de extranjer&iacute;a', 'TI'=>'Tarjeta de identidad','PPN'=>'Pasaporte');
			?>
				<td><b>Tipo de documento</b></td>
				<td><?php echo($documenttype[$datos_persona[0]["documenttype"]]); ?></td>
			</tr>
			<tr>
				<td><b>Nombres</b></td>
				<td><?php echo($datos_persona[0]["firstname"]); ?></td>
			</tr>
			<tr>
				<td><b>Apellidos</b></td>
				<td><?php echo($datos_persona[0]["lastname"]); ?></td>
			</tr>
			<tr>
				<td><b>Empresa</b></td>
				<td><?php echo($datos_persona[0]["company"]); ?></td>
			</tr>
			<tr>
				<td><b>Correo electr&oacute;nico</b></td>
				<td><?php echo($datos_persona[0]["emailaddress"]); ?></td>
			</tr>
			<tr>
				<td><b>Pais</b></td>
				<td><?php echo($datos_persona[0]["nombre"]); ?></td>
			</tr>
		</table>
		
		<form name="formulario_1" id="formulario_1" >
		<table class="table" style="width:60%">
			<tr>
				<td><b>Referencia de pago*</</b></td>
				<td><input type="text" name="reference" id="reference" class="form-control required" maxlength=""></td>
			</tr>
			<tr>
				<td><b>Valor a pagar*</</b></td>
				<td><input type="text" name="totalamount" id="totalamount" class="form-control number required" maxlength=""></td>
			</tr>
			<tr>
				<td><b>Tipo de cliente*</</b></td>
				<td>
					<select name="bankinterface" id="bankinterface" class="required">
					<option value="0">PERSONAS</option>
					<option value="1">EMPRESAS</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>Seleccione el banco*</</b></td>
				<td>
					<?php
					if(count($bancos)){
					?>
					<select name="bankcode" id="bankcode" class="required"><option value="">Seleccione...</option>
					<?php
					$cant=count($bancos);
					for($i=0;$i<$cant;$i++){
						echo("<option value='".$bancos[$i]["bankCode"]."'>".$bancos[$i]["bankName"]."</option>");
					}
					?>
					</select>
					<?php }else{
						echo("No se pudo obtener la lista de Entidades Financieras, por favor intente m&aacute;s tarde");
					}
					?>
				</td>
			</tr>
			<tr id="tr_estado_transaccion" style="display:none">
				<td><b>Estado de la transacci&oacute;n:</b></td>
				<td id="estado_transaccion"></td>
			<tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-mini" id="guardar">Continuar</button>
					<img src="<?php echo($atras); ?>img/cargando.gif" style="width:30px;height:30px;display:none" id="cargando">
				</td>
			<tr>
		</table>
		<input type="hidden" name="idpersona" id="idpersona" value="<?php echo($datos_persona[0]["idpersona"]); ?>">
		</form>
	</div>
  <script>
  $(document).ready(function(){
	$('#formulario_1').validate();
	
	$("#guardar").click(function(){
		var minuto=60000;//1 minuto en milisegundos
		var cantidad=minuto*12;//12 Minutos
		if($('#formulario_1').valid()){
			generate('success', 'Espere un momento por favor');
			$("#cargando").show();
			var datos=$('#formulario_1').serialize();
			$.ajax({
			  url:"ejecutar_acciones.php?ejecutar=solicitar_transaccion",
			  type:"POST",
			  data:datos,
			  dataType:"json",
			  success:function(html){
				$("#cargando").hide();
				if(html.returncode=='SUCCESS'){
					window.open(html.bankurl,"_blank");
					
					$("#guardar").hide();
					
					estado_proceso_pago();
					setInterval('estado_proceso_pago()',cantidad);
				}else{
					generate('error', html.responsereasontext,6000);
				}
			  }
			}); 
		}
		return false;
	});
  });
  function estado_proceso_pago(){
	var x_idpersona='<?php echo(@$idpersona); ?>';
	$.ajax({
		url:"ejecutar_acciones.php?ejecutar=consultar_estado",
		type:"POST",
		data:{idpersona: x_idpersona},
		dataType:"json",
		success:function(html){
			$("#tr_estado_transaccion").show();
			$("#estado_transaccion").html(html.responseReasonText);
		}
	});
  }
  </script>
  </body>
 </html>