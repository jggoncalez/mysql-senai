<?php
// conexão com o BD
$mysqli = mysqli_connect('localhost', 'root', 'senaisp', 'CRUD');

// buscar valores no BD
$columns = array('TITULO','DESCRICAO','CARGA_HORARIO');

// Trazer conteúdo caso exista informações e dados do BD
$column = isset($_GET['column']) && in_array($_GET['column'], $columns) ? $_GET['column'] : $columns[0];

// Trazer os dados em ordem crescente e decrescente
$sort_order = isset($_GET['order']) && strtolower($_GET['order']) == 'desc' ? 'DESC' : 'ASC';

// Verificar dados atualizados do BD
if ($result = $mysqli->query('SELECT * FROM CURSOS ORDER BY ' .  $column . ' ' . $sort_order)) {
	// Variaveis para a estrutura da tabela
	$up_or_down = str_replace(array('ASC','DESC'), array('up','down'), $sort_order); 
	$asc_or_desc = $sort_order == 'ASC' ? 'desc' : 'asc';
	$add_class = ' class="highlight"';
	?>
	<!DOCTYPE html>
	<html>
		<head>
			<title>Banco de Dados - CRUD</title>
			<meta charset="utf-8">
			
			<style>
			html {
				font-family: Tahoma, Geneva, sans-serif;
				padding: 10px;
			}
			table {
				border-collapse: collapse;
				width: 500px;
			}
			th {
				background-color: #54585d;
				border: 1px solid #54585d;
			}
			th:hover {
				background-color: #64686e;
			}
			th a {
				display: block;
				text-decoration:none;
				padding: 10px;
				color: #ffffff;
				font-weight: bold;
				font-size: 13px;
			}
			th a i {
				margin-left: 5px;
				color: rgba(255,255,255,0.4);
			}
			td {
				padding: 10px;
				color: #636363;
				border: 1px solid #dddfe1;
			}
			tr {
				background-color: #ffffff;
			}
			tr .highlight {
				background-color: #f9fafb;
			}
			</style>
		</head>
		<body>
			<table>
				<tr>
					<th><a href="index.php?column=TITULO&order=<?php echo $asc_or_desc; ?>">Titulo<i class="fas fa-sort<?php echo $column == 'TITULO' ? '-' . $up_or_down : ''; ?>"></i></a></th>
					<th><a href="index.php?column=DESCRICAO&order=<?php echo $asc_or_desc; ?>">DESCRIÇÃO<i class="fas fa-sort<?php echo $column == 'DESCRICAO' ? '-' . $up_or_down : ''; ?>"></i></a></th>
					<th><a href="index.php?column=CARGA_HORARIO&order=<?php echo $asc_or_desc; ?>">Carga Horária <i class="fas fa-sort<?php echo $column == 'CARGA_HORARIO' ? '-' . $up_or_down : ''; ?>"></i></a></th>
				</tr>
				<?php while ($row = $result->fetch_assoc()): ?>
				<tr>
					<td<?php echo $column == 'TITULO' ? $add_class : ''; ?>><?php echo $row['TITULO']; ?></td>
					<td<?php echo $column == 'DESCRICAO' ? $add_class : ''; ?>><?php echo $row['DESCRICAO']; ?></td>
					<td<?php echo $column == 'CARGA_HORARIO' ? $add_class : ''; ?>><?php echo $row['CARGA_HORARIO']; ?></td>
				</tr>
				<?php endwhile; ?>
			</table>
		</body>
	</html>
	<?php
	$result->free();
}
?>