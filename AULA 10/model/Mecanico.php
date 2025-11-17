<?php

namespace Model;

class Mecanico {
    private $conn;
    private $table = 'MECANICOS';

    public $mecanicoID;
    public $mecanicoNome;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE - Criar novo mecânico
    public function create(){
        $query = "INSERT INTO " . $this->table . " SET mecanicoNome = :mecanicoNome";

        $stmt = $this->conn->prepare($query);

        $this->mecanicoNome = htmlspecialchars(strip_tags($this->mecanicoNome));

        $stmt->bindParam(':mecanicoNome', $this->mecanicoNome);
        
        return $stmt->execute();
    }
    
    // READ - Listar todos os mecânicos
    public function list(){
        $query = "SELECT * FROM " . $this->table . " ORDER BY mecanicoNome";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    // READ - Buscar por ID
    public function searchID() {
        $query = "SELECT * FROM " . $this->table . " WHERE mecanicoID = :mecanicoID LIMIT 1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':mecanicoID', $this->mecanicoID);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if($row) {
            $this->mecanicoNome = $row['mecanicoNome'];
            return true;
        }
        return false;
    }

    // UPDATE - Atualizar mecânico
    public function update() {
        $query = "UPDATE " . $this->table . " SET mecanicoNome = :mecanicoNome WHERE mecanicoID = :mecanicoID";

        $stmt = $this->conn->prepare($query);

        $this->mecanicoNome = htmlspecialchars(strip_tags($this->mecanicoNome));
        $this->mecanicoID = htmlspecialchars(strip_tags($this->mecanicoID));

        $stmt->bindParam(':mecanicoNome', $this->mecanicoNome);
        $stmt->bindParam(':mecanicoID', $this->mecanicoID);

        return $stmt->execute();
    }

    // DELETE - Deletar mecânico
    public function delete(){
        $query = "DELETE FROM " . $this->table . " WHERE mecanicoID = :mecanicoID";

        $stmt = $this->conn->prepare($query);

        $this->mecanicoID = htmlspecialchars(strip_tags($this->mecanicoID));

        $stmt->bindParam(':mecanicoID', $this->mecanicoID);

        return $stmt->execute();
    }
}

?>
