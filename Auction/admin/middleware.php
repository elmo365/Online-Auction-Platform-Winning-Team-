<?php

  // if user is NOT logged in, redirect them to login page
  if (!isset($_SESSION['user'])) {
    header("location: " . BASE_URL . "login.php");
  }
  // if user is logged in and this user is NOT an admin user, redirect them to landing page
  if (isset($_SESSION['user']) && is_null($_SESSION['user']['role'])) {
    header("location: " . BASE_URL);
  }
  // checks if logged in admin user can update post
  function canUpdatePost($post_id = null){
    global $conn;

    if(in_array('update-post', $_SESSION['userPermissions'])){
      if ($_SESSION['user']['role'] === "Seller") { // sellers can update only product posts that they themselves created
          $sql = "SELECT user_id FROM posts WHERE id=?";
          $post_result = getSingleRecord($sql, 'i', [$post_id]);
          $post_user_id = $post_result['user_id'];

          // if current user is the seller of the product, then they can update the product post
          if ($post_user_id === $user_id) {
            return true;
          } else { // if product post is not created by this seller
            return false;
          }
      } else { // if user is not seller
        return true;
      }
    } else {
      return false;
    }
  }

  // accepts user id and product post id and checks if user can publish/unpublish a post for their product
  function canPublishPost() {
    if(in_array(['permission_name' => 'publish-post'], $_SESSION['userPermissions'])){
      // echo "<pre>"; print_r($_SESSION['userPermissions']); echo "</pre>"; die();
      return true;
    } else {
      return false;
    }
  }

  function canDeletePost() {
    if(in_array('delete-post', $_SESSION['userPermissions'])){
      return true;
    } else {
      return false;
    }
  }
  function canCreateUser() {
    if(in_array('create-user', $_SESSION['userPermissions'])){
      return true;
    } else {
      return false;
    }
  }
  function canUpdateUser() {
    if(in_array('update-user', $_SESSION['userPermissions'])){
      return true;
    } else {
      return false;
    }
  }
  function canDeleteUser() {
    if(in_array('delete-user', $_SESSION['userPermissions'])){
      return true;
    } else {
      return false;
    }
  }
  function canCreateRole($role_id) {
    if(in_array('create-role', $_SESSION['userPermissions'])){
      return true;
    } else {
      return false;
    }
  }
  function canUpdateRole($role_id) {
    if(in_array('update-role', $_SESSION['userPermissions'])){
      return true;
    } else {
      return false;
    }
  }
  function canDeleteRole($user_id, $post_id) {
    if(in_array('delete-role', $_SESSION['userPermissions'])){
      return true;
    } else {
      return false;
    }
  }
?>