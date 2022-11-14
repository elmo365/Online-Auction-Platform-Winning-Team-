<?php include('config.php'); ?>
<?php include(INCLUDE_PATH . '/logic/userSignup.php'); ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>UserAccounts - Sign up</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
   
   <!-- Delayed Fixed navbar scrip -->
   <script type="text/javascript">
      document.addEventListener("DOMContentLoaded", function(){
        
        window.addEventListener('scroll', function() {
             
          if (window.scrollY > 200) {
            document.getElementById('navbar_top').classList.add('fixed-top');
            // add padding top to show content behind navbar
            navbar_height = document.querySelector('.navbar').offsetHeight;
            document.body.style.paddingTop = navbar_height + 'px';
          } else {
             document.getElementById('navbar_top').classList.remove('fixed-top');
             // remove padding top from body
            document.body.style.paddingTop = '0';
          } 
        });
      }); 
      // DOMContentLoaded  end
    </script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
  <!-- Custom styles -->
  <link rel="stylesheet" href="assets/css/style.css">

</head>
<body>
    <header>
        <?php include(INCLUDE_PATH . "/layouts/navbar.php") ?>
    </header>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <form class="form" action="signup.php" method="post" enctype="multipart/form-data">
          <h2 class="text-center">Sign up</h2>
          <hr>
           <!--username -->
          <div class="form-group <?php echo isset($errors['username']) ? 'has-error' : '' ?>">
            <label class="control-label">Username</label>
            <input type="text" name="username" class="form-control">
            <?php if (isset($errors['username'])): ?>
                <span class="help-block"><?php echo $errors['username'] ?></span>
            <?php endif; ?>
          </div>
           <!--First name -->
          <div class="form-group <?php echo isset($errors['firstname']) ? 'has-error' : '' ?>">
            <label class="control-label">First name</label>
            <input type="text" name="firstname" class="form-control">
            <?php if (isset($errors['firstname'])): ?>
                <span class="help-block"><?php echo $errors['firstname'] ?></span>
            <?php endif; ?>
          </div>
             <!--surname -->
          <div class="form-group <?php echo isset($errors['surname']) ? 'has-error' : '' ?>">
            <label class="control-label">Surname</label>
            <input type="text" name="surname" class="form-control">
            <?php if (isset($errors['surname'])): ?>
                <span class="help-block"><?php echo $errors['surname'] ?></span>
            <?php endif; ?>
          </div>
            <!--email -->
          <div class="form-group <?php echo isset($errors['email']) ? 'has-error' : '' ?>">
            <label class="control-label">Email Address</label>
            <input type="email" name="email" class="form-control">
            <?php if (isset($errors['email'])): ?>
                <span class="help-block"><?php echo $errors['email'] ?></span>
            <?php endif; ?>
          </div>

             <!--password -->
          <div class="form-group <?php echo isset($errors['password']) ? 'has-error' : '' ?>">
            <label class="control-label">Password</label>
            <input type="password" name="password" class="form-control">
            <?php if (isset($errors['password'])): ?>
                <span class="help-block"><?php echo $errors['password'] ?></span>
            <?php endif; ?>
          </div>
           <!--password confirmation -->
          <div class="form-group <?php echo isset($errors['passwordConf']) ? 'has-error' : '' ?>">
            <label class="control-label">Password confirmation</label>
            <input type="password" name="passwordConf" class="form-control">
            <?php if (isset($errors['passwordConf'])): ?>
                <span class="help-block"><?php echo $errors['passwordConf'] ?></span>
            <?php endif; ?>
          </div>

           <!--omang or passport number -->
           <div class="form-group <?php echo isset($errors['passwordConf']) ? 'has-error' : '' ?>">
            <label class="control-label">Omang or Passport number</label>
            <input type="text" name="omang" class="form-control">
            <?php if (isset($errors['omang'])): ?>
                <span class="help-block"><?php echo $errors['omang'] ?></span>
            <?php endif; ?>
          </div>

           <!--profile picture -->
          <div class="form-group" style="text-align: center;">
            <img src="http://via.placeholder.com/150x150" id="profile_img" style="height: 100px; border-radius: 50%" alt="">
            <!-- hidden file input to trigger with JQuery  -->
            <input type="file" name="profile_picture" id="profile_input" value="" style="display: none;">
          </div>
           <!--submit -->
          <div class="form-group">
            <button type="submit" name="signup_btn" class="btn btn-info btn-block">Sign up</button>
          </div>
          <p>Aready have an account? <a href="login.php">Sign in</a></p>
        </form>
      </div>
    </div>
  </div>
<?php include(INCLUDE_PATH . "/layouts/footer.php") ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="assets/js/display_profile_image.js"></script>