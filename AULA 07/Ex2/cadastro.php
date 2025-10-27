<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php include_once 'header.php' ?>
    <h1>Inserir Livros</h1>
    <form action="inserir.php" method="POST">
        <label>Título:</label>
        <input type="text" name="inp_titulo" required><br>
        <label>Autor:</label>
        <input type="text" name="inp_autor" required><br>
        <label>Gênero:</label>
        <input type="text" name="inp_genero" required><br>
        <label>Editora:</label>
        <input type="text" name="inp_editora" required><br>
        <label>Lançamento:</label>
        <input type="date" name="inp_lancamento" required><br>
        <label>Status:</label>
        <input type="text" name="inp_lstatus" required>
        <button type="submit">Inserir</button>
    </form>
</body>
</html>