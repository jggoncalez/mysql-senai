<?php

namespace Model;

class OS_Pecas {
    private $conn;
    private $table = 'ORDEM_PECAS';

    public $ordemID;
    public $pecaID;
    public $quantidade;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE
    public function create() {
        $query = "INSERT INTO " . $this->table . " SET ordemID = :ordemID, pecaID = :pecaID, quantidade = :quantidade";

        $stmt = $this->conn->prepare($query);

        $this->ordemID = htmlspecialchars(strip_tags($this->ordemID));
        $this->pecaID = htmlspecialchars(strip_tags($this->pecaID));
        $this->quantidade = htmlspecialchars(strip_tags($this->quantidade));

        $stmt->bindParam(':ordemID', $this->ordemID);
        $stmt->bindParam(':pecaID', $this->pecaID);
        $stmt->bindParam(':quantidade', $this->quantidade);

        return $stmt->execute();
    }

    // READ
    public function list() {
        $query = "SELECT * FROM " . $this->table . " ORDER BY ordemID";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // UPDATE
    public function update() {
        $query = "UPDATE " . $this->table . " SET quantidade = :quantidade WHERE ordemID = :ordemID AND pecaID = :pecaID";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':ordemID', $this->ordemID);
        $stmt->bindParam(':pecaID', $this->pecaID);
        $stmt->bindParam(':quantidade', $this->quantidade);

        return $stmt->execute();
    }

    // DELETE
    public function delete() {
        $query = "DELETE FROM " . $this->table . " WHERE ordemID = :ordemID AND pecaID = :pecaID";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':ordemID', $this->ordemID);
        $stmt->bindParam(':pecaID', $this->pecaID);

        return $stmt->execute();
    }
}

?>
