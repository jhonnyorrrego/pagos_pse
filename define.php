<?php
if(!defined("HOST"))	
  define("HOST", "localhost");
if(!defined("USER"))
  define("USER", "mauro");
if(!defined("PASS"))
  define("PASS", "mauro"); 
if(!defined("DB"))
  define("DB", "pse");

ini_set("memory_limit","400M");
ini_set('error_reporting', E_ALL & ~E_NOTICE & ~E_WARNING);  
ini_set("display_errors",true);
ini_set("safe_mode",false);
date_default_timezone_set ("America/Bogota");

define("WEBSERVICE","https://test.placetopay.com/soap/pse/?wsdl");
define("ID","6dd490faf9cb87a9862245da41170ff2");
define("LLAVE","024h1IlD");

define("RUTA_PAGOS","http://localhost/pagospse/finalizar_pagos.php");
?>