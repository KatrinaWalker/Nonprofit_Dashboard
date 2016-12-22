<!-- Look Mom - I can connect our database to our webspage now using PHP! -->
<?php
function connect_to_db() {    
    $host = "52.210.252.110";
    $dbuser = "gsepass";
    $dbpass = "gseuser";
    $dbname = "NPO";
    $link = mysql_connect($host,$dbuser,$dbpass);
    if (!$link) {
        die('Could not connect: ' . mysql_error());
    }   
    return $link;  
}