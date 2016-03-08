<?php

$host = "localhost";
$user = "root";
$pass = "";
$db = "file";
$connection = mysql_connect($host, $user, $pass) or die("Tidak terkoneksi!");
mysql_select_db($db) or die("Tidak dapat mengambil data dari database!");
if (file_exists("file.sql")) {#Apakah ada  file.sql?
    $file = file('file.sql');#Membaca file menjadi array
    $count = count($file);
    if ($count > 0) { # file tidak kosong
        $data_query = "INSERT into data(Nama, Umur, Lokasi, Pekerjaan) values"; #insert to database
        $i = 1;
        foreach ($file as $row) {
            $data = explode(',', $row);
            $data_query .= "('$data[0]','$data[1]','$data[2]','$data[3]')";
            $data_query .= $i < $count ? ',' : '';
            $i++;
        }
        mysql_query($data_query) or die(mysql_error());
        rename("file.sql", "file.bak");
        delete("test.sql");
        echo"<p>Sukses Insert data dari file.sql ke database!</p>";
    } else {
        echo"<p>File Kosong!</p>";
    }
} else {
    echo"<p>File tidak ditemukan!</p>";
}
?>
