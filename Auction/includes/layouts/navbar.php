<!-- the whole site is wrapped in a container div to give it some margin on the sides -->
<!-- closing container div can be found in the footer -->

<nav class="navbar navbar-expand-md navbar-default ">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">Winning Team</a>
      </div>
      
      <div class="collapse navbar-collapse d-flex flex-row-reverse" id="navbarSupportedContent">
        
        <ul class="navbar-nav navbar navbar-right  ">
            <?php if (isset($_SESSION['user'])): ?>

              <li class="nav-item ">
                <a class="nav-link"  href="#">Contact Us</a>
              </li>
              
              <li class="nav-item ">
                <a class="nav-link " href="#">P <span style="color: red;">0.00 </span></a>
              </li>
              
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#"  data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <?php echo $_SESSION['user']['username'] ?> <span class="caret"></span></a>

                <?php if (isAdmin($_SESSION['user']['id'])): ?>
                    <ul class="dropdown-menu">
                    <li><a href="<?php echo BASE_URL . 'admin/admineditProfile.php' ?>">Profile</a></li>
                    <li><a href="<?php echo BASE_URL . 'admin/dashboard.php' ?>">Dashboard</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="<?php echo BASE_URL . 'logout.php' ?>" style="color: red;">Logout</a></li>
                    </ul>
                <?php else: ?>
                    <ul class="dropdown-menu">
                    <li><a href="<?php echo BASE_URL . 'bidders/editProfile.php' ?>" style="color: blue;">Edit Your Profile</a></li>
                    <li><a href="<?php echo BASE_URL . 'wallet/deposit.php' ?>" style="color: blue;">Deposit</a></li>
                    <li><a href="<?php echo BASE_URL . 'logout.php' ?>" style="color: red;">Logout</a></li>
                    </ul>
                 
                <?php endif; ?>
                <ul class="navbar-nav ms-auto flex-nowrap mb-lg-0">
        
        
              
            
            
            </li>

            
            
            <?php else: ?>
            <li><a href="<?php echo BASE_URL . 'signup.php' ?>"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="<?php echo BASE_URL . 'login.php' ?>"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            <?php endif; ?>
        </ul>
            </div>
    </div>
  </nav>

  <nav id="navbar_top" class="navbar navbar-expand-lg bg-primary navbar-dark ">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarTogglerDemo02">
      <ul class="navbar-nav me-auto justify-content-start mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Auctions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">Live Auctions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">Live Auctions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">Live Auctions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">Live Auctions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">Live Auctions</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>