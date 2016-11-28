<?php
$atras="";
include_once($atras."conexion.php");

function insertar(){
  global $conexion;
  $resultado=array();
  $resultado["mensaje"]="Intente nuevamente";
  $resultado["exito"]=0;
  
  //Comprobar si ya existe
  $consulta="select * from persona where document='".@$_REQUEST["document"]."' and documenttype='".@$_REQUEST["documenttype"]."'";
  $resultado=$conexion->listar_datos($consulta);
  if($resultado["cant_resultados"]){
    $resultado["mensaje"]="Identificaci&oacute;n ya se encuentra registrada";
    $resultado["exito"]=0;
    echo(json_encode($resultado));
    die();
  }
  
  $campos=array('idpersona', 'document', 'documenttype', 'firstname', 'lastname', 'company', 'emailaddress', 'address', 'city', 'province', 'country', 'phone', 'mobile');
  $valores=array();
  
  $cant=count($campos);
  for($i=0;$i<$cant;$i++){
    $valores[]="'".$_REQUEST[$campos[$i]]."'";
  }
  $id=$conexion->insertar("persona",$campos,$valores);
  if($id){
    $resultado["mensaje"]="Insertado correctamente";
    $resultado["exito"]=1;
	$resultado["idpersona"]=$id;
  }
  
  echo(json_encode($resultado));
}

function consultar(){
  global $conexion;
  $resultado=array();
  $resultado["exito"]=0;
  $resultado["mensaje"]="No se encontraron datos";
  
  $documenttype=$_REQUEST["tipo_documento"];
  $document=$_REQUEST["documento"];
  $consulta="select * from persona where document='".$document."' and documenttype='".$documenttype."'";
  $resultados=$conexion->listar_datos($consulta);
  
  if($resultados["cant_resultados"]){
    $resultado["exito"]=1;
    $resultado["mensaje"]="Datos encontrados";
	$resultado["idpersona"]=$resultados[0]["idpersona"];
  }
  echo(json_encode($resultado));
}

function solicitar_transaccion(){
	global $conexion;
	$sql1="select * from persona where idpersona='".@$_REQUEST["idpersona"]."'";
	$persona=$conexion->listar_datos($sql1);
	
	$transaction=array();
	$transaction["bankCode"]=@$_REQUEST["bankcode"];
	$transaction["bankInterface"]=@$_REQUEST["bankinterface"];
	$transaction["reference"]=@$_REQUEST["reference"];
	$transaction["totalAmount"]=str_replace(".","",@$_REQUEST["totalamount"]);
	$transaction["ipAddress"]=$_SERVER["REMOTE_ADDR"];
	$transaction["userAgent"]=$_SERVER["HTTP_USER_AGENT"];
	$transaction["returnURL"]=RUTA_PAGOS;
	$transaction["currency"]="COP";
	$transaction["language"]="es";
	$transaction["tipAmount"]="";
	$transaction["description"]="Pago de prueba";
	
	$transaction["payer"]["idpersona"]=$persona[0]["idpersona"];
	$transaction["payer"]["document"]=$persona[0]["document"];
	$transaction["payer"]["documentType"]=$persona[0]["documenttype"];
	$transaction["payer"]["firstName"]=$persona[0]["firstname"];
	$transaction["payer"]["lastName"]=$persona[0]["lastname"];
	$transaction["payer"]["company"]=$persona[0]["company"];
	$transaction["payer"]["emailAddress"]=$persona[0]["emailaddress"];
	$transaction["payer"]["address"]=$persona[0]["address"];
	$transaction["payer"]["city"]=$persona[0]["city"];
	$transaction["payer"]["province"]=$persona[0]["province"];
	$transaction["payer"]["country"]=$persona[0]["country"];
	$transaction["payer"]["phone"]=$persona[0]["phone"];
	$transaction["payer"]["mobile"]=$persona[0]["mobile"];
	
	require_once('lib/nusoap.php');
	$client=new nusoap_client(WEBSERVICE,true);
	$resultado=$conexion->createTransaction($client,$transaction);
	
	$resultado[0]["responsereasontext"]=(htmlentities(utf8_encode($resultado[0]["responsereasontext"])));
	$resultado[0][12]="";
	
	echo(json_encode($resultado[0]));
}

function consultar_estado(){
	global $conexion;
	$idpersona=@$_REQUEST["idpersona"];
	
	require_once('lib/nusoap.php');
	$client=new nusoap_client(WEBSERVICE,true);
	$resultado=$conexion->consultar_estado_transaccion($client,$idpersona);
	$resultado["responseReasonText"]=(htmlentities(utf8_encode($resultado["responseReasonText"])));
	
	echo(json_encode($resultado));
}

if(@$_REQUEST["ejecutar"]){
  $_REQUEST["ejecutar"]();
}
?>