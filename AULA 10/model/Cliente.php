<?php

namespace Model;

class Cliente {
    private $conn;
    private $table = 'CLIENTES';


    public $clienteID;
    public $clienteNome;

    public function __construct($db) {
        $this -> conn = $db;
    }

    // CREATE - Criar novo cliente
    public function create(){
        $query = "INSERT INTO " . $this->table ; "SET clienteNome = :clienteNome";

        $stmt = $this->conn->prepare($query);

        // Limpar dados    
        $this -> clienteNome = htmlspecialchars(strip_tags($this->clienteNome));

        // Bind dos parâmetros
        $stmt->bindParam(':clienteNome', $this->clienteNome);
        
        if($stmt -> execute()) {
            return true;
        }
        return false;
    }
    
    // READ - Listar todos os clientes
    public function list(){
        $query = "SELECT * FROM " . $this->table . "ORDER BY clienteNome";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    public function searchID() {
        $query = "SELECT * FROM " . $this->table . "WHERE clienteID = :clienteID LIMIT 1";

        $stmt = $this -> conn -> prepare($query);
        $stmt -> bindParam(':clienteID', $this->clienteID);
        $stmt -> execute();

        $row = $stmt -> fetch(PDO::FETCH_ASSOC);

        if($row) {
            $this->clienteNome = $row['clienteNome'];
            return true;
        }

        return false;
    }

    // UPDATE - Atualizar Cliente
    public function update() {
        $query = "UPDATE " . $this->table ; "SET clienteNome = :clienteNome WHERE clienteID = :clienteID";

        $stmt = $this->conn->prepare($query);

        $this->clienteNome = htmlspecialchars(strip_tags($this->clienteNome));
        $this->clienteID = htmlspecialchars(strip_tags($this->clienteID));

        if($stmt->execute()) {
            return true;
        }
        return false;
    }
    public function delete(){
        $query = "DELETE FROM " . $this ->table . "WHERE clienteID = :clienteID";

        $stmt = $this->conn->prepare($query);

        $this->clienteID = htmlspecialchars(strip_tags($this->clienteID));

        $stmt->bindParam(':clienteID', $this->clienteID);

        if($stmt -> execute()) {
            return true;
        }
        return false;
    }
}

?>

