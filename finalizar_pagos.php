<?php
$atras="";
include_once($atras."conexion.php");
global $conexion;

require_once('lib/nusoap.php');
$client=new nusoap_client(WEBSERVICE,true);
?>
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
			<div class="form-group">
				Su transacci&oacute;n se encuentra en estado: <span id="estado_transaccion"><img src="<?php echo($atras); ?>img/cargando.gif" style="width:30px;height:30px;" id="cargando"></span>
			</div>
		</div>
<script>
$(document).ready(function(){
	var minuto=60000;//1 minuto en milisegundos
	var cantidad=minuto*12;//12 Minutos
	
	estado_proceso_pago();
	
	setInterval('estado_proceso_pago()',cantidad);
});
function estado_proceso_pago(){
	var x_idpersona='<?php echo(@$_SESSION["idpersona"]); ?>';
	$.ajax({
		url:"ejecutar_acciones.php?ejecutar=consultar_estado",
		type:"POST",
		data:{idpersona: x_idpersona},
		dataType:"json",
		success:function(html){
			$("#estado_transaccion").html("<b>"+html.responseReasonText+"</b>");
		}
	});
}
</script>
	</body>
</html>