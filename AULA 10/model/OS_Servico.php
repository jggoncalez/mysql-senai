<?php

namespace Model;

class OS_Servico {
    private $conn;
    private $table = 'ORDEM_SERVICOS';

    public $ordemID;
    public $servicoID;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE - Associar serviço a ordem
    public function create(){
        $query = "INSERT INTO " . $this->table . " SET ordemID = :ordemID, servicoID = :servicoID";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':ordemID', $this->ordemID);
        $stmt->bindParam(':servicoID', $this->servicoID);
        
        return $stmt->execute();
    }
    
    // READ - Listar serviços de uma ordem
    public function listByOrdem(){
        $query = "SELECT * FROM " . $this->table . " WHERE ordemID = :ordemID";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':ordemID', $this->ordemID);
        $stmt->execute();

        return $stmt;
    }

    // DELETE - Remover serviço da ordem
    public function delete(){
        $query = "DELETE FROM " . $this->table . " WHERE ordemID = :ordemID AND servicoID = :servicoID";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':ordemID', $this->ordemID);
        $stmt->bindParam(':servicoID', $this->servicoID);

        return $stmt->execute();
    }
}
?>
