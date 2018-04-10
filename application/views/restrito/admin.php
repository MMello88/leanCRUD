<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>leanCRUD - Facilidade e Praticidade em Criar um Cadastro</title>

  <!-- ================= Favicon ================== -->
  <!-- Standard -->
  <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
  <!-- Retina iPad Touch Icon-->
  <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
  <!-- Retina iPhone Touch Icon-->
  <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
  <!-- Standard iPad Touch Icon-->
  <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
  <!-- Standard iPhone Touch Icon-->
  <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">


  <!-- Grocery Theme CSS-->
  <?php foreach($css_files as $file): ?>
  <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
  <?php endforeach; ?>

  <?php if (empty($css_files)) { ?>
  <!-- Bootstrap core CSS-->
  <link href="<?= base_url('assets/template_admin/vendor/bootstrap/css/bootstrap.min.css'); ?>" rel="stylesheet">
  <?php } ?>

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/jquery.min.js'); ?>"></script>

  <!-- Styles -->
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/weather-icons.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/owl.carousel.min.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/owl.theme.default.min.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/font-awesome.min.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/themify-icons.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/menubar/sidebar.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/bootstrap.min.css'); ?>" rel="stylesheet">

  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/helper.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/tamplate_focus/assets/css/style.css'); ?>" rel="stylesheet">
</head>

