sudo apt install wireguard openresolv -y
curl -Lo wgcf $(curl -s https://api.github.com/repos/ViRb3/wgcf/releases/latest | grep "https.*linux_amd64" | cut -d : -f 2,3 | tr -d \")
chmod u+x wgcf
sudo mv wgcf /bin
sudo -u root sh -c 'cd /etc/wireguard; printf "\n" | wgcf register && wgcf generate' &&
sudo mv /etc/wireguard/wgcf-profile.conf /etc/wireguard/warp.conf
wg-quick up warp
wg-quick down warp
echo wg-quick up warp
