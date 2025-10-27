<?php
$book_titulo = $_POST['inp_titulo'];
$book_autor = $_POST['inp_autor'];
$book_genero = $_POST['inp_genero'];
$book_editora = $_POST['inp_editora'];
$book_lancamento = $_POST['inp_lancamento'];
$book_lstatus = $_POST['inp_lstatus'];

$conn = new mysqli("localhost", "root", "senaisp", "biblioteca");

if ($conn->connect_error){
    die("Erro de conexão: " . $conn->connect_error);
}

$sql = "INSERT INTO livro (TITULO, AUTOR, GENERO, EDITORA, LANCAMENTO, LSTATUS) VALUES ('$book_titulo', '$book_autor', '$book_genero', '$book_editora', '$book_lancamento', '$book_lstatus')";
if ($conn->query($sql) === TRUE) {
    echo "Dados salvos com sucesso!";
    echo "<a href='index.html'>Voltar</a>";
} else {
    echo "Erro: " . $conn->error;
}


// header("Location: index.html);
exit;

$conn->close();

?>