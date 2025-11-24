<?php
require_once '../Config/Database.php';
require_once '../model/Veiculo.php';

use Model\Veiculo;
use config\Database;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Conexão
$db = Database::getInstance()->getConnection();
$veiculo = new Veiculo($db);

// Captura ID da URL
$veiculo_ID = $_GET['id'] ?? null;

// Inicializa dados do veículo
$vData = null;

// Busca veículo no banco
if ($veiculo_ID) {
    $stmt = $veiculo->getById($veiculo_ID);
    $vData = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$vData) {
        die("Veículo não encontrado! ID: $veiculo_ID");
    }
} else {
    die("ID do veículo não informado na URL!");
}

// Atualizar veículo
if ($_SERVER['REQUEST_METHOD'] === "POST" && ($_POST['acao'] ?? '') === 'editar') {
    $veiculo->veiculo_ID = $_POST['veiculoID'];
    $veiculo->veiculoNome = $_POST['veiculoNome'];
    $veiculo->veiculoTipo = $_POST['veiculoTipo'];
    $veiculo->veiculoPlaca = $_POST['veiculoPlaca'];
    $veiculo->clienteID = $_POST['clienteId'];

    if ($veiculo->update()) {
        header("Location: pageVeiculos.php");
        exit;
    } else {
        echo "Erro ao atualizar veículo!";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Veículo</title>
</head>
<link rel="stylesheet" href="style/style.css">
<body>

<h2>Editar Veículo</h2>

<form method="post">
    <input type="hidden" name="veiculoID" value="<?= $vData['VEICULOID'] ?>">
    <input type="hidden" name="clienteID" value="<?= $vData['CLIENTEID'] ?>">
    <input type="hidden" name="acao" value="editar">

    <label>Nome:</label>
    <input name="veiculoNome" type="text" value="<?= htmlspecialchars($vData['VEICULONOME']) ?>" required><br><br>

    <label>Tipo:</label>
    <input name="veiculoTipo" type="text" value="<?= htmlspecialchars($vData['VEICULOTIPO']) ?>" required><br><br>

    <label>Placa:</label>
    <input name="veiculoPlaca" type="text" value="<?= htmlspecialchars($vData['VEICULOPLACA']) ?>" required><br><br>

    <button type="submit">Salvar</button>
</form>

</body>
</html>