<body>
  <!-- # sidebar -->
  <div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
      <div class="nano">
          <div class="nano-content">
              <div class="logo"><a href="<?= site_url('admin')?>"><!-- <img src="assets/images/logo.png" alt="" /> --><span>Lean Crud</span></a></div>
              <ul>
              <?php if (isset($menus_admin))  : ?>
                <?php foreach ($menus_admin as $menu) : ?>
                  <?php if (!empty($menu['menu_titulo'])) : ?>
                    <li class="label"><?= $menu['menu_titulo']; ?></li>
                  <?php endif; ?>
                    <li class="active"><a class="sidebar-sub-toggle"><i class="<?= $menu['tag_i']; ?>"></i> <?= $menu['nome_menu']; ?> <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                  <ul>
                  <?php foreach ($menu['submenus'] as $submenu) : ?>
                    <?php if (empty($submenu['slug'])) : ?>
                      <li><a href='<?= site_url("admin/leanCRUD/{$submenu['tabela_id']}"); ?>'><?= $submenu['nome_submenu']; ?></a></li>
                    <?php else : ?> 
                      <li><a href='<?= site_url("admin/{$submenu['slug']}"); ?>'><?= $submenu['nome_submenu']; ?></a></li>
                    <?php endif; ?>
                  <?php endforeach; ?>
                  </ul>
                </li>
                <?php endforeach; ?>
              <?php endif; ?>
              
              <?php if (isset($menus)) : ?>
                <?php foreach ($menus as $menu) : ?>
                  <?php if (!empty($menu['menu_titulo'])) : ?>
                    <li class="label"><?= $menu['menu_titulo']; ?></li>
                  <?php endif; ?>                
                  <li class=""><a class="sidebar-sub-toggle"><i class="<?= $menu['tag_i']; ?>"></i> <?= $menu['nome_menu']; ?> <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                      <?php foreach ($menu['submenus'] as $submenu) : ?>
                        <?php if (empty($submenu['slug'])) : ?>
                          <li><a href='<?= site_url("admin/leanCRUD/{$submenu['tabela_id']}"); ?>'><?= $submenu['nome_submenu']; ?></a></li>
                        <?php else : ?> 
                          <li><a href='<?= site_url("admin/{$submenu['slug']}"); ?>'><?= $submenu['nome_submenu']; ?></a></li>
                        <?php endif; ?>
                      <?php endforeach; ?>
                    </ul>
                  </li>
                <?php endforeach; ?>
              <?php endif; ?>

                <li class="label"><?= $_SESSION['username'] ?></li>
                <li><a href="<?= base_url('logout') ?>"><i class="ti-close"></i> Logout</a></li>
              </ul>
          </div>
      </div>
  </div>
  <!-- /# sidebar -->

  <!-- # cabeçalho -->
  <div class="header">
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-12">
                  <div class="float-left">
                      <div class="hamburger sidebar-toggle">
                          <span class="line"></span>
                          <span class="line"></span>
                          <span class="line"></span>
                      </div>
                  </div>
                  <div class="float-right">
                      <ul>
						  <!--
                          <li class="header-icon dib"><i class="ti-bell"></i>
                              <div class="drop-down">
                                  <div class="dropdown-content-heading">
                                      <span class="text-left">Recent Notifications</span>
                                  </div>
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <li>
                                              <a href="#">
                                                  <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                                  <div class="notification-content">
                                                      <small class="notification-timestamp pull-right">02:34 PM</small>
                                                      <div class="notification-heading">Mr. John</div>
                                                      <div class="notification-text">5 members joined today </div>
                                                  </div>
                                              </a>
                                          </li>
                                          <li class="text-center">
                                              <a href="#" class="more-link">See All</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </li>
                          <li class="header-icon dib"><i class="ti-email"></i>
						  -->
                              <div class="drop-down">
                                  <div class="dropdown-content-heading">
                                      <span class="text-left">2 New Messages</span>
                                      <a href="email.html"><i class="ti-pencil-alt pull-right"></i></a>
                                  </div>
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <li class="notification-unread">
                                              <a href="#">
                                                  <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/1.jpg" alt="" />
                                                  <div class="notification-content">
                                                      <small class="notification-timestamp pull-right">02:34 PM</small>
                                                      <div class="notification-heading">Michael Qin</div>
                                                      <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                  </div>
                                              </a>
                                          </li>
                                          <li class="text-center">
                                              <a href="#" class="more-link">See All</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </li>
                          <li class="header-icon dib"><span class="user-avatar"><?= $_SESSION['username'] ?> <i class="ti-angle-down f-s-10"></i></span>
                              <div class="drop-down dropdown-profile">
                                  <!--<div class="dropdown-content-heading">
                                  </div>-->
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <!--<li><a href="#"><i class="ti-user"></i> <span>Profile</span></a></li>-->
                                          <li><a href="<?= base_url('logout') ?>"><i class="ti-power-off"></i> <span>Logout</span></a></li>
                                      </ul>
                                  </div>
                              </div>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- /# cabeçalho -->

  <div class="content-wrap">
      <div class="main">
          <div class="container-fluid">
              <!-- /# main titulo -->
              <div class="row"> 
                  <div class="col-lg-8 p-r-0 title-margin-right">
                      <div class="page-header">
                          <div class="page-title">
                              <h1><?= $_SESSION['username'] ?>, <span>Seja bem vindo</span></h1>
                          </div>
                      </div>
                  </div>
                  <!-- /# column -->
                  <div class="col-lg-4 p-l-0 title-margin-left">
                      <div class="page-header">
                          <div class="page-title">
                              <ol class="breadcrumb">
								  <?php if (isset($tabelas)) : ?>
										<?php foreach($tabelas as $key => $tabela) : ?>
											<?php if ($key == (count($tabelas) - 1)) : ?>
												<li class="breadcrumb-item active"><?= $tabela['display']; ?></li>
											<?php else : ?>
												<li class="breadcrumb-item"><a href="<?= site_url("admin/leanCRUD/{$tabela['tabela_id']}"); ?>"><?= $tabela['display']; ?></a></li>
											<?php endif; ?>
										<?php endforeach; ?>
									<?php endif; ?>
                              </ol>
                          </div>
                      </div>
                  </div>
                  <!-- /# column -->
              </div>
              <!-- /# fim main titulo -->

              
              <section id="main-content">
                <?php if (isset($main_page)) : ?>
                  <!-- /# row -->
                  <div class="row">
                      <div class="col-lg-3">
                          <div class="card">
                              <div class="stat-widget-two">
                                  <div class="stat-content">
                                      <div class="stat-text">Cadastro</div>
                                      <div class="stat-digit">Tabelas</div>
                                  </div>
                                  <div class="progress">
                                      <div class="progress-bar progress-bar-success w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <?php /*
                      <?php if (isset($menus)) :  print_r($menus)?>
                        <?php foreach ($menus as $menu) : ?>
                          <?php if ($menu['group_user_ref_id'] === '1') : ?>
                            <div class="col-lg-3">
                              <div class="card">
                                <div class="stat-widget-two">
                                  <div class="stat-content">
                                    <div class="stat-text">Cadastro</div>
                                    <div class="stat-digit"><a href='<?= site_url("admin/leanCRUD/{$menu['tabela_id']}"); ?>'><?= $menu['display']; ?></a></div>
                                  </div>
                                  <div class="progress">
                                    <div class="progress-bar progress-bar-success w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          <?php endif; ?>
                        <?php endforeach; ?>
                      <?php endif; ?>
                      */ ?>

                      
                  </div>
                  <!-- /# row -->
                <?php else : ?>

                  <div class="row">
                    <div class="col-lg-12">
                        <div class="card nestable-cart">
                            <div class="card-title">
                                <?php if (isset($tabelas)) : ?>
									<?php foreach($tabelas as $key => $tabela) : ?>
										<?php if ($key == (count($tabelas) - 1)) : ?>
											<h4><?= $tabela['display']; ?></h4>
										<?php endif; ?>
									<?php endforeach; ?>
                                <?php endif; ?>
                                <div class="card-title-right-icon">
                                    <?php echo $output; ?>
                                </div>
                            </div>
                        </div>
                      </div>
                  </div>

                <?php endif; ?>

                  

                  <div class="row">
                      <div class="col-lg-12">
                          <div class="footer">
                              <p>2018 © Lean Crud. - <a href="<?= site_url(); ?>"><?= site_url(); ?></a></p>
                          </div>
                      </div>
                  </div>
              </section>
          </div>
      </div>
  </div>
  <div id="search">
      <button type="button" class="close">×</button>
      <form>
          <input type="search" value="" placeholder="type keyword(s) here" />
          <button type="submit" class="btn btn-primary">Search</button>
      </form>
  </div>
  <!-- jquery vendor -->
  
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/jquery.nanoscroller.min.js'); ?>"></script>
  <!-- nano scroller -->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/menubar/sidebar.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/preloader/pace.min.js'); ?>"></script>
  <!-- sidebar -->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/bootstrap.min.js'); ?>"></script>

  <!-- bootstrap -->

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/circle-progress/circle-progress.min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/circle-progress/circle-progress-init.js'); ?>"></script>

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/morris-chart/raphael-min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/morris-chart/morris.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/morris-chart/morris-init.js'); ?>"></script>

  <!--  flot-chart js -->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/flot-chart/jquery.flot.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/flot-chart/jquery.flot.resize.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/flot-chart/flot-chart-init.js'); ?>"></script>
  <!-- // flot-chart js -->


  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/jquery.vmap.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/jquery.vmap.min.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/jquery.vmap.sampledata.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.world.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.algeria.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.argentina.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.brazil.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.france.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.germany.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.greece.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.iran.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.iraq.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.russia.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.tunisia.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.europe.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.usa.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/vector.init.js'); ?>"></script>

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/weather/jquery.simpleWeather.min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/weather/weather-init.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/owl-carousel/owl.carousel.min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/owl-carousel/owl.carousel-init.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/scripts.js'); ?>"></script>
  <!-- scripit init-->


    <?php foreach($js_files as $file): ?>
        <script src="<?php echo $file; ?>"></script>
    <?php endforeach; ?>
</body>

</html>
