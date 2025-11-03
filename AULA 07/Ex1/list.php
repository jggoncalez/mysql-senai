<?php
$conn = new mysqli("localhost", "root", "senaisp", "livraria");
$result = $conn->query("SELECT * FROM usuarios");

echo "<h2>Usuários</h2>";
echo "<table border='1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Email</th><th>Ações</th></tr>";

while ($row = $result->fetch_assoc()) {
    echo "<tr>
    <td>{$row['id_usuario']}</td>
    <td>{$row['nome']}</td>
    <td>{$row['email']}</td>
    <td><a href='edit.php?id={$row['id_usuario']}'>Editar</a>
    <a href='delete.php?id={$row['id_usuario']}' onclick='return confirm (\"Tem certeza que deseja deletar este usuário?\");'>Deletar</a></td></tr>";
}

echo "</table>";
$conn->close();
?>

<a href="index.html"><button type="button">Página Inicial</button></a>