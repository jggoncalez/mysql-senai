<?php

namespace Model;

class Peca {
    private $conn;
    private $table = 'PECAS';

    public $pecaID;
    public $pecaNome;
    public $pecaQtt;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE
    public function create() {
        $query = "INSERT INTO " . $this->table . " (PECANOME, PECAQTT) VALUES (:pecaNome, :pecaQtt)";

        $stmt = $this->conn->prepare($query);

        // limpar / sanitizar
        $this->pecaNome = htmlspecialchars(strip_tags($this->pecaNome));
        $this->pecaQtt  = (int) $this->pecaQtt;

        // bind
        $stmt->bindParam(':pecaNome', $this->pecaNome);
        $stmt->bindParam(':pecaQtt', $this->pecaQtt, \PDO::PARAM_INT);

        return $stmt->execute();
    }

    // READ - listar todos
    public function list() {
        $query = "SELECT * FROM " . $this->table . " ORDER BY PECANOME";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    // READ - por ID
    public function searchID() {
        $query = "SELECT * FROM " . $this->table . " WHERE PECAID = :pecaID LIMIT 1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':pecaID', $this->pecaID, \PDO::PARAM_INT);
        $stmt->execute();

        $row = $stmt->fetch(\PDO::FETCH_ASSOC);
        if ($row) {
            $this->pecaNome = $row['PECANOME'] ?? null;
            $this->pecaQtt  = isset($row['PECAQTT']) ? (int)$row['PECAQTT'] : null;
            return true;
        }
        return false;
    }

    // UPDATE
    public function update() {
        $query = "UPDATE " . $this->table . " SET PECANOME = :pecaNome, PECAQTT = :pecaQtt WHERE PECAID = :pecaID";

        $stmt = $this->conn->prepare($query);

        $this->pecaNome = htmlspecialchars(strip_tags($this->pecaNome));
        $this->pecaQtt  = (int) $this->pecaQtt;
        $this->pecaID   = (int) $this->pecaID;

        $stmt->bindParam(':pecaNome', $this->pecaNome);
        $stmt->bindParam(':pecaQtt', $this->pecaQtt, \PDO::PARAM_INT);
        $stmt->bindParam(':pecaID', $this->pecaID, \PDO::PARAM_INT);

        return $stmt->execute();
    }

    // DELETE
    public function delete() {
        $query = "DELETE FROM " . $this->table . " WHERE PECAID = :pecaID";

        $stmt = $this->conn->prepare($query);

        $this->pecaID = (int) $this->pecaID;
        $stmt->bindParam(':pecaID', $this->pecaID, \PDO::PARAM_INT);

        return $stmt->execute();
    }
}

?>
