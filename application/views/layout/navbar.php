<body>
  <header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">SIMUI
        <?php if (isset($_SESSION['type'])) {
        echo $_SESSION['type'];
      } ?></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="<?php echo base_url('home'); ?>">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item align-right">
            <a class="nav-link" href="<?php echo base_url('c_organisasi'); ?>"> Organisasi</a>
          </li>
          <li class="nav-item align-right">
            <a class="nav-link" href="<?php echo base_url('c_kepanitiaan'); ?>"> Kepanitiaan</a>
          </li>
          <li class="nav-item align-right">
            <a class="nav-link" href="<?php echo base_url('c_event'); ?>"> Event</a>
          </li>
          <li class="nav-item align-right">
          </li>
        </ul>
        <?php
        if (isset($_SESSION['type'])) {
          include ('tombol_logout.php');
        }else {
          include ('tombol_login.php');
        }
         ?>
      </div>
    </nav>
  </header>
