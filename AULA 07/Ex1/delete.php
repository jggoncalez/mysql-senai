<?php
$conn = new mysqli("localhost", "root", "senaisp", "livraria");
if ($conn->connect_error){
    die("Erro de conexão: " . $conn->connect_error);
}

$id = $_GET['id'];

$stmt = $conn->prepare("DELETE FROM usuarios WHERE id_usuario = ?");

$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Usuário deletado com sucesso!";
} else {
    echo "Erro ao deletar " . $stmt->error;
}

echo "<br><a href='list.php'>Voltar para a lista </a>";

$stmt -> close();
$conn -> close();

?>