<html>
<head>
  <title>Upload Form</title>
</head>
<body>

  <?php echo $error;?>

  <?php echo form_open_multipart('upload/di_upload');?>

  <input type="file" name="poster" size="20" />

  <br /><br />

  <input type="submit" value="upload" />

</form>

</body>
</html>
