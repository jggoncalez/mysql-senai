<?php
require_once '../Config/Database.php';
require_once '../model/Cliente.php';

use Model\Cliente;
use config\Database;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$db = Database::getInstance()->getConnection();

$cl = new Cliente($db);

// pegar ID via GET
$clienteId = $_GET['id'] ?? null;


if ($clienteId) {
    $stmt = $cl->getById($clienteId);
    $cliente = $stmt->fetch(PDO::FETCH_ASSOC);
}

if ($_SERVER['REQUEST_METHOD'] == "POST"){

    if ($_POST['acao'] === 'editar') {

        $cl->clienteID = $_POST['clienteId'];
        $cl->clienteNome = $_POST['clienteNome'];

        $cl->update();

        header("Location: pageClientes.php");
        exit;
    }
}
?>
<!DOCTYPE html>
<link rel="stylesheet" href="style/style.css">
<html>
<body>

<form method="post">
    <input type="hidden" name="clienteId" value="<?= $cliente['CLIENTEID'] ?>">

    <label>Nome:</label>
    <input name="clienteNome" type="text" value="<?= $cliente['CLIENTENOME'] ?>">

    <button type="submit" name="acao" value="editar">Salvar</button>
</form>

</body>
</html>
