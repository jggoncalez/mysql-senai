<?php

namespace Model;

class Cliente {
    private $conn;
    private $table = 'CLIENTES';
    public $clienteID;
    public $clienteNome;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE
    public function create(){
        $query = "INSERT INTO CLIENTES (CLIENTENOME) VALUES (:nome)";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':nome', $this->clienteNome);
        return $stmt->execute();
    }

    // LIST
    public function list(){
        $query = "SELECT * FROM CLIENTES ORDER BY CLIENTEID";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // GET BY ID
    public function getById($id){
        $query = "SELECT * FROM CLIENTES WHERE CLIENTEID = :id LIMIT 1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':id', $id);
        $stmt->execute();

        return $stmt;
    }

    // UPDATE
    public function update(){
        $query = "UPDATE CLIENTES 
                  SET CLIENTENOME = :nome 
                  WHERE CLIENTEID = :id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':nome', $this->clienteNome);
        $stmt->bindParam(':id', $this->clienteID);

        return $stmt->execute();
    }

    // DELETE
    public function delete(){
        $query = "DELETE FROM CLIENTES WHERE CLIENTEID = :id";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':id', $this->clienteID);

        return $stmt->execute();
    }
}

?>
