<body>
  <header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="https://simui.herokuapp.com/"><img src="<?php echo base_url('assets/logo/fasilkom.png') ?>" width="30" height="30" class="d-inline-block align-top" alt=""> SIMUI
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
    <?php if($this->session->flashdata('success')){ ?>
     <div class="alert alert-success">
       <a href="#" class="close" data-dismiss="alert">&times;</a>
       <strong>Success!</strong> <?php echo $this->session->flashdata('success'); ?>
     </div>
   <?php } else if($this->session->flashdata('error')){ ?>
     <div class="alert alert-danger">
       <a href="#" class="close" data-dismiss="alert">&times;</a>
       <strong>Error!</strong> <?php echo $this->session->flashdata('error'); ?>
     </div>
   <?php } else if($this->session->flashdata('warning')){ ?>
     <div class="alert alert-warning">
       <a href="#" class="close" data-dismiss="alert">&times;</a>
       <strong>Warning!</strong> <?php echo $this->session->flashdata('warning'); ?>
     </div>
   <?php } else if($this->session->flashdata('info')){ ?>
     <div class="alert alert-info">
       <a href="#" class="close" data-dismiss="alert">&times;</a>
       <strong>Info!</strong> <?php echo $this->session->flashdata('info'); ?>
     </div>
   <?php } ?>
  </header>
