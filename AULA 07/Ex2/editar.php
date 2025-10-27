<?php
include_once 'header.php';

$conn = new mysqli("localhost", "root", "senaisp", "biblioteca");

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM livro WHERE COD = $id");
$row = $result->fetch_assoc();
?>



<form action="atualizar.php" method="post">
    <input type="hidden" name="id" value="<?php echo $row['COD']; ?>">
    Título: <input type="text" name="inp_titulo" value="<?php echo $row['TITULO']; ?>"><br>
    Autor: <input type="text" name="inp_autor" value="<?php echo $row['AUTOR']; ?>"><br>
    Gênero: <input type="text" name="inp_genero" value="<?php echo $row['GENERO']; ?>"><br>
    Editora: <input type="text" name="inp_editora" value="<?php echo $row['EDITORA']; ?>"><br>
    Lançamento: <input type="text" name="inp_lancamento" value="<?php echo $row['LANCAMENTO']; ?>"><br>
    Status: <input type="text" name="inp_lstatus" value="<?php echo $row['LSTATUS']; ?>"><br>
    <input type="submit" value="Atualizar">
</form>