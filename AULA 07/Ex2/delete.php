<?php
include_once 'header.php';

$conn = new mysqli("localhost", "root", "senaisp", "biblioteca");

$id = $_GET['id'];
$stmt = $conn->prepare("DELETE FROM livro WHERE COD = ?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Usuário deletado com sucesso!";
} else {
    echo "Erro ao deletar " . $stmt->error;
}

echo "<br><a href='list.php'>Voltar para a lista </a>";

$stmt->close();
$conn->close();
