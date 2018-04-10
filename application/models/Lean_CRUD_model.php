<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lean_CRUD_model extends CI_Model {


	public function get_menu($group_user_ref_id){
		if ($group_user_ref_id === 1){
			$query = $this->db->get('lean_menu');
			
		} else if ($group_user_ref_id === 2){
			$query = $this->db->select('*')
		    	->where_in('group_user_ref_id', array($group_user_ref_id,'3'))
		   		->get('lean_menu');
		} else if ($group_user_ref_id === 3){
			$query = $this->db->get_where('lean_menu', array('group_user_ref_id' => $group_user_ref_id));
		}
			
		
	    $rows = $query->result_array();
	    foreach ($rows as $key => $row) {
	    	$rows[$key]['submenus'] = $this->get_submenus($row['lean_menu_id']);
	    }
	    return $rows;
	}

	public function get_submenus($lean_menu_id){
		$query = $this->db->get_where('lean_submenu', array('lean_menu_id' => $lean_menu_id));
	    return $query->result_array();
	}

	/* funções para tabela */
	public function get_all_tabelas(){
		$query = $this->db->get_where('lean_tabela');
		return $query->result_array();
	}

	public function get_tabelas()
	{
		$query = $this->db->get_where('lean_tabela');
	   	return $query->result_array();
	}

	public function get_tabelasByUserId($group_user_ref_id)
	{
		$query = $this->db->get_where('lean_tabela', array('group_user_ref_id' => $group_user_ref_id));
	    return $query->result_array();
	}

	public function get_tabelaById($tabela_id)
	{
		$query = $this->db->get_where('lean_tabela', array('tabela_id' => $tabela_id));
		return $query->row_array();
	}

	public function existe_tabela_na_database($nome_tabela)
	{
		$query = $this->db->query("SHOW TABLES LIKE '$nome_tabela'");
		return $query->num_rows() > 0;
	}	
	/* fim das funções para tabela*/

	/* funcões para coluna */
	public function get_colunas($tabela_id)
	{
		$query = $this->db->get_where('lean_coluna', array('tabela_id' => $tabela_id));
		return $query->result_array();
	}

	public function get_colunaById($coluna_id)
	{
		$query = $this->db->get_where('lean_coluna', array('coluna_id' => $coluna_id));
		return $query->row_array();
	}

	public function existe_coluna_na_tabela($nome_tabela, $nome_coluna)
	{
		$query = $this->db->query("SHOW COLUMNS FROM $nome_tabela WHERE FIELD = '$nome_coluna'");
		return $query->num_rows() > 0;
	}

	public function get_tabelaByColunaId($coluna_id)
	{
		$query = $this->db->query("SELECT t.display,   " .
							      "       t.tabela,    " .
							      "       t.tabela_id, " .
							      "       c.coluna,    " .
							      "       c.display display_coluna " .
							      "  FROM lean_coluna c " .
							      "  LEFT JOIN lean_tabela t ON (t.tabela_id = c.tabela_id) " .
							      " WHERE c.coluna_id = $coluna_id");
		return $query->row_array();
	}

	public function insert_coluna_pk($tabela_id, $tabela)
	{
		$data = array(
			'coluna_id' => null,
		    'tabela_id' => $tabela_id,
		    'coluna' => $tabela.'_id',
		    'display' => 'Id ' . $tabela,
		    'PK' => 'Sim',
		    'FK' => 'Nao',
		    'data_type' => 'int',
		    'length' => '11',
		    'not_null' => 'Sim',
		    'auto_incr' => 'Sim'
		);

		return $this->db->insert('lean_coluna', $data);
	}

	public function insert_coluna_fk($tabela_id, $nome_coluna, $display){
		$data = array(
			'coluna_id' => null,
		    'tabela_id' => $tabela_id,
		    'coluna' => $nome_coluna,
		    'display' => $display,
		    'PK' => 'Nao',
		    'FK' => 'Sim',
		    'data_type' => 'int',
		    'length' => '11',
		    'not_null' => 'Sim',
		    'auto_incr' => 'Nao'
		);

		$this->db->insert('lean_coluna', $data);

		$data = array(
			'foreignkey_id' => null, 
			'coluna_ref_id' => $this->db->insert_id(), 
			'tabela_fk_id'  => 1, 
			'coluna_fk_id'  => 1, 
			'coluna_display_fk_id' => 2,
			'tabela_pai' => 'Nao'
		);

		return $this->db->insert('lean_foreignkey', $data);
	}
	/* fim das funcões para coluna */

	/* funções para Executar Script */
	public function ExecutarScript($tabela_id, $scripts)
    {
		$lavel = "";
		if (is_array($scripts)){
		  foreach ($scripts as $script) {
		    if (!$this->db->query($script)){
		      $error = $this->db->error();
		      $this->logEscript($tabela_id, 'Erro', $error['code'] . ' - ' . $error['message'], $script);
		      $lavel = "Com Erro";
		    }
		  }

		  if (empty($lavel))
		    return "Com Sucesso";
		  return $lavel;

		} else {
		  $this->db->query("SET FOREIGN_KEY_CHECKS=0;");		  
		  if (!$this->db->query($scripts)){
		    $error = $this->db->error();
		    $this->logEscript($tabela_id, 'Erro', $error['code'] . ' - ' . $error['message'], $scripts);
		    $this->db->query("SET FOREIGN_KEY_CHECKS=1;");
		    return "Com Erro";
		  }

		  $this->db->query("SET FOREIGN_KEY_CHECKS=1;");
		  return "Com Sucesso";
		}
	}

	public function logEscript($tabela_id, $level = 'Erro', $message, $command)
	{
		$data = array(
		    'tipo' => $level,
		    'mensagem' => $message,
		    'data_log' => date("Y-m-d H:i:s"),
		    'tabela_id' => $tabela_id,
		    'comando_sql' => $command
		);

		return $this->db->insert('lean_log_script', $data);
	}

	public function get_log($dt_inicial = FALSE, $dt_final = FALSE){
		$query = $this->db->get('lean_log_script');
		return $query->result_array();
	}
	/* fim das funções para Executar Script */

 	/* funções para Foreign Key */
 	public function get_foreignKeyByFkId($foreignkey_id)
	{
		$query = $this->db->query("SELECT c.coluna,                   " .
								  "       c.display display_coluna,   " .
								  "       c.coluna_id, 				  " .
								  "       t.tabela, 				  " .
								  "       t.dm_filtrar_usuario,       " .
								  "       t.display display_tabela,   " .
								  "       t.tabela_id,				  " .
								  "       cr.tabela_id tabela_ref_id, " .
								  "       cr.coluna coluna_ref,       " .
                                  "       cr.display display_coluna_ref, " .
                                  "       cr.coluna_id coluna_id_ref     " .
								  "  FROM lean_foreignkey f 				" .
								  "  LEFT JOIN lean_coluna c ON (c.coluna_id = f.coluna_ref_id)  " .
								  "  LEFT JOIN lean_tabela t ON (t.tabela_id = c.tabela_id)  " .
								  "  LEFT JOIN lean_coluna cr ON (cr.coluna_id = f.coluna_fk_id) " .
								  " WHERE f.foreignkey_id = $foreignkey_id " );
	  	return $query->row_array();
	}

	public function get_foreignKey($coluna_ref_id)
	{
		$query = $this->db->get_where('lean_foreignkey', array('coluna_ref_id' => $coluna_ref_id));
	  	return $query->result_array();
	}

	public function get_foreignKeyById($foreignkey_id)
	{
		$query = $this->db->get_where('lean_foreignkey', array('foreignkey_id' => $foreignkey_id));
	  	return $query->row_array();
	}

	public function get_foreignKeyByTabelaFK($tabela_fk_id)
	{
		$query = $this->db->get_where('lean_foreignkey', array('tabela_fk_id' => $tabela_fk_id, 'tabela_pai' => 'Sim'));
	  	return $query->result_array();
	}

	public function get_foreignKeyByColunaRefId($coluna_ref_id, $tabela_pai = FALSE)
	{
	  $tabela_pai = $tabela_pai == FALSE ?  "'Nao'" : "'Sim'";
	  $query = $this->db->query(" SELECT f.foreignkey_id,      " .
	 						    "        f.coluna_ref_id,      " .
							    "        t.tabela,             " .
							    "        f.tabela_fk_id,       " .
							    "        c.coluna,             " .
							    "        cc.coluna as display, " .
							    "        f.tabela_pai          " .
							    "   FROM lean_foreignkey f          " .
							    "   JOIN lean_tabela t ON (t.tabela_id = f.tabela_fk_id) " .
							    "   JOIN lean_coluna c ON (c.coluna_id = f.coluna_fk_id AND c.tabela_id = f.tabela_fk_id) " .
							    "   JOIN lean_coluna cc ON (cc.coluna_id = f.coluna_display_fk_id AND cc.tabela_id = f.tabela_fk_id) " .
							    "  WHERE f.coluna_ref_id = $coluna_ref_id " .
							    "    AND f.tabela_pai = $tabela_pai " );
	  return $query->result_array();
	}

	/* fim das funções para Foreign Key */

}