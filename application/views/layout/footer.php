<footer class="footer">
  <div class="container">
    <span class="text-muted"><strong>Copyright BASDAT M2 Team</strong> 2018</span>
  </div>
</footer>

<!-- Modal -->
<div class="modal fade" id="login" role="dialog" tabindex="-1"  aria-labelledby="login" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginLabel">Silahkan Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-sigin" role="form" id="login_form" method="POST" action="<?php echo base_url('home') ?>">
          <div class="form-group">
            <label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
            <input type="text" class="form-control" name="username" id="username" placeholder="Masukan username" autofocus>
            <?php echo form_error('username'); ?>
          </div>
          <div class="form-group">
            <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Masukan password">
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
</body>
<!-- JS -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<?php echo base_url('/assets/js/jquery.min.js') ?>"><\/script>')</script>
<script src="<?php echo base_url('/assets/js/popper.min.js') ?>"></script>
<script src="<?php echo base_url('/assets/js/bootstrap.min.js') ?>"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo base_url('/assets/css/jquery.datetimepicker.min.css') ?> "/>
<script src="<?php echo base_url('/assets/js/jquery.datetimepicker.full.min.js') ?> "></script>
<!--awal JS Untuk table -->
<script>
/** JavaScript untuk fungsi alert */
$(window).bind("load", function() {
  window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function() {
      $(this).remove();
    });
  }, 500);
})
</script>
<script>
$(document).ready(function() {
	var pathname = window.location.pathname;
	$('.navbar-nav > li > a[href="'+pathname+'"]').parent().addClass('active');
})
</script>
<!-- akhir JS untu tabel -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script>
$('#table').DataTable( {
  autoFill: true
} );
</script>
<script>
jQuery.datetimepicker.setLocale('id');
$('#tanggal').datetimepicker({
  format: 'Y-m-d',
  weekStart: 1,
  todayBtn:  true,
  autoclose: true,
  todayHighlight: true,
  startView: 2,
  minView: 2,
  forceParse: 0
});
</script>
<script>
jQuery('#waktu').datetimepicker({
  datepicker:false,
  format:'H:i'
});
</script>
</html>
