<?php
include 'db_connection.php';

session_start();
$user_id = $_SESSION['user_id'];
$fee_id = $_POST['fee_id'];
$amount = $_POST['amount'];

// Simulate GCash payment (API integration would replace this)
$reference_no = uniqid('GCASH_');

// Update transaction status
$query = "UPDATE transactions
          SET status = 'paid', reference_no = ?
          WHERE user_id = ? AND fee_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("sii", $reference_no, $user_id, $fee_id);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo "Payment successful!";
} else {
    echo "Payment failed.";
}
?>
