latest_stable=$(curl -fsSL 'https://install.portworx.com/1.4/?type=dock&stork=false' | awk '/image: / {print $2}')
  
sudo docker run --entrypoint /runc-entry-point.sh \
    --rm -i --privileged=true \
    -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx \
    $latest_stable --upgrade

sudo /opt/pwx/bin/px-runc install -c $1 \
    -k $2 \
    -d $3 \
    -m $4 \
    -s $5

sudo systemctl daemon-reload
sudo systemctl enable portworx
sudo systemctl start portworx
