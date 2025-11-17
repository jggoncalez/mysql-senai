<?php

namespace Model;

class Veiculo {
    private $conn;
    private $table = 'VEICULOS';

    public $veiculoID;
    public $veiculoNome;
    public $veiculoTipo;
    public $veiculoPlaca;
    public $clienteID;

    public function __construct($db) {
        $this->conn = $db;
    }

    // CREATE
    public function create() {
        $query = "INSERT INTO " . $this->table . " (VEICULONOME, VEICULOTIPO, VEICULOPLACA, CLIENTEID)
                  VALUES (:veiculoNome, :veiculoTipo, :veiculoPlaca, :clienteID)";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->veiculoNome  = htmlspecialchars(strip_tags($this->veiculoNome));
        $this->veiculoTipo  = htmlspecialchars(strip_tags($this->veiculoTipo));
        $this->veiculoPlaca = htmlspecialchars(strip_tags($this->veiculoPlaca));
        $this->clienteID    = htmlspecialchars(strip_tags($this->clienteID));

        // Bind
        $stmt->bindParam(':veiculoNome',  $this->veiculoNome);
        $stmt->bindParam(':veiculoTipo',  $this->veiculoTipo);
        $stmt->bindParam(':veiculoPlaca', $this->veiculoPlaca);
        $stmt->bindParam(':clienteID',    $this->clienteID);

        return $stmt->execute();
    }

    // READ - listar todos
    public function list() {
        $query = "SELECT * FROM " . $this->table . " ORDER BY VEICULONOME";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // READ - buscar por ID
    public function searchID() {
        $query = "SELECT * FROM " . $this->table . " WHERE VEICULOID = :veiculoID LIMIT 1";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':veiculoID', $this->veiculoID);
        $stmt->execute();

        $row = $stmt->fetch(\PDO::FETCH_ASSOC);
        if ($row) {
            $this->veiculoNome  = $row['VEICULONOME'];
            $this->veiculoTipo  = $row['VEICULOTIPO'];
            $this->veiculoPlaca = $row['VEICULOPLACA'];
            $this->clienteID    = $row['CLIENTEID'];
            return true;
        }
        return false;
    }

    // UPDATE
    public function update() {
        $query = "UPDATE " . $this->table . "
                  SET VEICULONOME = :veiculoNome,
                      VEICULOTIPO = :veiculoTipo,
                      VEICULOPLACA = :veiculoPlaca,
                      CLIENTEID = :clienteID
                  WHERE VEICULOID = :veiculoID";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->veiculoNome  = htmlspecialchars(strip_tags($this->veiculoNome));
        $this->veiculoTipo  = htmlspecialchars(strip_tags($this->veiculoTipo));
        $this->veiculoPlaca = htmlspecialchars(strip_tags($this->veiculoPlaca));
        $this->clienteID    = htmlspecialchars(strip_tags($this->clienteID));
        $this->veiculoID    = htmlspecialchars(strip_tags($this->veiculoID));

        // Bind
        $stmt->bindParam(':veiculoNome',  $this->veiculoNome);
        $stmt->bindParam(':veiculoTipo',  $this->veiculoTipo);
        $stmt->bindParam(':veiculoPlaca', $this->veiculoPlaca);
        $stmt->bindParam(':clienteID',    $this->clienteID);
        $stmt->bindParam(':veiculoID',    $this->veiculoID);

        return $stmt->execute();
    }

    // DELETE
    public function delete() {
        $query = "DELETE FROM " . $this->table . " WHERE VEICULOID = :veiculoID";
        $stmt = $this->conn->prepare($query);

        $this->veiculoID = htmlspecialchars(strip_tags($this->veiculoID));
        $stmt->bindParam(':veiculoID', $this->veiculoID);

        return $stmt->execute();
    }
}
?>
