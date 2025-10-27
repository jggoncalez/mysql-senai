<?php
include_once 'header.php';

$conn = new mysqli("localhost", "root", "senaisp", "biblioteca");

$book_titulo = $_POST['inp_titulo'];
$book_autor = $_POST['inp_autor'];
$book_genero = $_POST['inp_genero'];
$book_editora = $_POST['inp_editora'];
$book_lancamento = $_POST['inp_lancamento'];
$book_lstatus = $_POST['inp_lstatus'];
$id = $_POST['id'];

$sql = "UPDATE livro SET TITULO='$book_titulo', AUTOR='$book_autor', GENERO='$book_genero', EDITORA='$book_editora', LANCAMENTO='$book_lancamento', LSTATUS='$book_lstatus' WHERE COD=$id";

if ($conn->query($sql) === TRUE) {
    echo "Dados atualizados com sucesso!";
    echo "<br><a href='index.html'>Voltar</a>";
} else {
    echo "Erro: " . $conn->error;
}

$conn->close();
?>