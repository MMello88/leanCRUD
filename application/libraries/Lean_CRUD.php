<?php

class Lean_CRUD
{
	private $output;
	private $ci;

	public function __construct($tabela_id = null)
	{
		$this->set_default_Model();	
	}

	public function get_output()
	{
		return $this->output;
	}

	public function build_CRUD($tabela_id)
	{
		$row = $this->ci->lean_crud_model->get_tabelaById($tabela_id);
		$colunas = $this->ci->lean_crud_model->get_colunas($row['tabela_id']);

		$cols = array();
		foreach ($colunas as $coluna) {
			array_push($cols, $coluna['coluna']);
		}

		$crud = $this->_getGroceryCRUD(strtolower($row['tabela']), $row['display']);

		$crud = $this->_getRequeredField($crud, $colunas);

		$crud = $this->_getDisplayAs($crud, $colunas);

		$crud = $this->_getColumns($crud, $colunas);

		$crud = $this->_getRelation($crud, $colunas);

		$crud = $this->_getBtnActionTabelasFilha($crud, $row['tabela_id']);
				
		$this->output = $crud->render();
	}

	public function build_CRUD_item($foreignkey_id, $primary_key)
	{
		$foreignkKey = $this->ci->lean_crud_model->get_foreignKeyByFkId($foreignkey_id);

		$colunas = $this->ci->lean_crud_model->get_colunas($foreignkKey['tabela_id']);

		$cols = array();
		foreach ($colunas as $coluna) {
			array_push($cols, $coluna['coluna']);
		}

		$crud = $this->_getGroceryCRUD($foreignkKey['tabela'], $foreignkKey['display_tabela']);

		$crud->where($foreignkKey['coluna_ref'], $primary_key);

		$crud = $this->_getRequeredField($crud, $colunas);

		$crud = $this->_getDisplayAs($crud, $colunas);

		$crud = $this->_getColumns($crud, $colunas);

		$crud = $this->_getRelation($crud, $colunas);

		$crud->field_type($foreignkKey['coluna_ref'], 'hidden', $primary_key);

		$crud = $this->_getBtnActionTabelasFilha($crud, $foreignkKey['tabela_id']);
				
		$this->output = $crud->render();

	}

	public function execute_SCRIPT()
	{
		//Gerar Tabela
		$tabelas = $this->ci->lean_crud_model->get_all_tabelas();
		$script = "";
		$scripts = array();
		foreach ($tabelas as $tabela) {
			$colunas = $this->ci->lean_crud_model->get_colunas($tabela['tabela_id']);
			$_tabela = $tabela['tabela'];
			$pk = "";
			if ($this->ci->lean_crud_model->existe_tabela_na_database($_tabela)){
				foreach ($colunas as $coluna_item) {
					$fk = "";

					$coluna = "`".$coluna_item['coluna']."`";

					$data_type = $coluna_item["data_type"];

					$length = empty($coluna_item['length']) ? "" : "(".$coluna_item['length'].")";

					$data_type_length = $data_type.$length;
					
					$not_null = $coluna_item['not_null'] == "Nao" ? "NULL" : "NOT NULL";
					
					
					
					$default = empty($coluna_item['default']) ? "" : "DEFAULT '".$coluna_item['default']."'";

					$auto_incr = $coluna_item['auto_incr'] == "Nao" ? "" : "AUTO_INCREMENT";
					
					$pk = $coluna_item['PK'] == "Nao" ? "" : ", DROP PRIMARY KEY, ADD PRIMARY KEY ($coluna)";

					if ($coluna_item['FK'] == "Sim") {
						$foreignKeys = $this->ci->lean_crud_model->get_foreignKeyByColunaRefId($coluna_item['coluna_id'], TRUE);
						foreach ($foreignKeys as $item_fk) {
							$fk = " ALTER TABLE $_tabela ADD CONSTRAINT FK_".$_tabela."_".$coluna_item['coluna']." FOREIGN KEY (".$coluna_item['coluna'].") REFERENCES ".$item_fk['tabela']."(".$item_fk['coluna']."); ";
							array_push($scripts, array('script_fk' => $fk, 'fk_id' => $item_fk['foreignkey_id'], 'tabela_id' => $tabela['tabela_id']));
						}
					}
					
					$comment = empty($coluna_item['comment']) ? "" : "COMMENT '".$coluna_item['comment']."'";

					if ($this->ci->lean_crud_model->existe_coluna_na_tabela($_tabela, $coluna_item['coluna'])){
						$script = "ALTER TABLE $_tabela CHANGE $coluna $coluna $data_type_length $not_null $default $auto_incr $comment $pk;";
					} else {
						$script = "ALTER TABLE $_tabela ADD COLUMN $coluna $data_type_length $not_null $default $auto_incr $comment $pk;";
					}
					//echo "<b>".$script . "</b><br/>";
					$script_executado = $this->ci->lean_crud_model->ExecutarScript($tabela['tabela_id'], $script);
				}
			} else {
				$script  = "CREATE TABLE IF NOT EXISTS `$_tabela` (";
				$pk = "";
				foreach ($colunas as $coluna_item) {
					$fk = "";

					$coluna = "`".$coluna_item['coluna']."`";
					
					$data_type = "`".$coluna_item['data_type']."`";

					$data_type = $coluna_item['data_type'];

					$length = empty($coluna_item['length']) ? "" : "(".$coluna_item['length'].")";
					
					$data_type_length = $data_type.$length;

					$not_null = $coluna_item['not_null'] == "Nao" ? "NULL" : "NOT NULL";
					
					$auto_incr = $coluna_item['auto_incr'] == "Nao" ? "" : "AUTO_INCREMENT";
					
					$default = empty($coluna_item['default']) ? "" : "DEFAULT ". $coluna_item['default'];

					if (empty($pk)) {
						$pk = $coluna_item['PK'] == "Nao" ? "" : "PRIMARY KEY ($coluna)";
					}

					if ($coluna_item['FK'] == "Sim") {
						$foreignKeys = $this->ci->lean_crud_model->get_foreignKeyByColunaRefId($coluna_item['coluna_id'], TRUE);
						foreach ($foreignKeys as $item_fk) {
							$fk = " ALTER TABLE $_tabela ADD CONSTRAINT FK_".$_tabela."_".$coluna." FOREIGN KEY ($coluna) REFERENCES ".$item_fk['tabela']."(".$item_fk['coluna']."); ";
							array_push($scripts, array('script_fk' => $fk, 'fk_id' => $item_fk['foreignkey_id'], 'tabela_id' => $tabela['tabela_id']));
						}
					}
					
					$comment = empty($coluna_item['comment']) ? "" : "COMMENT '".$coluna_item['comment']."'";

					$script .= "$coluna $data_type_length $default $not_null $auto_incr $comment,";
				}
				if (empty($pk)) {
					$script = substr($script, 0, -1);
				} else {
					$script .= $pk;
				}
				$script .= ") ENGINE=InnoDB CHARSET=utf8 COLLATE=utf8_general_ci;";
				//echo "<b>".$script . "</b><br/>";
				
				$script_executado = $this->ci->lean_crud_model->ExecutarScript($tabela['tabela_id'], $script);
			}

			//print_r($scripts);
			if (!empty($scripts)){
				foreach ($scripts as $script_item) {
					if (isset($script_item['script_fk'])) {
						$script_executado = $this->ci->lean_crud_model->ExecutarScript($script_item['tabela_id'], $script_item['script_fk']);
					}
				}
			}
		}

		echo "Verifique a tabela log_script para validar se existe algum erro na execução dos scripts<br/>";

		$logs = $this->ci->lean_crud_model->get_log();
		foreach ($logs as $log) {
			echo '<b>'.$log['mensagem'].'</b><br/>';
		}
	}

