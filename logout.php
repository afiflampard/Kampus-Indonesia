<?php 
session_start();
require_once("a_con.php");

$_SESSION['user_id'] = ""; 
$_SESSION['password'] = "" ; 

?>

<script>  document.location.href="<?php echo($site) ;  ?>";   </script> 