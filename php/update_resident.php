<?php
/**
 * Created by PhpStorm.
 * User: MKochanski
 * Date: 7/24/2018
 * Time: 3:07 PM
 */
require_once 'config.inc.php';
// Get Customer Number
$id = $_GET['StudentID'];
if ($id === "") {
    header('location: list_patient.php');
    exit();
}
if ($id === false) {
    header('location: list_patient.php');
    exit();
}
if ($id === null) {
    header('location: list_patient.php');
    exit();
}
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
    <h2>Update Resident</h2>
    <?php

    // Create connection
    $conn = new mysqli($servername, $username, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Comes here if form is accepted
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $LastName = $_POST['LastName'];
        //$FirstName = $_POST['FirstName'];
        if ($LastName === null)
            echo "<div><i>Specify a new last name</i></div>";
        else if ($LastName === false)
            echo "<div><i>Specify a new last name</i></div>";
        else if (trim($LastName) === "")
            echo "<div><i>Specify a new last name</i></div>";
        else {
            /* perform update */
            $sql = "UPDATE resident SET LastName = ? WHERE StudentID = ?";
            $stmt = $conn->stmt_init();
            if (!$stmt->prepare($sql)) {
                echo "failed to prepare";
            } else {
                $stmt->bind_param('ss', $LastName, $id);
                $stmt->execute();
                $conn->commit();
            }
        }
    }
	
	function build_table($array){
		// start table
		$html = '<table border ="1">';
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

    /* Refresh the Data */
    $sql = "SELECT resident.StudentID resident.FirstName, resident.LastName, resident.CheckInDate, resident.CheckOutDate FROM resident ORDER BY LastName";
    $stmt = $conn->stmt_init();
    if (!$stmt->prepare($sql)) {
        echo "failed to prepare";
    }
    else {
        $stmt->bind_param('s',$id);
        $stmt->execute();
        $stmt->bind_result($StudentID,$FirstName,$LastName, $CheckInDate, $CheckOutDate);
        ?>
        
        <!--the form to accept the new info-->
        <form method="post">
            <input type="hidden" name="id" value="<?= $id ?>">
        <?php
        while ($stmt->fetch()) {
            echo '<a href="list_residents.php?id='.$StudentID.'"> '.$FirstName.' '.$LastName.'</a> <br> 
            Status: Check-in-date'. $CheckInDate . ' ' .$CheckOutDate;
			//$arrayHeading1 = array(
			//	array('FirstName'=>$FirstName,'LastName'=>$LastName,'Check-in-date'=>$CheckInDate,'Check-out-date'=>$CheckOutDate)
			//);
			//echo build_table($arrayHeading1);
        }
    ?><br><br>
            
            New LastName: <input type="text" name="LastName">
            <button type="submit">Update</button> <br>
            <!--
            New FirstName: <input type="text" name="FirstName">
            <button type="submit">Update</button>
            -->
        </form>  
        
        
    <?php
    }

    $conn->close();

    ?>
</>
</body>
</html>
