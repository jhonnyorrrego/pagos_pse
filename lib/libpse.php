<?php
include_once($atras."define.php");
class libpse{
	public $con;
	public function __construct(){
		$this->con = mysqli_connect(HOST,USER,PASS) or die ('Error en la conexion');
		$db = mysqli_select_db($this->con,DB) or die ('Error en la DB');
	}
	public function __destruct(){
		mysqli_close($this->con);
	}
	/*Lista en una matriz los resultados de una consulta
	$consulta=sql del select
	*/
	public function listar_datos($consulta){
		$retorno=array();
		$res=mysqli_query($this->con,$consulta);
		$cantidad=0;
		while($result = mysqli_fetch_array($res,MYSQL_BOTH)){
			array_push($retorno,$result);
			$cantidad++;
		}
		$retorno["cant_resultados"]=$cantidad;
		mysqli_free_result($res);
		return($retorno);
	}
	/*Inserta en base de datos segun los parametros recibidos
	$tabla=Nombre de la tabla a insertar
	$campos=array con el nombre de los campos a insertar
	$valores=array con los valores a insertar, debe estar en el mismo orden del arreglo de campos
	*/
	public function insertar($tabla,$campos,$valores){
		$sql1="insert into ".$tabla."(".implode(",",$campos).")values(".implode(",",$valores).")";
		mysqli_query($this->con,$sql1);
		$id=mysqli_insert_id($this->con);
		return($id);
	}
	//Funcion que retorna la autenticacion facilitados por PSE
	private function autenticacion_ws(){
		$seed = date('c');
		$hashString = sha1( $seed. LLAVE , false );

		$params=array();
		$params["auth"]["login"]=ID;
		$params["auth"]["tranKey"]=$hashString;
		$params["auth"]["seed"]=$seed;
		return($params);
	}
	/*Retorna lista de bancos traidos desde cache o consumiento el servicio
	$client=Variable de conexion webservice a consumir
	*/
	public function validar_bancos_cache($client){
		$bancos_cache=json_decode($_COOKIE["listabancos"],true);
		if($bancos_cache){
			return($bancos_cache);
		}else{
			$autenticacion=$this->autenticacion_ws();
			$result=$client->call('getBankList',$autenticacion);
			$tiempo=(60*60*24);//1 dia en cache
			$almacen=setcookie('listabancos', json_encode($result["getBankListResult"]["item"]), time()+$tiempo);
			return($result["getBankListResult"]["item"]);
		}
	}
	/*Funcion que crea la transaccion
	$client=Variable de conexion webservice a consumir
	$parametros=matriz con los datos de transaccion
	*/
	public function createTransaction($client,$parametros){
		$datos=$this->autenticacion_ws();
		$datos["transaction"]=$parametros;
		$result=$client->call('createTransaction',$datos);
		
		$campos=array();
		$valores=array();
		foreach($result["createTransactionResult"] as $campo => $value){
			if($campo){
				$campos[]=strtolower($campo);
				$valores[]="'".$value."'";
			}
		}
		$campos[]="fk_idpersona";
		$valores[]=$parametros["payer"]["idpersona"];
		
		$id=$this->insertar('persona_transaccion',$campos,$valores);//Almaceno datos de respuesta de la transaccion
		$sql1="select * from persona_transaccion where idpersona_transaccion=".$id;
		$resultado=$this->listar_datos($sql1);
		
		return($resultado);
	}
	/*Funcion que muestra el estado de la transaccion
	$client=Variable de conexion webservice a consumir
	$idpersona=id de la persona
	*/
	public function consultar_estado_transaccion($client,$idpersona){
		$sql1="select idpersona_transaccion, transactionid from persona_transaccion where fk_idpersona='".$idpersona."' order by idpersona_transaccion desc limit 0,1";//obtengo la ultima transaccion realizada
		$datos_transaccion=$this->listar_datos($sql1);
		
		$datos=$this->autenticacion_ws();
		$datos["transactionID"]=$datos_transaccion[0]["transactionid"];
		$result=$client->call('getTransactionInformation',$datos);
		
		$campos=array();
		$valores=array();
		foreach($result["getTransactionInformationResult"] as $campo => $value){
			if($campo){
				$campos[]=strtolower($campo);
				$valores[]="'".$value."'";
			}
		}
		$campos[]="fk_idpersona";
		$valores[]=$idpersona;
		
		$campos[]="fk_idpersona_transaccion";
		$valores[]=$datos_transaccion[0]["idpersona_transaccion"];
		
		$id=$this->insertar('persona_estado_trans',$campos,$valores);//Almaceno datos de respuesta de consulta del estado de transaccion
		
		return($result["getTransactionInformationResult"]);
	}
}
?>