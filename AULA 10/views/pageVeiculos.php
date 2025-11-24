<?php

require_once '../Config/Database.php';
require_once '../model/Veiculo.php';

use Model\Veiculo;
use config\Database;

$db = Database::getInstance();
$conn = $db->getConnection();

$vei = new Veiculo($conn);
$stmt = $vei->list();
$dados = $stmt->fetchAll(PDO::FETCH_ASSOC);

if($_SERVER['REQUEST_METHOD'] == "POST"){
    $acao = $_POST['acao'] ?? null;

    // Criar veículo
    if ($acao == 'criar'){
        $vei->veiculoNome = $_POST['veiculoNome'];
        $vei->veiculoPlaca = $_POST['veiculoPlaca'];
        $vei->veiculoTipo = $_POST['veiculoTipo'];
        $vei->clienteID = $_POST['clienteID'];
        $vei->create();
        header("Location: pageVeiculos.php");
        exit;
    }

    // Deletar veículo
    if ($acao == 'deletar'){
        $vei->veiculoID = $_POST['veiculoID'];
        $vei->delete();
        header("Location: pageVeiculos.php");
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
    <title>Veículos</title>
</head>
<body>
    <?php include_once 'include/header.php' ?>

    <form action="" method="post">
        <label>Nome: </label>
        <input name="veiculoNome" type="text" required>
        
        <label>Placa: </label>
        <input name="veiculoPlaca" type="text" required>
        
        <label>Tipo: </label>
        <input name="veiculoTipo" type="text" required>
        
        <label>Cliente ID: </label>
        <input name="clienteID" type="number" required>
        
        <button type="submit" name="acao" value="criar">Enviar</button>
    </form>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Placa</th>
                <th>Tipo</th>
                <th>Cliente ID</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($dados as $dt) {
                echo "<tr>";
                echo "<td>{$dt['VEICULOID']}</td>";
                echo "<td>{$dt['VEICULONOME']}</td>";
                echo "<td>{$dt['VEICULOPLACA']}</td>";
                echo "<td>{$dt['VEICULOTIPO']}</td>";
                echo "<td>{$dt['CLIENTEID']}</td>";
                echo "<td>
                        <a href='editVeiculos.php?id={$dt['VEICULOID']}' class='btn-editar'>Editar</a>
                        <form action=\"\" method=\"POST\" style=\"display:inline;\">
                            <input type=\"hidden\" name=\"acao\" value=\"deletar\">
                            <input type=\"hidden\" name=\"veiculoID\" value=\"{$dt['VEICULOID']}\">
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
