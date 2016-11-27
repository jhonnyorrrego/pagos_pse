<?php
$atras="";
include_once($atras."conexion.php");
global $conexion;
session_destroy();//Destruyo la sesion para validar que no venga otro idpersona

$sql1="select nombre, iso2 from pais";
$pais=$conexion->listar_datos($sql1);
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
    <div class="container">
	  <p>&nbsp;</p>
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link active" id="boton_formulario" style="color:#0275d8;cursor:pointer">Formulario para pago</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="boton_consulta" style="color:#0275d8;cursor:pointer">Usuario registrado</a>
        </li>
      </ul>      
      <p>&nbsp;</p>
	  
	  <div id="consulta" style="display:none">
		<form name="formulario_2" id="formulario_2" method="post" action="proceso_pago1.php">
        <legend>Consulta</legend>
		
		<div class="form-group">
			<label>Tipo de documento</label>
			<select name="documenttype2" id="documenttype2" class="form-control required">
				<option value="">Por favor seleccione...</option>
				<option value="CC">C&eacute;dula de ciudan&iacute;a colombiana</option>
				<option value="CE">C&eacute;dula de extranjer&iacute;a</option>
				<option value="TI">Tarjeta de identidad</option>
				<option value="PPN">Pasaporte</option>
			</select>
		</div>
		
        <div class="form-group">
          <label>N&uacute;mero de documento</label> 
          <input type="text" name="document2" id="document2" class="form-control required">
        </div>
        
        <div>
          <button class="btn btn-mini" id="consultar_documento">Consultar</button>
        </div>
		<input type="hidden" name="idpersona" id="idpersona_formulario2">
		</form>
      </div>
	  
      <div id="formulario" class="well">
        <form name="formulario_1" id="formulario_1" method="post" action="proceso_pago1.php">
          <legend>Informaci&oacute; de pago</legend>
          
		  <div class="form-group">
            <label>N&uacute;mero de documento*</label>
            <input type="text" name="document" id="document" class="form-control number required" maxlength="12">
          </div>
		  
		  <div class="form-group">
            <label>Tipo de documento</label> 
            <select name="documenttype" id="documenttype" class="form-control required">
              <option value="">Por favor seleccione...</option>
              <option value="CC">C&eacute;dula de ciudan&iacute;a colombiana</option>
              <option value="CE">C&eacute;dula de extranjer&iacute;a</option>
			  <option value="TI">Tarjeta de identidad</option>
			  <option value="PPN">Pasaporte</option>
            </select>
          </div>
		  
          <div class="form-group">
            <label>Nombres*</label> 
            <input type="text" name="firstname" id="firstname" class="form-control required" maxlength="60">
          </div>
          
          <div class="form-group">
            <label>Apellidos*</label>
            <input type="text" name="lastname" id="lastname" class="form-control required" maxlength="60">
          </div>
		  
		  <div class="form-group">
            <label>Empresa en la que trabaja</label>
            <input type="text" name="company" id="company" class="form-control" maxlength="60">
          </div>
		  
		  <div class="form-group">
            <label>Correo electr&oacute;nico*</label>
            <input type="text" name="emailaddress" id="emailaddress" class="form-control email required" maxlength="80">
          </div>
		  
		  <div class="form-group">
            <label>Direcci&oacute;n postal completa</label>
            <input type="text" name="address" id="address" class="form-control" maxlength="100">
          </div>
		  
		  <div class="form-group">
            <label>Ciudad</label>
            <input type="text" name="city" id="city" class="form-control" maxlength="50">
          </div>
		  
		  <div class="form-group">
            <label>Provincia o departamento</label>
            <input type="text" name="province" id="province" class="form-control" maxlength="50">
          </div>
		  
		  <div class="form-group">
            <label>C&oacute;digo internacional del pa&iacute;s</label>
            <select name="country" id="country" class="form-control"><option value="">Seleccione...</option>
			<?php
			for($i=0;$i<$pais["cant_resultados"];$i++){
				echo("<option value='".$pais[$i]["iso2"]."'>".$pais[$i]["nombre"]."</option>");
			}
			?>
			</select>
          </div>
		  
		  <div class="form-group">
            <label>Tel&eacute;fono fijo</label>
            <input type="text" name="phone" id="phone" class="form-control" maxlength="30">
          </div>
		  
		  <div class="form-group">
            <label>Tel&eacute;fono celular</label>
            <input type="text" name="mobile" id="mobile" class="form-control" maxlength="30">
          </div>
           
          <div>
            <button class="btn btn-mini" id="guardar">Guardar</button>
          </div>
		  <input type="hidden" name="idpersona" id="idpersona_formulario1">
        </form>
      </div>
    </div>
    <script>
$(document).ready(function(){
	$('#formulario_1').validate();
	$('#formulario_2').validate();

	$("#guardar").click(function(){ 
	  if($('#formulario_1').valid()){
		var datos=$('#formulario_1').serialize();
		$.ajax({
		  url:"ejecutar_acciones.php?ejecutar=insertar",
		  type:"POST",
		  data:datos,
		  dataType:"json",
		  success:function(html){
			if(html.exito){
			  //generate('success', html.mensaje);
			  $("#idpersona_formulario1").val(html.idpersona);
			  $("#formulario_1").submit();
			}else{
			  generate('error', html.mensaje);
			}
		  }
		}); 
	  }
	  return false;
	});
	
	$("#consultar_documento").click(function(){
		if($('#formulario_2').valid()){
			var tipo=$("#documenttype2").val();
			var valor=$("#document2").val();
			$.ajax({
			  url:"ejecutar_acciones.php",
			  type:"POST",
			  data:{documento: valor, tipo_documento: tipo, ejecutar: 'consultar'},
			  dataType:"json",
			  success:function(html){
				if(html.exito){
				  //generate('success', html.mensaje);
				  $("#idpersona_formulario2").val(html.idpersona);
				  $("#formulario_2").submit();
				}else{
				  generate('error', html.mensaje);
				}
			  }
			});
			return false;
		}
	});
	
	$(".nav-link").click(function(){
		$(".nav-link").removeClass("active");
		$(this).addClass("active");
		
		var id=$(this).attr("id");
		if(id=='boton_formulario'){
		  $("#consulta").hide();
		  $("#formulario").show();
		}else if(id=='boton_consulta'){
		  $("#formulario").hide();
		  $("#consulta").show();
		}
	});
});
    </script>
  </body>
</html>