<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

$servername = "localhost";
$username = "root";
$password = "MySQLloop123";
$dbname = "metro3";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

$username = $_POST['name'];
$pass = $_POST['password'];

$sql = "SELECT * FROM Station WHERE Name = $username OR Station_ID = $pass";

if($conn->query($sql)){
    echo 'success';
}
