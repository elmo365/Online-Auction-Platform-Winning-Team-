<?php include("config.php") ?>
<?php include(INCLUDE_PATH . "/logic/common_functions.php"); ?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Online Auction Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
   
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
  <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
  </head>
  <body>
    <header class="container-fluid">

    <?php  include(INCLUDE_PATH . "/layouts/messages.php") ?>
    <?php include(INCLUDE_PATH . "/layouts/navbar.php") ?>
    
     
      
    </header>
    <?php include(INCLUDE_PATH . "/banner.php") ?>
    <div class="container-fluid bg-info">
      <div class="container py-2">
        
        <div class="row text-white">
          <div class="col">
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif; font-size: calc(1rem + 1vw);">50</h5>
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif;">Auctions Available</h5>
          </div>
          <div class="col">
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif; font-size: calc(1rem + 1vw);">16</h5>
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif;">Bidders</h5>
          </div>
          <div class="col">
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif; font-size: calc(1rem + 1vw);">20</h5>
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif;">Sale Auctions</h5>
          </div>

          <div class="col">
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif; font-size: calc(1rem + 1vw);">2</h5>
            <h5 class = "text-center" style="font-family: 'Josefin Sans', sans-serif;">Live Auctions</h5>
          </div>
        </div>
      </div>
      </div>
      <?php include(INCLUDE_PATH . "/layouts/footer.php") ?>
    