<?php
include 'db_connection.php';

session_start();
if ($_SESSION['role'] !== 'admin') {
    header("Location: ../login.html");
    exit();
}

// Fetch all transactions
$query = "SELECT users.full_name, users.student_number, fees.fee_name, transactions.amount, transactions.status
          FROM transactions
          JOIN users ON transactions.user_id = users.id
          JOIN fees ON transactions.fee_id = fees.id";
$result = $conn->query($query);

$transactions = [];
while ($row = $result->fetch_assoc()) {
    $transactions[] = $row;
}

// Send data to frontend
header('Content-Type: application/json');
echo json_encode($transactions);
?>
