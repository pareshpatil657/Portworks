latest_stable=$(curl -fsSL 'https://install.portworx.com/1.4/?type=dock&stork=false' | awk '/image: / {print $2}')
  
sudo docker run --entrypoint /runc-entry-point.sh \
    --rm -i --privileged=true \
    -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx \
    $latest_stable --upgrade

sudo /opt/pwx/bin/px-runc install -c "pwx_cluster_portal" \
    -k consul://172.21.0.183:8500 \
    -d eth0 \
    -m eth0 \
    -s /dev/vdb

sudo systemctl daemon-reload
sudo systemctl enable portworx
sudo systemctl start portworx
