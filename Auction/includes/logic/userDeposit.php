
<?php include(INCLUDE_PATH . "/logic/common_functions.php"); ?>

<?php


    // variable declaration
    $user_id = $_SESSION['user']['id'];
    //$wallet = getWallet($user_id);
    $amount = "";
    
    $errors  = [];
    if (isset($_POST['deposit_btn'])){  
        //echo $wallet;
        $amount = $_POST['amount'];
        echo $amount;

    }
?>