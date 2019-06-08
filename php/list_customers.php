<?php
/**
 * Created by PhpStorm.
 * User: MKochanski
 * Date: 7/24/2018
 * Time: 3:07 PM
 */
require_once 'config.inc.php';

?>
<html>
<head>
    <title>Sample PHP Database Program</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Resident List</h2>
    <?php
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

	// Prepare SQL Statement
    $sql = "SELECT resident.FirstName, resident.LastName, resident.CheckInDate, resident.CheckOutDate, EmergencyContact.EmgCntFirstName, EmergencyContact.EmgCntLastName, EmergencyContact.EmgCntPhoneNo FROM EmergencyContact INNER JOIN resident ON EmergencyContact.EmgCntID = resident.EmgCntID;";
    $stmt = $conn->stmt_init();
    if (!$stmt->prepare($sql)) {
        echo "failed to prepare";
    }
    else {
		
		// Execute the Statement
        $stmt->execute();
		
		// Loop Through Result
        $stmt->bind_result($FirstName,$LastName, $CheckInDate, $CheckOutDate, $EmgCntFirstName, $EmgCntLastName, $EmgCntPhoneNo);

		echo "<p>        Name            check-in-date              check-out-date                 	EmgCntName	              EmgCntPhoneNo </p>"
        while ($stmt->fetch()) {
            echo "<p>". $FirstName . ' ' . $LastName . '  ' . $CheckInDate . '  ' . $CheckOutDate . '  ' . $EmgCntFirstName . '  ' . $EmgCntLastName . '  ' . $EmgCntPhoneNo ."</p>";
        }
    }

	// Close Connection
    $conn->close();

    ?>
</div>
</body>
</html>
