<?php 
$_COOKIE['user_id'] = ""; 
$_COOKIE['password'] = ""; 

unset($_COOKIE['user_id']);
unset($_COOKIE['password']);
$res = setcookie('user_id', '', time() - 3600);
$res = setcookie('password', '', time() - 3600);

?>

<script>  document.location.href="../";   </script> 