<?php

$jumlah = $_POST['jumlah'];
echo "<p>Input Jumlah : $jumlah <br>Hasil:</br></p>";
if ($jumlah > 0) {
    function number_diamond($a) {
        for ($i = 0; $i < $a; $i++) {
            for ($j = $a + 1; $j > $i; $j--)
                echo '&nbsp&nbsp';
            for ($k = 0; $k < $i - 1; $k++)
                echo $k;
            for ($s = $i - 1; $s >= 0; $s--)
                echo $s;
            echo '<br>';
        }
        for ($i = 0; $i < $a; $i++) {
            for ($j = 0; $j <= $i; $j++)
                echo '&nbsp&nbsp';
            for ($k = 0; $k < ($a - $i) - 1; $k++)
                echo $k;
            for ($s = ($a - $i) - 1; $s >= 0; $s--)
                echo $s;
            echo '<br>';
        }
    }
    number_diamond($jumlah);
} else {
    echo'';
}
?>
