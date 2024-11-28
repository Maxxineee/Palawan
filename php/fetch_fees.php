<?php
include 'db_connection.php';

session_start();
$user_id = $_SESSION['user_id'];

$query = "SELECT fees.fee_name, fees.amount, transactions.status
          FROM transactions
          JOIN fees ON transactions.fee_id = fees.id
          WHERE transactions.user_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$fees = [];
while ($row = $result->fetch_assoc()) {
    $fees[] = $row;
}

header('Content-Type: application/json');
echo json_encode($fees);
?>
