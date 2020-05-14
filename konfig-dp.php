<?php
$host = "localhost";
$databas = "pontus";
$användare = "Pontus";
$lösenord = "x6WwKh3mrHzKTZZS";

// Anslut till databasen
$conn = new mysqli($host, $användare, $lösenord, $databas);

// Om någonting går fel. Avsluta och skriv ett felmeddelandet
if ($conn->connect_error) {
    die("Kunde inte ansluta till databasen: " . $conn->connect_error);
} else {
  //echo "Kunde ansluta till databasen $databas på $host";
}