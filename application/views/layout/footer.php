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
<!--awal JS Untuk table -->
<script type="text/javascript">
$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });

    $("[data-toggle=tooltip]").tooltip();
});
</script>
<!-- akhir JS untu tabel -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="<?php echo base_url('/assets/js/vendor/jquery.min.js') ?>"><\/script>')</script>
<script src="<?php echo base_url('/assets/js/popper.min.js') ?>"></script>
<script src="<?php echo base_url('/assets/js/bootstrap.min.js') ?>"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</body>
</html>
