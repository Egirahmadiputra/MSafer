<?php
header("Access-Control-Allow-Origin: *");
include 'config.php';

$query = mysqli_query($koneksi,"SELECT * FROM balance");

$result = array();

while($data = mysqli_fetch_assoc($query)){
	$result[]=$data;
}

echo json_encode($result);

?>