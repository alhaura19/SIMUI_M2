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
  <link href="assets/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="assets/css/main.css" rel="stylesheet">
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
          <left><a class="btn btn-primary" role="button" data-toggle="modal" href="<?php echo base_url() ?>home/logout/">Logout</a><left>
        </li>
        <li class="nav-item align-right">
          <p class="align-center">Selamat Datang <b><?=$username?></b> di halaman Administrator System</p>
        </li>
      </ul>
    </div>
  </nav>

  <main role="main">
    <div class="container-fluid">
      <!-- Example row of columns -->
      <div class="row">
      </div>
      <div class="row">
        <div class="col-md-4 border" >
          <h2>Organisasi</h2>
          <p><a class="btn btn-secondary" href="#" role="button">Lihat Organisasi &raquo;</a></p>
        </div>
        <div class="col-md-4 border ">
          <h2>Kepanitiaan</h2>
          <p><a class="btn btn-secondary" href="#" role="button">Lihat Kepanitiaan &raquo;</a></p>
        </div>
        <div class="col-md-4 border" >
          <h2>Event</h2>
          <p><a class="btn btn-secondary" href="#" role="button">Lihat Event &raquo;</a></p>
        </div>
      </div>

      <hr>

    </div> <!-- /container -->

  </main>

  <footer class="container-fluid">
    <p>&copy; Company 2017-2018</p>
  </footer>

  <!-- Bootstrap core JavaScript
  ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="/assets/js/vendor/jquery.min.js"><\/script>')</script>
  <script src="/assets/js/popper.min.js"></script>
  <script src="/assets/js/bootstrap.min.js"></script>
</body>
</html>
