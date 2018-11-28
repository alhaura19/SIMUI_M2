<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="/favicon.ico">

  <title>Sistem Informasi Mahasiswa Universitas Indonesia</title>

  <!-- Bootstrap core CSS -->
  <link href="<?php echo base_url('assets/css/bootstrap.min.css') ?>" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<?php echo base_url('assets/css/main.css') ?>" rel="stylesheet">
</head>

<body>

  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">SIMUI</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item align-right">
          <a class="btn btn-primary" role="button" data-toggle="modal" href="#login">Login</a>
        </li>
        <li class="nav-item align-right">
          <a class="btn btn-secondary" href="#" role="button">Daftar</a>
        </li>
      </ul>
      <form class="form-sigin form-inline" action="<?php echo base_url('') ?>" method="POST">
  <div class="form-group">
    <input type="username" class="form-control" id="username" aria-describedby="emailHelp" placeholder="username" autofocus>
  </div>
  <div class="form-group">
    <input type="password" class="form-control" id="password" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  </form>
    </div>
  </nav>

	<main role="main">
 

	</main>

  <footer class="container-fluid">
    <nav class="navbar navbar-inverse navbar-fixed-bottom">
    <div class="container-fluid">
      <p class="navbar-text"><strong>Copyright BASDAT M2 Team</strong> 2018 <br>
    Halaman ini dimuat dalam waktu <strong>{elapsed_time}</strong> detik.<br>
    <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?></p>
    </div>
  </nav>
  </footer>

  <!-- Modal -->
  <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body">
          <form class="form-sigin" role="form" id="f_login" method="POST" action="<?php echo base_url('home') ?>">
            <div class="form-group">
              <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" name="username" id="username" placeholder="username" autofocus>
              <?php echo form_error('username'); ?>
            </div>
            <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" name="password" id="password" placeholder="Enter password">
              <?php echo form_error('password'); ?>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
            <button type="submit" name="btn-login" id="btn-login" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript
  ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="<?php echo base_url('/assets/js/vendor/jquery.min.js') ?>"><\/script>')</script>
  <script src="<?php echo base_url('/assets/js/popper.min.js') ?>"></script>
  <script src="<?php echo base_url('/assets/js/bootstrap.min.js') ?>"></script>
</body>
</html>
