<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
1:1 é quando no cadastro de cliente tem o id da cidade, ou seja, este não apresenta para cadastrar como filho.
1:n é o mesmo que categoria de produto tem varios produtos, ou seja, este sim apresenta botão para cadastrar como filho na linha da grade.
n:n são 2 cadastro que são unidos em um cadastro. Exemplo: Cad Ator e Cad filme, então unindos tenho Filme por Ator ou Ator por Filme.
*/


class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (!(isset($_SESSION['username']) && $_SESSION['logged_in'] === true))
			redirect('/login');
		$this->load->model('lean_crud_model'); 
	}


	public function leanCRUD($tabela_id)
	{
		$lean_crud = new lean_CRUD();
		$lean_crud->build_CRUD($tabela_id);
		$this->_example_output($lean_crud->get_output());
	}

	public function leanCRUD_item($foreignkey_id, $primary_key)
	{
		$lean_crud = new lean_CRUD();
		$lean_crud->build_CRUD_item($foreignkey_id, $primary_key);
		$this->_example_output($lean_crud->get_output());
	}

	public function _example_output($output = null)
	{
		if ($_SESSION['group_user_ref_id'] === 1)
			$rows = $this->lean_crud_model->get_tabelas();
		else
			$rows = $this->lean_crud_model->get_tabelasByUserId($_SESSION['group_user_ref_id']);
		$sublink = '';
		foreach ($rows as $row) {
			$sublink .=  "<li><a href='".site_url("admin/leanCRUD/{$row['tabela_id']}")."'>{$row['display']}</a></li>";
		}
		$this->data['sublink'] = $sublink;
		$output = array_merge($this->data,(array)$output);
		$this->load->view('restrito/admin.php',$output);
	}

	public function index()
	{
		$this->_example_output((object)array('output' => '' , 'js_files' => array() , 'css_files' => array()));
	}

	public function lean_tabela()
	{
		if ($_SESSION['group_user_ref_id'] !== 1) 
			redirect("/admin");

		$crud = new grocery_CRUD();
		
		if ($_SESSION['group_user_ref_id'] !== 1)
			$crud->where('group_user_id',$_SESSION['group_user_ref_id']);
		$crud->set_table('tabela');
		$crud->set_subject('Cadastro de Tabelas');
		$crud->required_fields('tabela','display');
		
		$crud->display_as('tabela_id','Id');
		$crud->display_as('tabela','Tabela');
		$crud->display_as('display','Nome de Apresentação');

		$crud->columns('tabela_id','tabela','display');

		$crud->set_relation('group_user_ref_id', 'group_users', 'groupname');

		$crud->add_fields('tabela','display', 'group_user_ref_id');
		$crud->edit_fields('tabela','display', 'group_user_ref_id');

		 
		$crud->add_action('Colunas', '', 'admin/lean_coluna','ui-icon-plus');
		
		$crud->callback_after_insert(array($this, 'script_tabela_insert'));
		$crud->callback_before_update(array($this, 'script_tabela_update'));
		$crud->callback_before_delete(array($this, 'script_tabela_delete'));

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	function lean_coluna($id)
	{
		if ($_SESSION['group_user_ref_id'] !== 1) 
			redirect("/admin");

		$crud = new grocery_CRUD();

		$crud->where('tabela_ref_id',$id);
		$crud->set_table('coluna');
		$crud->set_subject('Cadastro de Colunas');
		$crud->required_fields('coluna','display','PK','FK','data_type','not_null','auto_incr');


        $crud->display_as('coluna_id','Id');
		$crud->display_as('coluna','Coluna');
		$crud->display_as('display','Nome de Apresentação');
		$crud->display_as('PK','Campo é PK?');
		$crud->display_as('FK','Campo é FK?');
		$crud->display_as('data_type','Tipo de Dados');
		$crud->display_as('length','Tamanho');
		$crud->display_as('not_null','Campo obrigatório');
		$crud->display_as('auto_incr','Auto Incremento');
		$crud->display_as('comment','Comentário');
		$crud->display_as('default','Valor Inicial');
		$crud->display_as('show_grid','Mostra na Gride');

		$crud->columns('coluna_id','coluna','display','PK','FK','data_type','length','not_null','auto_incr','comment','default','show_grid');

		$crud->add_fields('coluna','display','FK','data_type','length','not_null','comment','default','show_grid', 'tabela_ref_id');
		$crud->edit_fields('coluna','display','FK','data_type','length','not_null','comment','default','show_grid', 'tabela_ref_id');

		$crud->field_type('tabela_ref_id', 'hidden', $id);

		$crud->add_action('Chave Estrangeira', '', 'admin/lean_foreignkey','ui-icon-plus');

		$crud->callback_after_insert(array($this, 'script_coluna_insert'));
		$crud->callback_before_update(array($this, 'script_couna_update'));
		$crud->callback_before_delete(array($this, 'script_coluna_delete'));

		$output = $crud->render();
		 
		$this->_example_output($output);
	}

	function lean_foreignkey($id)
	{
		if ($_SESSION['group_user_ref_id'] !== 1) 
			redirect("/admin");

		$crud = new grocery_CRUD();

		$crud->where('coluna_ref_id',$id);
		$crud->set_table('foreignkey');
		$crud->set_subject('Cadastro da Chave Estrangeira (FK)');
		$crud->required_fields('tabela_fk_id', 'coluna_fk_id','coluna_display_fk_id');

		$crud->display_as('foreignkey_id','Id');
		$crud->display_as('coluna_ref_id','Coluna Referenciada');
		$crud->display_as('tabela_fk_id', 'Tabela Referencia se Campo FK');
		$crud->display_as('coluna_fk_id', 'Coluna Tabela Referencia se Campo FK');
		$crud->display_as('coluna_display_fk_id', 'Coluna de Apresentação Tabela Referencia se Campo FK');
		$crud->display_as('tabela_pai', 'Tabela Pai?');

		$crud->columns('tabela_fk_id', 'coluna_fk_id', 'coluna_display_fk_id', 'tabela_pai');

		$crud->set_relation('tabela_fk_id', 'tabela', 'tabela');
		$crud->set_relation('coluna_fk_id', 'coluna', 'coluna');
		$crud->set_relation('coluna_display_fk_id', 'coluna', 'coluna');

		$crud->add_fields('coluna_ref_id','tabela_fk_id', 'coluna_fk_id', 'coluna_display_fk_id', 'tabela_pai');
		$crud->edit_fields('tabela_fk_id', 'coluna_fk_id', 'coluna_display_fk_id', 'tabela_pai');

		$crud->field_type('coluna_ref_id', 'hidden', $id);


		$this->load->library('gc_dependent_select');

		// settings
		$fields = array(
			// first field:
			'tabela_fk_id' => array( // first dropdown name
			'table_name' => 'tabela', // table of country
			'title' => 'tabela', // country title
			'relate' => null // the first dropdown hasn't a relation
			),
			// second field
			'coluna_fk_id' => array( // second dropdown name
			'table_name' => 'coluna', // table of state
			'title' => 'coluna', // state title
			'id_field' => 'coluna_id', // table of state: primary key
			'relate' => 'tabela_ref_id', // table of state:
			'data-placeholder' => 'selecionar coluna' //dropdown's data-placeholder:
			)
		);

		$config = array(
			'main_table' => 'foreignkey',
			'main_table_primary' => 'foreignkey_id',
			"url" => base_url() . 'index.php/' . __CLASS__ . '/', //	.$id.'/add' //path to method
			'ajax_loader' => base_url() . 'ajax-loader.gif', // path to ajax-loader image. It's an optional parameter
			'segment_name' =>'get_colunasByIdTabela' // It's an optional parameter. by default "get_items"
		);

		$mult = new gc_dependent_select($crud, $fields, $config);

		// the second method:
		$js = $mult->get_js();


        // settings
		$fields = array(
			// first field:
			'tabela_fk_id' => array( // first dropdown name
			'table_name' => 'tabela', // table of country
			'title' => 'tabela', // country title
			'relate' => null // the first dropdown hasn't a relation
			),
			// second field
			'coluna_display_fk_id' => array( // second dropdown name
			'table_name' => 'coluna', // table of state
			'title' => 'coluna', // state title
			'id_field' => 'coluna_id', // table of state: primary key
			'relate' => 'tabela_ref_id', // table of state:
			'data-placeholder' => 'selecionar coluna' //dropdown's data-placeholder:
			)
		);

		$config = array(
			'main_table' => 'foreignkey',
			'main_table_primary' => 'foreignkey_id',
			"url" => base_url() . 'index.php/' . __CLASS__ . '/', //	.$id.'/add' //path to method
			'ajax_loader' => base_url() . 'ajax-loader.gif', // path to ajax-loader image. It's an optional parameter
			'segment_name' =>'get_colunasByIdTabela' // It's an optional parameter. by default "get_items"
		);

		$mult1 = new gc_dependent_select($crud, $fields, $config);

		// the second method:
		$js1 = $mult1->get_js();

		$crud->callback_after_insert(array($this, 'script_foreignkey_insert'));
		$crud->callback_before_update(array($this, 'script_foreignkey_update'));
		$crud->callback_before_delete(array($this, 'script_foreignkey_delete'));

		$output = $crud->render();

		$output->output.= $js;

		$output->output.= $js1;

		//$output = $crud->render();
		 
		$this->_example_output($output);
	}

	function get_colunasByIdTabela($id){
		if ($_SESSION['group_user_ref_id'] !== 1) 
			redirect("/admin");

		$colunas = $this->lean_crud_model->get_colunas($id);
		
		$arr = array();
		foreach ($colunas as $item) {
			array_push($arr, array('value' => $item['coluna_id'], 'property' => $item['coluna']));
		}
		
		echo json_encode($arr);
	}

	function script_tabela_insert($post_array,$primary_key)
	{
		extract($post_array);

		$campo_pk = $tabela."_id";

		$script = "
		CREATE TABLE IF NOT EXISTS `$tabela` (
			`$campo_pk` INT NOT NULL AUTO_INCREMENT,
			PRIMARY KEY (`$campo_pk`)
		) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;";

		$this->lean_crud_model->ExecutarScript($primary_key, $script);

		$this->lean_crud_model->insert_coluna_pk($primary_key, $tabela);
	}

	function script_tabela_update($post_array,$primary_key)
	{
		$tabela = $this->lean_crud_model->get_tabelaById($primary_key);

		$tabela_old = $tabela['tabela'];

		$tabela_new = $post_array['tabela'];

		$script = "RENAME TABLE `$tabela_old` TO `$tabela_new`;";

		if ($this->lean_crud_model->existe_tabela_na_database($tabela_new) === FALSE)
			$this->lean_crud_model->ExecutarScript($primary_key, $script); 

		return $post_array;
	}

	function script_tabela_delete($primary_key)
	{
		$row_tabela = $this->lean_crud_model->get_tabelaById($primary_key);

		extract($row_tabela);

		$this->lean_crud_model->ExecutarScript($primary_key, "DROP TABLE `$tabela`;");
	}

	function script_coluna_insert($post_array,$primary_key)
	{
		extract($post_array);

		$row_tabela = $this->lean_crud_model->get_tabelaById($tabela_ref_id);

		$tabela = $row_tabela['tabela'];

		$data_type_length = !empty($length) ? "$data_type($length)" : "$data_type";

		$not_null = $not_null == "Nao" ? "NULL" : "NOT NULL";

		$default = empty($default) ? "" : "DEFAULT '$default'";

		$comment = empty($comment) ? "" : "COMMENT '$comment'";

		$script = "ALTER TABLE `$tabela` ADD COLUMN `$coluna` $data_type_length $default $not_null $comment;";

		$this->lean_crud_model->ExecutarScript($tabela_ref_id, $script);
	}


	function script_couna_update($post_array,$primary_key)
	{
		extract($post_array);

		$row_coluna = $this->lean_crud_model->get_colunaById($primary_key);

		$coluna_old = $row_coluna['coluna'];

		$row_tabela = $this->lean_crud_model->get_tabelaById($tabela_ref_id);

		$tabela = $row_tabela['tabela'];

		$data_type_length = !empty($length) ? "$data_type($length)" : "$data_type";

		$not_null = $not_null == "Nao" ? "NULL" : "NOT NULL";

		$default = empty($default) ? "" : "DEFAULT '$default'";

		$comment = empty($comment) ? "" : "COMMENT '$comment'";

		$script = "ALTER TABLE `$tabela` CHANGE `$coluna_old` `$coluna` $data_type_length $default $not_null $comment;";

		$this->lean_crud_model->ExecutarScript($tabela_ref_id, $script);

		return $post_array;
	}

	function script_coluna_delete($primary_key)
	{
		$row_coluna = $this->lean_crud_model->get_colunaById($primary_key);

		extract($row_coluna);

		$row_tabela = $this->lean_crud_model->get_tabelaById($tabela_ref_id);

		$tabela = $row_tabela['tabela'];

		$script = "ALTER TABLE `$tabela` DROP COLUMN `$coluna`";

		if ($this->lean_crud_model->existe_coluna_na_tabela($tabela,$coluna) === TRUE)
			$this->lean_crud_model->ExecutarScript($tabela_ref_id, $script);
	}

	function script_foreignkey_insert($post_array,$primary_key)
	{

		extract($post_array);

		$row_coluna_cons = $this->lean_crud_model->get_colunaById($coluna_ref_id);

		$row_tabela_cons = $this->lean_crud_model->get_tabelaById($row_coluna_cons['tabela_ref_id']);

		$tabela_cons = $row_tabela_cons['tabela'];

		$coluna_cons = $row_coluna_cons['coluna'];

		$row_coluna_ref = $this->lean_crud_model->get_colunaById($coluna_fk_id);

		$row_tabela_ref = $this->lean_crud_model->get_tabelaById($tabela_fk_id);

		$tabela_ref = $row_tabela_ref['tabela'];

		$coluna_ref = $row_coluna_ref['coluna'];		

		$script = "ALTER TABLE $tabela_cons ADD CONSTRAINT FK_$tabela_cons"."_"."$coluna_cons FOREIGN KEY ($coluna_cons) REFERENCES $tabela_ref($coluna_ref); ";

		$this->lean_crud_model->ExecutarScript($row_coluna_cons['tabela_ref_id'], $script);
	}

	function script_foreignkey_update($post_array,$primary_key)
	{

		$foreignkey = $this->lean_crud_model->get_foreignKeyById($primary_key);

		$row_coluna_old = $this->lean_crud_model->get_colunaById($$foreignkey['coluna_ref_id']);

		$row_tabela_old = $this->lean_crud_model->get_tabelaById($row_coluna_old['tabela_ref_id']);

		$tabela_old = $row_tabela_old['tabela'];

		$coluna_old = $row_coluna_old['coluna'];

		extract($post_array);

		$row_coluna_cons = $this->lean_crud_model->get_colunaById($coluna_ref_id);

		$row_tabela_cons = $this->lean_crud_model->get_tabelaById($row_coluna_cons['tabela_ref_id']);

		$tabela_cons = $row_tabela_cons['tabela'];

		$coluna_cons = $row_coluna_cons['coluna'];

		$row_coluna_ref = $this->lean_crud_model->get_colunaById($coluna_fk_id);

		$row_tabela_ref = $this->lean_crud_model->get_tabelaById($tabela_fk_id);

		$tabela_ref = $row_tabela_ref['tabela'];

		$coluna_ref = $row_coluna_ref['coluna'];
		
		$script = " ALTER TABLE $tabela_cons
					  ADD CONSTRAINT FK_$tabela_cons"."_"."$coluna_cons FOREIGN KEY ($coluna_cons) REFERENCES $tabela_ref($coluna_ref),
					  DROP FOREIGN KEY FK_$tabela_old"."_"."$coluna_old;";

		$this->lean_crud_model->ExecutarScript($row_coluna_cons['tabela_ref_id'], $script);
	}

	function script_foreignkey_delete($primary_key)
	{

		$foreignkey = $this->lean_crud_model->get_foreignKeyById($primary_key);

		$row_coluna_old = $this->lean_crud_model->get_colunaById($foreignkey['coluna_ref_id']);

		$row_tabela_old = $this->lean_crud_model->get_tabelaById($row_coluna_old['tabela_ref_id']);

		$tabela_old = $row_tabela_old['tabela'];

		$coluna_old = $row_coluna_old['coluna'];

		$script = "ALTER TABLE $tabela_old
  					DROP FOREIGN KEY FK_$tabela_old"."_"."$coluna_old; ";

  		$this->lean_crud_model->ExecutarScript($row_coluna_old['tabela_ref_id'], $script);

	}
}