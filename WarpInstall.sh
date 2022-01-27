sudo apt update
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
osVersion=`lsb_release -cs`
case $osVersion in
    focal|xenial|bullseye|buster|sketch) echo $osVersion is good to go;;
    *)    osVersion="bullseye";;
esac
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ '"$osVersion"' main' | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt update
sudo apt install cloudflare-warp -y
echo;echo;echo
echo now you can use 'warp-cli register' to register \(only required once\)
echo and use 'warp-cli connect' to connect
