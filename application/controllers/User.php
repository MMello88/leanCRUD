<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * User class.
 * 
 * @extends CI_Controller
 */
class User extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function __construct() {
		
		parent::__construct();
		//$this->load->library(array('session'));
		//$this->load->helper(array('url'));
		$this->load->model('user_model');
		
	}
	
	
	public function index() {
	}
	
	/**
	 * register function.
	 * 
	 * @access public
	 * @return void
	 */
	public function register() {
		
		// create the data object
		$data = new stdClass();
		
		// load form helper and validation library
		$this->load->helper('form');
		$this->load->library('form_validation');
		
		// set validation rules
		$this->form_validation->set_rules('username', 'Username', 'trim|required|alpha_numeric|min_length[4]');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|is_unique[lean_users.email]', array('is_unique' => 'Este E-mail já existe. Por favor, escolha outro.'));
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
		$this->form_validation->set_rules('password_confirm', 'Confirm Password', 'trim|required|min_length[6]|matches[password]');
		
		if ($this->form_validation->run() === false) {
			
			// validation not ok, send validation errors to the view
			$this->load->view('user/includes/header');
			$this->load->view('user/register/register', $data);
			$this->load->view('user/includes/footer');
			
		} else {
			
			// set variables from the form
			$username = $this->input->post('username');
			$email    = $this->input->post('email');
			$password = $this->input->post('password');
			
			if ($this->user_model->create_user($username, $email, $password)) {
				
				// user creation ok
				$this->load->view('user/includes/header');
				$this->load->view('user/register/register_success', $data);
				$this->load->view('user/includes/footer');
				
			} else {
				
				// user creation failed, this should never happen
				$data->error = 'There was a problem creating your new account. Please try again.';
				
				// send error to the view
				$this->load->view('user/includes/header');
				$this->load->view('user/register/register', $data);
				$this->load->view('user/includes/footer');

			}
			
		}
		
	}
		
	/**
	 * login function.
	 * 
	 * @access public
	 * @return void
	 */
	public function login() {
		
		// create the data object
		$data = new stdClass();
		
		// load form helper and validation library
		$this->load->helper('form');
		$this->load->library('form_validation');
		
		// set validation rules
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
		
		if ($this->form_validation->run() == false) {
			
			// validation not ok, send validation errors to the view
			$this->load->view('user/includes/header');
			$this->load->view('user/login/login');
			$this->load->view('user/includes/footer');
			
		} else {
			
			// set variables from the form
			$email = $this->input->post('email');
			$password = $this->input->post('password');
			
			if ($this->user_model->resolve_user_login($email, $password)) {
				
				$user_id = $this->user_model->get_user_id_from_email($email);
				$user    = $this->user_model->get_user($user_id);
				
				// set session user datas
				$_SESSION['user_id']       = (int)$user->user_id;
				$_SESSION['username']      = (string)$user->username;
				$_SESSION['logged_in']     = (bool)true;
				$_SESSION['is_confirmed']  = (bool)$user->is_confirmed;
				$_SESSION['group_user_ref_id'] = (int)$user->group_user_ref_id;
				
				// user login ok
				redirect('/admin');
				/*$this->load->view('user/includes/header');
				$this->load->view('user/login/login_success', $data);
				$this->load->view('user/includes/footer');*/
				
			} else {
				
				// login failed
				$data->error = 'Wrong username or password.';
				
				// send error to the view
				$this->load->view('user/includes/header');
				$this->load->view('user/login/login', $data);
				$this->load->view('user/includes/footer');
				
			}
			
		}
		
	}
	
	/**
	 * logout function.
	 * 
	 * @access public
	 * @return void
	 */
	public function logout() {
		
		// create the data object
		$data = new stdClass();
		
		if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
			
			// remove session datas
			foreach ($_SESSION as $key => $value) {
				unset($_SESSION[$key]);
			}
			
			// user logout ok
			$this->load->view('user/includes/header');
			$this->load->view('user/logout/logout_success', $data);
			$this->load->view('user/includes/footer');
			
		} else {
			
			// there user was not logged in, we cannot logged him out,
			// redirect him to site root
			redirect('/');
			
		}
		
	}
	
}
