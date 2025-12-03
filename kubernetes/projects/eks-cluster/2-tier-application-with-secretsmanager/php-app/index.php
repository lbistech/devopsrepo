<?php
$servername = "mysql"; // MySQL service name in Kubernetes
$username = "root";
$password = "password"; // Same as in the Kubernetes Secret
$database = "testdb"; // Ensure this database is created in MySQL

// Set up MySQLi connection with explicit authentication for MySQL 8
$conn = new mysqli($servername, $username, $password, $database, 3306);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create a test table if it doesn't exist
$tableCreationQuery = "CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)";
$conn->query($tableCreationQuery);

// Insert test data
$conn->query("INSERT INTO users (name) VALUES ('John Doe')");
$conn->query("INSERT INTO users (name) VALUES ('Usman Ahmad')");

// Fetch and display data
$result = $conn->query("SELECT * FROM users");
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"]. " - Name: " . $row["name"]. "<br>";
    }
} else {
    echo "No records found.";
}

$conn->close();
?>