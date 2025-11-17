<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php require_once 'include/header.php' ?>
    <main>
        <h1>Bem-vindo à Oficina Mecânica!</h1>

        <div class="dashboard">
            <div class="card">
                <h3>Renda total</h3>
                <p id="renda_val">0</p>
            </div>
            <div class="card">
                <h3>Total de funcionários</h3>
                <p id="func_val">0</p>
            </div>
            <div class="card">
                <h3>Clientes cadastrados</h3>
                <p id="cliente_val">0</p>
            </div>
            <div class="card">
                <h3>Peças</h3>
                <p id="pecas_val">0</p>
            </div>
        </div>

        <div class="container">
            <input type="button" value="Clientes" href="#">
            <input type="button" value="Veículos" href="#">
            <input type="button" value="Mecânicos" href="#">
            <input type="button" value="Ordem de Serviço" href="#">
        </div>
    </main>
    <?php require_once 'include/footer.php' ?>
</body>
</html>