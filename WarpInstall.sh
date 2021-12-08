sudo apt update
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
osVersion=`dpkg --status tzdata|grep Provides|cut -f2 -d'-'`
case $osVersion in
    focal|xenial|bullseye|buster|sketch) echo good to go;;
    *)    echo choose from focal, xenial, bullseye, buster, or sketch; read osVersion;;
esac
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ '"$osVersion"' main' | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt update
sudo apt install cloudflare-warp -y
