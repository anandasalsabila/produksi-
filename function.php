<?php 
session_start();

//Membuat koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "simproduksi");


//Tambah barang
if(isset($_POST['addnewpengguna'])){
    $id_pengguna = $_POST['id_pengguna'];
    $username = $_POST['username'];
    $cek_by = $_POST['check_by'];
    $pengawas_line = $_POST['pengawas_line'];

    $addtotable = mysqli_query($conn,"insert into sec_pengguna (id_pengguna, username, check_by, pengawas_line) values('$id_pengguna','$username','$check_by', '$pengawas_line')");
    if($addtotable){
        header('location:pengguna.php');
    } else {
        echo 'Gagal';
        header('location:index.php');
    }
}


?>