	protected function set_default_Model()
	{
        $this->ci = &get_instance();
		$this->ci->load->model('lean_crud_model');	
	}

	protected function _getRelation($crud, $colunas)
	{
		foreach ($colunas as $item_coluna) {
			if ($item_coluna['FK'] == 'Sim'){
				$foreignKeys = $this->ci->lean_crud_model->get_foreignKeyByColunaRefId($item_coluna['coluna_id'], FALSE);
				foreach ($foreignKeys as $item_fk) {
					if ($item_fk['tabela_pai'] == 'Nao')
						$crud->set_relation($item_coluna['coluna'], $item_fk['tabela'], $item_fk['display']);
				}
			}
		}

		return $crud;
	}

	protected function _getGroceryCRUD($nomeTabela, $subject)
	{
		$crud = new grocery_CRUD();

		$crud->set_table($nomeTabela);
		$crud->set_subject($subject);

		return $crud;
	}

	protected function _getBtnActionTabelasFilha($crud, $tabela_fk_id)
	{
		$foreignKeys = $this->ci->lean_crud_model->get_foreignKeyByTabelaFK($tabela_fk_id);

		if (!empty($foreignKeys)) {
			foreach ($foreignKeys as $item) {
				$tabela_filha = $this->ci->lean_crud_model->get_tabelaByColunaId($item['coluna_ref_id']);
				$crud->add_action($tabela_filha['display'], '', 'admin/leanCRUD_item/'.$item['foreignkey_id'], 'ui-icon-plus');
			}
		}

		return $crud;
	}

	protected function _getRequeredField($crud, $colunas)
	{
		$cols = array();
		foreach ($colunas as $coluna) {
			if ($coluna['not_null'] == 'Sim')
				array_push($cols, $coluna['coluna']);
		}

		$crud->required_fields($cols);

		return $crud;
	}

	protected function _getColumns($crud, $colunas)
	{
		$cols = array();
		foreach ($colunas as $coluna) {
			if ($coluna['show_grid'] == 'Sim')
			array_push($cols, $coluna['coluna']);
		}

		$crud->columns($cols);

		return $crud;
	}

	protected function _getDisplayAs($crud, $colunas)
	{
		foreach ($colunas as $coluna) {
			$crud->display_as($coluna['coluna'],$coluna['display']);
		}

		return $crud;
	}	
}