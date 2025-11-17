<?php

namespace Model;

class Ordens_Servico {
    private $conn;
    private $table = 'ORDENS_SERVICO';

    public $ordemID;
    public $veiculoID;
    public $mecanicoID;
    public $ordemData;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE
    public function create(){
        $query = "INSERT INTO " . $this->table . " SET veiculoID = :veiculoID, mecanicoID = :mecanicoID, ordemData = :ordemData";

        $stmt = $this->conn->prepare($query);

        $this->veiculoID = htmlspecialchars(strip_tags($this->veiculoID));
        $this->mecanicoID = htmlspecialchars(strip_tags($this->mecanicoID));
        $this->ordemData = htmlspecialchars(strip_tags($this->ordemData));

        $stmt->bindParam(':veiculoID', $this->veiculoID);
        $stmt->bindParam(':mecanicoID', $this->mecanicoID);
        $stmt->bindParam(':ordemData', $this->ordemData);

        return $stmt->execute();
    }

    // READ
    public function list(){
        $query = "SELECT * FROM " . $this->table . " ORDER BY ordemData DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    // SEARCH BY ID
    public function searchID() {
        $query = "SELECT * FROM " . $this->table . " WHERE ordemID = :ordemID LIMIT 1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':ordemID', $this->ordemID);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if($row) {
            $this->veiculoID = $row['veiculoID'];
            $this->mecanicoID = $row['mecanicoID'];
            $this->ordemData = $row['ordemData'];
            return true;
        }
        return false;
    }

    // UPDATE
    public function update() {
        $query = "UPDATE " . $this->table . " SET veiculoID = :veiculoID, mecanicoID = :mecanicoID, ordemData = :ordemData WHERE ordemID = :ordemID";

        $stmt = $this->conn->prepare($query);

        $this->veiculoID = htmlspecialchars(strip_tags($this->veiculoID));
        $this->mecanicoID = htmlspecialchars(strip_tags($this->mecanicoID));
        $this->ordemData = htmlspecialchars(strip_tags($this->ordemData));
        $this->ordemID = htmlspecialchars(strip_tags($this->ordemID));

        $stmt->bindParam(':veiculoID', $this->veiculoID);
        $stmt->bindParam(':mecanicoID', $this->mecanicoID);
        $stmt->bindParam(':ordemData', $this->ordemData);
        $stmt->bindParam(':ordemID', $this->ordemID);

        return $stmt->execute();
    }

    // DELETE
    public function delete(){
        $query = "DELETE FROM " . $this->table . " WHERE ordemID = :ordemID";

        $stmt = $this->conn->prepare($query);

        $this->ordemID = htmlspecialchars(strip_tags($this->ordemID));
        $stmt->bindParam(':ordemID', $this->ordemID);

        return $stmt->execute();
    }
}

?>
