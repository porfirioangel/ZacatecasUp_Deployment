<?php
    $info = file_get_contents('php://input');
    $data = json_decode($info, true);

    if ($data) {
        exec("sh /home/ubuntu/ZacatecasUp/deploy_rest.sh " .
            $data["repository"]["git_ssh_url"] . " " .
            $data["repository"]["name"] . " " .
            " > /home/ubuntu/ZacatecasUp/hook_log 2>&1");

        exec("sh /home/ubuntu/ZacatecasUp/send_email.sh " . 
            $data["repository"]["git_http_url"] . 
            " > /home/ubuntu/ZacatecasUp/email_rest_log 2>&1");
    } else {
        echo "No se recibieron datos en la petición";
    }
?>