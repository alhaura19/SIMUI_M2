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
  <header>
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
            <a class="nav-link" href="#"> Organisasi</a>
          </li>
          <li class="nav-item align-right">
            <a class="nav-link" href="#"> Kepanitiaan</a>
          </li>
          <li class="nav-item align-right">
            <a class="nav-link" href="#"> Event</a>
          </li>
          <li class="nav-item align-right">
          </li>
        </ul>
        <a class="btn btn-primary float-right" role="button" data-toggle="modal" href="#login"><span class="glyphicon glyphicon-log-in"></span>Login</a>
      </div>
    </nav>
  </header>

  <main role="main">
    <div class="container-fluid ">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4 border pt-4" >
          <h2>Organisasi</h2>
          <p><a class="btn btn-secondary" href="<?php echo base_url('c_organisasi'); ?>" role="button">Lihat Organisasi &raquo;</a></p>
        </div>
        <div class="col-md-4 border pt-4">
          <h2>Kepanitiaan</h2>
          <p><a class="btn btn-secondary" href="index.php/c_kepanitiaan" role="button">Lihat Kepanitiaan &raquo;</a></p>
        </div>
        <div class="col-md-4 border pt-4" >
          <h2>Event</h2>
          <p><a class="btn btn-secondary" href="index.php/c_event" role="button">Lihat Event &raquo;</a></p>
        </div>
      </div>
    </div> <!-- /container -->
  </main>

  <footer class="footer">
    <div class="container">
      <span class="text-muted"><strong>Copyright BASDAT M2 Team</strong> 2018</span>
    </div>
  </footer>

  <!-- Modal -->
  <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel">Silahkan Login</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="form-sigin" role="form" id="login" method="POST" action="<?php echo base_url('home') ?>">
            <div class="form-group">
              <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" name="username" id="username" placeholder="Masukan username" autofocus>
              <?php echo form_error('username'); ?>
            </div>
            <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" name="password" id="password" placeholder="Masukan password">
              <?php echo form_error('password'); ?>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
          </div>
          <div class="modal-footer">
            <div class="form-group">
              <button type="submit" name="btn-login" id="btn-login" class="btn btn-primary" ><span class="glyphicon glyphicon-off"></span> Login</button>
            </div>
          </div>
        </form>
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
