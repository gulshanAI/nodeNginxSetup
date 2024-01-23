#!bin/bash

echo "Enter the config name"
read confName
echo "Enter Domain name"
read domain
echo "Enter Port"
read port

v="$(cat <<-EOF
server {
        listen 80;
        server_name www.$domain;

        gzip on;
        gzip_proxied any;
        gzip_types application/javascript application/x-javascript text/css text/javascript;
        gzip_comp_level 5;
        gzip_buffers 16 8k;
        gzip_min_length 256;

        location / {
                proxy_pass http://127.0.0.1:$port;
                proxy_http_version 1.1;
                proxy_set_header Upgrade \$http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host \$host;
                proxy_cache_bypass \$http_upgrade;
        }
}

server {
    listen 80;
    server_name $domain;

    return 301 \$scheme://www.$domain\$request_uri;
}
server {
    listen 443;
    server_name $domain;

    return 301 \$scheme://www.$domain\$request_uri;
}
EOF
)"
echo "Creating conf file"
echo "$v" > /etc/nginx/sites-available/$confName

echo "Checking nginx config"
sudo nginx -t

echo "Nginx Restarting"
sudo systemctl reload nginx
