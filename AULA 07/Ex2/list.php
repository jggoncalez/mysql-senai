<?php
include_once 'header.php';

$conn = new mysqli("localhost", "root", "senaisp", "biblioteca");

$result = $conn->query("SELECT * FROM livro");

echo "<h2>Catálogo</h2>";
echo "<table border='1'>";
echo "<tr><th>Nome</th><th>Autor</th><th>Gênero</th><th>Editora</th><th>Data de Lançamento</th><th>Status</th></tr>";

while ($row = $result->fetch_assoc()) {
    echo "<tr>
    <td>{$row['TITULO']}</td>
    <td>{$row['AUTOR']}</td>
    <td>{$row['GENERO']}</td>
    <td>{$row['EDITORA']}</td>
    <td>{$row['LANCAMENTO']}</td>
    <td>{$row['LSTATUS']}</td>
    <td><a href='editar.php?id={$row['COD']}'>Editar</a></td></tr>";
}

echo "</table>";
$conn->close();
?>