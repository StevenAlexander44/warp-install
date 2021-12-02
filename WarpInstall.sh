sudo apt update
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo apt-key add -
echo 'deb http://pkg.cloudflareclient.com/ focal main' | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt update
sudo apt install cloudflare-warp -y
