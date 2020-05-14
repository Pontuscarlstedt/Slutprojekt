<?php
include_once "./konfig-dp.php";
//Ta emot POST data

$namn = filter_input(INPUT_POST, "namn", FILTER_SANITIZE_STRING);

if ($namn) {
    echo "Mottaget $namn";

    //Spara namnet i tabellen på databasen
    $sql = "INSERT INTO pong SET namn='$namn'";
    $result = $conn->query($sql);

    if (!$result) {
        die("Något blev fel med SQL: $conn->query");
    } else {
        echo "Namnet har lagrats";
    }
    
} else {
    echo "Något blev fel";
    
}