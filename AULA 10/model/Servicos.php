<?php

namespace Model;

class Servicos {
    private $conn;
    private $table = 'SERVICOS';

    public $servicoID;
    public $servicoNome;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE
    public function create(){
        $query = "INSERT INTO " . $this->table . " SET servicoNome = :servicoNome";

        $stmt = $this->conn->prepare($query);
        $this->servicoNome = htmlspecialchars(strip_tags($this->servicoNome));
        $stmt->bindParam(':servicoNome', $this->servicoNome);
        
        return $stmt->execute();
    }
    
    // READ
    public function list(){
        $query = "SELECT * FROM " . $this->table . " ORDER BY servicoNome";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function searchID() {
        $query = "SELECT * FROM " . $this->table . " WHERE servicoID = :servicoID LIMIT 1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':servicoID', $this->servicoID);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if($row) {
            $this->servicoNome = $row['servicoNome'];
            return true;
        }
        return false;
    }

    // UPDATE
    public function update() {
        $query = "UPDATE " . $this->table . " SET servicoNome = :servicoNome WHERE servicoID = :servicoID";
        $stmt = $this->conn->prepare($query);

        $this->servicoNome = htmlspecialchars(strip_tags($this->servicoNome));
        $this->servicoID = htmlspecialchars(strip_tags($this->servicoID));

        $stmt->bindParam(':servicoNome', $this->servicoNome);
        $stmt->bindParam(':servicoID', $this->servicoID);

        return $stmt->execute();
    }

    // DELETE
    public function delete(){
        $query = "DELETE FROM " . $this->table . " WHERE servicoID = :servicoID";
        $stmt = $this->conn->prepare($query);
        $this->servicoID = htmlspecialchars(strip_tags($this->servicoID));
        $stmt->bindParam(':servicoID', $this->servicoID);
        return $stmt->execute();
    }
}
?>
