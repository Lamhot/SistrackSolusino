<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Aplikasi Google Map dengan PHP</title>
        <style>
            body{
                font-family:arial;
                font-size:.8em;
            }

            input[type=text]{
                padding:0.5em;
                width:20em;
            }

            input[type=submit]{
                padding:0.4em;
            }

            #gmap_canvas{
                width:100%;
                height:30em;
            }

            #map-label,
            #address-examples{
                margin:1em 0;
            }
        </style>

    </head>
    <body>

        <?php
        #Author Lamhot JM Siagian
        if ($_POST) {

            // Menerima latitude, longitude dan format alamat
            $data_arr = geocode($_POST['address']);

            // Jika alamat yang dicari ada
            if ($data_arr) {

                $latitude = $data_arr[0];
                $longitude = $data_arr[1];
                $formatted_address = $data_arr[2];
                ?>

                <!-- google map akan di tampilkan pada code berikut -->
                <div id="gmap_canvas">Memuat peta...</div>
                <div id='map-label'>Peta menampilkan perkiraan lokasi </div>
                <?php echo $formatted_address . '<p>Latitude&nbsp;&nbsp;&nbsp;:' . $latitude . '</p>' . '<p>Longitude:' . $longitude . '</p>' ?>

                <!-- Java script untuk menamplkan google map -->
                <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>    
                <script type="text/javascript">
                    function init_map() {
                        var myOptions = {
                            zoom: 14,
                            center: new google.maps.LatLng(<?php echo $latitude; ?>, <?php echo $longitude; ?>),
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);
                        google.maps.event.addListener(map, 'click', function(event) {
                            addMarker(event.latLng);
                        });

                        google.maps.event.addListener(map, 'rightclick', function(event) {
                            marker.setMap(null);
                        });
                        marker = new google.maps.Marker({
                            map: map,
                            position: new google.maps.LatLng(<?php echo $latitude; ?>, <?php echo $longitude; ?>)
                        });
                        infowindow = new google.maps.InfoWindow({
                            content: "<?php echo $formatted_address; ?>"
                        });
                        google.maps.event.addListener(marker, "click", function () {
                            infowindow.open(map, marker);
                        });
                        infowindow.open(map, marker);
                                
                    }
                    function addMarker(location) {
        var marker = new google.maps.Marker({
        position: location,
        map: map
    });
    google.maps.event.addListener(marker, 'rightclick', function(event) {
        marker.setMap(null);
    });

    markers.push(marker);
}
                    google.maps.event.addDomListener(window, 'load', init_map);
                </script>

                <?php
                // Jika tidak ditemukan
            } else {
                echo "Peta tidak ditemukan";
            }
        }
        ?>
        <!-- Formmasukan alamat yang akan dicari -->
        <form action="" method="post">
            <input type='text' name='address' placeholder='Masukkan alamat Anda' />
            <input type='submit' value='Lihat Peta' />
        </form>

        <?php

        function geocode($address) {

            //$address inputan dari textfield
            $address = urlencode($address);

            // URL layanan google map
            $url = "http://maps.google.com/maps/api/geocode/json?sensor=false&address={$address}";

            // menerima respon JSON 
            $resp_json = file_get_contents($url);

            // JSon
            $resp = json_decode($resp_json, true);
            // Status akan ok jika, inputan ada ditemukan
            if ($resp['status'] == 'OK') {
                // mendapatkan data penting
                $lati = $resp['results'][0]['geometry']['location']['lat'];
                $longi = $resp['results'][0]['geometry']['location']['lng'];
                $formatted_address = $resp['results'][0]['formatted_address'];

                // Memastiakn bahwa data lengkap
                if ($lati && $longi && $formatted_address) {

                    // simpan pada sebuah array
                    $data_arr = array();

                    array_push(
                            $data_arr, $lati, $longi, $formatted_address
                    );

                    return $data_arr;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
        ?>
    </body>
</html>