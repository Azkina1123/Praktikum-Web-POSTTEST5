<?php

$con = mysqli_connect("localhost", "root", "", "tarvita_pastel");

function new_class($product_type) {
  if ($product_type == "painting") {
    $paintings = get_from_db(
      "SELECT id FROM products
      WHERE id LIKE '%painting%'"
    );
    
    return "painting-" . (count($paintings)+1);
    
  } else if ($product_type == "tool") {
    $tools = get_from_db(
      "SELECT id FROM products
      WHERE id LIKE '%tool%'"
    );
    return "tool-" . (count($tools)+1);
  }

  return false;
}

function get_img_name($product_type) {
  $error = $_FILES["image"]["error"];   
  
  // kalau tidak upload, tidak apa
  if ($error === 4) {
    return "new-product.png";
  }
  
  $name  = $_FILES["image"]["name"];    // nama file
  $type  = $_FILES["image"]["type"];    // jenis file
  $temp  = $_FILES["image"]["tmp_name"];// direktory file
  $size  = $_FILES["image"]["size"];    // ukuran file
  
  // jika lebih dari 1 MB gagal upload
  if ($size > 100000) { // 1 MB   
    echo "<script> alert('Add product failed! (max size: 100KB)') </script>";
    header("Refresh(0)");

    return false; // keluar dari fungsi
  }
  
  $possibility = explode(".", $name);
  $format = end($possibility);
  $name = new_class($product_type) .".$format";

  return $name;

}

function len_table($table) {
  global $con;
  $result = mysqli_query(
    $con,
    "SELECT * FROM $table"
  );
  return $result->num_rows;
}

function add_to_db() {
  global $con;

  $product_type = $_GET["product"];
  $id = new_class($product_type);
  $released_date = $_POST["date"];
  $name = htmlspecialchars($_POST["name"]);
  $price = $_POST["price"];
  $desc = htmlspecialchars($_POST["desc"]);
  $stock = $_POST["stock"];
  $net = $_POST["net"];
  $width = $_POST["width"];
  $height = $_POST["height"];
  $frame = htmlspecialchars($_POST["frame"]);
  $technic = htmlspecialchars($_POST["technic"]);
  $material = htmlspecialchars($_POST["material"]);
  $packing_list = htmlspecialchars($_POST["packing_list"]);
  $image = "new-product.png";

  if (get_img_name($product_type)) {
    $image = htmlspecialchars(get_img_name($product_type));

    // pindahkan file yg di up
    move_uploaded_file($_FILES["image"]["tmp_name"], "img/products/$image");
  }


  $result = mysqli_query(
    $con,
    "INSERT INTO products 
     VALUES (
      '$id', 
      '$released_date', 
      '$name', 
      $price, 
      '$desc',
      $stock, 
      '$net', 
      '$width', 
      '$height', 
      '$frame', 
      '$technic', 
      '$material', 
      '$packing_list', 
      '$image'
    )"
  );
  
  if (!$result) {
    echo "<script> alert('Product failed added!'); </script>";
    return false;
  }

  echo "<script> alert('Product added successfully!'); </script>";
  return true;
}

function get_from_db($query) {
  global $con;
  $result = mysqli_query(
    $con,
    $query
  );

  $rows = [];
  while ($row = mysqli_fetch_assoc($result)) {
    $rows[] = $row;
  }

  return $rows;
}

function update_to_db() {
  global $con;

  $product_type = $_GET["product"];

  $id = $_POST["id"];
  $released_date = $_POST["date"];
  $name = htmlspecialchars($_POST["name"]);
  $price = $_POST["price"];
  $desc = htmlspecialchars($_POST["desc"]);
  $stock = $_POST["stock"];
  $net = $_POST["net"];
  $width = $_POST["width"];
  $height = $_POST["height"];
  $frame = htmlspecialchars($_POST["frame"]);
  $technic = htmlspecialchars($_POST["technic"]);
  $material = htmlspecialchars($_POST["material"]);
  $packing_list = htmlspecialchars($_POST["pack"]);
  $image = $_POST["prev_image"];

  if (get_img_name($product_type)) {
    $image = htmlspecialchars(get_img_name($product_type));

    // pindahkan file yg di up
    move_uploaded_file($_FILES["image"]["tmp_name"], "img/products/$image");
  } 

  $result = mysqli_query(
    $con,
    "UPDATE products 
     SET 
      released_date='$released_date', 
      name='$name', 
      price=$price, 
      description='$desc',
      stock=$stock, 
      net=$net, 
      width=$width, 
      height=$height, 
      frame='$frame', 
      technic='$technic', 
      material='$material', 
      packing_list='$packing_list', 
      image='$image'
     WHERE id='$id'"
  );
  
  if (!$result) {
    echo "<script> alert('Product failed added!'); </script>";
    return false;
  }

  echo "<script> alert('Product added successfully!'); </script>";
  return true;

}

function delete_from_db() {
  global $con;

  $id = $_GET["product"];

  $result = mysqli_query(
    $con,
    "DELETE FROM products WHERE id='$id'"
  );
  return true;
}

?>