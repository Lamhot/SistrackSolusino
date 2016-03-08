<?php

#Author Lamhot JM Siagian
$n = $_POST['num'];
echo "<p>Input Jumlah : $n</p>";
$status=1;
$num=3;
if($n>=1)
{
    echo "Bilangan Prima :";
    echo "2";
}
for($count=2;$count<=$n;)
{
    for($j=2;$j<=sqrt($num);$j++)
    {
        if($num%$j==0)
        {
            $status=0;
            break;
        }
    }
    if($status!=0)
    {
        echo ",".$num;
        $count++;
    }
    $status=1;
    $num++;
}
?>