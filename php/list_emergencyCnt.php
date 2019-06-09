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
    <title>Room Condition Report</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Emergency Contact List</h2>
    <?php
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
	
	function build_table($array){
		// start table
		$html = '<table border=1>';
		// header row
		$html .= '<tr>';
		foreach($array[0] as $key=>$value){	
			$html .= '<th>' . htmlspecialchars($key) . '</th>';
        }
		$html .= '</tr>';

		// data rows
		foreach( $array as $key=>$value){
			$html .= '<tr>';
			foreach($value as $key2=>$value2){
				$html .= '<td>' . htmlspecialchars($value2) . '</td>';
			}
			$html .= '</tr>';
		}

		// finish table and return it
		$html .= '</table>';
		return $html;
	}

	
	// Prepare SQL Statement
	$sql = "SELECT EmgCntFirstName, EmgCntLastName, EmgCntPhoneNo FROM EmergencyContact";
    $stmt = $conn->stmt_init();
	
    if (!$stmt->prepare($sql)) {
        echo "failed to prepare";
    }
    else {
		
		// Execute the Statement
        $stmt->execute();
		
		// Loop Through Result
        $stmt->bind_result($EmgCntFirstName,$EmgCntLastName, $EmgCntPhoneNo);

        while ($stmt->fetch()) {
			$arrayHeading1 = array(
				array('EmgCntFirstName'=>$EmgCntFirstName,'EmgCntLastName'=>$EmgCntLastName,'EmgCntPhoneNo'=>$EmgCntPhoneNo)
			);
			echo build_table($arrayHeading1);
        }
    }

	// Close Connection
    $conn->close();

    ?>
</div>
</body>
</html>
