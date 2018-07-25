#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p>DB Address: ${db_endpoint}</p>
<p>DB Password: ${db_password}</p>
EOF
nohup busybox httpd -f -p "${server_port}" &
