<?php

require_once '../Config/Database.php';
require_once '../model/Cliente.php';

use Model\Cliente;
use config\Database;

$db = Database::getInstance();
$conn = $db->getConnection();

$cl = new Cliente($conn);
$stmt = $cl->list();
$dados = $stmt->fetchAll(PDO::FETCH_ASSOC);

if($_SERVER['REQUEST_METHOD'] == "POST"){
    $acao = $_POST['acao'] ?? null;

    // Criar cliente
    if ($acao == 'criar'){
        $cl->clienteNome = $_POST['clienteNome'];
        $cl->create();
        header("Location: pageClientes.php");
        exit;
    }

    // Deletar cliente
    if ($acao == 'deletar'){
        $cl->clienteID = $_POST['clienteID'];
        $cl->delete();
        header("Location: pageClientes.php");
        exit;
    }
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/style.css">
    <title>Document</title>
</head>
<body>
    <?php include_once 'include/header.php' ?>

    <form action="" method="post">
        <label >Nome: </label>
        <input name="clienteNome" type="text">
        <button type="submit" name="acao" value="criar">Enviar</button>
    </form>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
            </tr>
        </thead>
        <tbody>
            
            <?php
            foreach ($dados as $dt) {
                echo "<tr>";
                echo "<td>{$dt['CLIENTEID']}</td>";
                echo "<td>{$dt['CLIENTENOME']}</td>";
                echo "<td>
                        <a href='editClientes.php?id={$dt['CLIENTEID']}&nome={$dt['CLIENTENOME']}' class='btn-editar'>Editar</a>
                        <form action=\"\" method=\"POST\" style=\"display:inline;\">
                            <input type=\"hidden\" name=\"acao\" value=\"deletar\">
                            <input type=\"hidden\" name=\"clienteID\" value=\"{$dt['CLIENTEID']}\">
                            <button type=\"submit\" class=\"btn-deletar\">Deletar</button>
                        </form>
                      </td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>