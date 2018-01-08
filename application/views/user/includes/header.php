<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Site title</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">

	<!-- css -->
  <!-- Bootstrap core CSS-->
  <link href="<?= base_url('assets/template_admin/vendor/bootstrap/css/bootstrap.min.css') ?>" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="<?= base_url('assets/template_admin/vendor/font-awesome/css/font-awesome.min.css') ?>" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="<?= base_url('assets/template_admin/css/sb-admin.css') ?>" rel="stylesheet">
</head>
<body class="bg-dark pt-5">

    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="<?php echo base_url(""); ?>">leanCRUD</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
			<?php if (isset($_SESSION['username']) && $_SESSION['logged_in'] === true) : ?>
				<li class="nav-item"><a class="nav-link" href="<?= base_url('logout') ?>">Logout</a></li>
			<?php else : ?>
				<li class="nav-item"><a class="nav-link" href="<?= base_url('register') ?>">Register</a></li>
				<li class="nav-item"><a class="nav-link" href="<?= base_url('login') ?>">Login</a></li>
			<?php endif; ?>
          </li>
        </ul>
      </div>
    </nav>


	<main id="site-content" role="main">
