<?php
$conn = new mysqli("localhost", "root", "senaisp", "livraria");

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM usuarios WHERE id_usuario = $id");
$row = $result->fetch_assoc();
?>

<form action="atualizar.php" method="post">
    <input type="hidden" name="id" value="<?php echo $row['id_usuario']; ?>">
    Nome: <input type="text" name="nome" value="<?php echo $row['nome']; ?>">
    Email: <input type="email" name="email" value="<?php echo $row['email']; ?>">
    <input type="submit" value="Atualizar">
</form>