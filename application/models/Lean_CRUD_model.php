<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Lean_CRUD_model extends CI_Model {

	/* funções para tabela */
	public function get_all_tabelas(){
		$query = $this->db->get_where('tabela');
		return $query->result_array();
	}

	public function get_tabelas()
	{
		$query = $this->db->get_where('tabela');
	   	return $query->result_array();
	}

	public function get_tabelasByUserId($group_user_ref_id)
	{
		$query = $this->db->get_where('tabela', array('group_user_ref_id' => $group_user_ref_id));
	    return $query->result_array();
	}

	public function get_tabelaById($tabela_id)
	{
		$query = $this->db->get_where('tabela', array('tabela_id' => $tabela_id));
		return $query->row_array();
	}

	public function existe_tabela_na_database($nome_tabela)
	{
		$query = $this->db->query("SHOW TABLES LIKE '$nome_tabela'");
		return $query->num_rows() > 0;
	}	
	/* fim das funções para tabela*/

	/* funcões para coluna */
	public function get_colunas($tabela_ref_id)
	{
		$query = $this->db->get_where('coluna', array('tabela_ref_id' => $tabela_ref_id));
		return $query->result_array();
	}

	public function get_colunaById($coluna_id)
	{
		$query = $this->db->get_where('coluna', array('coluna_id' => $coluna_id));
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
							      "  FROM coluna c " .
							      "  LEFT JOIN tabela t ON (t.tabela_id = c.tabela_ref_id) " .
							      " WHERE c.coluna_id = $coluna_id");
		return $query->row_array();
	}

	public function insert_coluna_pk($tabela_id, $tabela)
	{
		$data = array(
			'coluna_id' => null,
		    'tabela_ref_id' => $tabela_id,
		    'coluna' => $tabela.'_id',
		    'display' => 'Id ' . $tabela,
		    'PK' => 'Sim',
		    'FK' => 'Nao',
		    'data_type' => 'int',
		    'length' => '11',
		    'not_null' => 'Sim',
		    'auto_incr' => 'Sim'
		);

		return $this->db->insert('coluna', $data);
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

		return $this->db->insert('log_script', $data);
	}

	public function get_log($dt_inicial = FALSE, $dt_final = FALSE){
		$query = $this->db->get('log_script');
		return $query->result_array();
	}
	/* fim das funções para Executar Script */

 	/* funções para Foreign Key */
 	public function get_foreignKeyByFkId($foreignkey_id)
	{
		$query = $this->db->query("SELECT c.coluna,                 " .
								  "       c.display display_coluna, " .
								  "       c.coluna_id, 				" .
								  "       t.tabela, 				" .
								  "       t.display display_tabela, " .
								  "       t.tabela_id,				" .
								  "       cr.coluna coluna_ref,     " .
                                  "       cr.display display_coluna_ref, " .
                                  "       cr.coluna_id coluna_id_ref     " .
								  "  FROM foreignkey f 				" .
								  "  LEFT JOIN coluna c ON (c.coluna_id = f.coluna_ref_id)  " .
								  "  LEFT JOIN tabela t ON (t.tabela_id = c.tabela_ref_id)  " .
								  "  LEFT JOIN coluna cr ON (cr.coluna_id = f.coluna_fk_id) " .
								  " WHERE f.foreignkey_id = $foreignkey_id " );
	  	return $query->row_array();
	}

	public function get_foreignKey($coluna_ref_id)
	{
		$query = $this->db->get_where('foreignkey', array('coluna_ref_id' => $coluna_ref_id));
	  	return $query->result_array();
	}

	public function get_foreignKeyById($foreignkey_id)
	{
		$query = $this->db->get_where('foreignkey', array('foreignkey_id' => $foreignkey_id));
	  	return $query->row_array();
	}

	public function get_foreignKeyByTabelaFK($tabela_fk_id)
	{
		$query = $this->db->get_where('foreignkey', array('tabela_fk_id' => $tabela_fk_id, 'tabela_pai' => 'Sim'));
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
							    "   FROM foreignkey f          " .
							    "   JOIN tabela t ON (t.tabela_id = f.tabela_fk_id) " .
							    "   JOIN coluna c ON (c.coluna_id = f.coluna_fk_id AND c.tabela_ref_id = f.tabela_fk_id) " .
							    "   JOIN coluna cc ON (cc.coluna_id = f.coluna_display_fk_id AND cc.tabela_ref_id = f.tabela_fk_id) " .
							    "  WHERE f.coluna_ref_id = $coluna_ref_id " .
							    "    AND f.tabela_pai = $tabela_pai " );
	  return $query->result_array();
	}

	/* fim das funções para Foreign Key */

}