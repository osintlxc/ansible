# babeld
ipt -A INPUT -i lo -p tcp --dport 33123 -j ACCEPT
ipt -A INPUT -i {{babel_interface}} -p udp --dport 6696 -j ACCEPT
ipt -A INPUT -i {{vpn_interface}} -p udp --dport 6696 -j ACCEPT

ipt6 -A FORWARD -i {{vpn_interface}} -o {{vpn_interface}} -j ACCEPT

ipt6 -A FORWARD -i br-ffhb -o {{vpn_interface}} -j ACCEPT
ipt6 -A FORWARD -i {{vpn_interface}} -o br-ffhb -j ACCEPT


## TEST-Services
## babelweb
# ipt -A INPUT -p tcp --dport 8080 -j ACCEPT
## yanic-webinterface
# ipt -A INPUT -p tcp --dport 8081 -j ACCEPT

## allow yanic recieve respondd from babel network
ipt -A INPUT -i {{babel_interface}} -p udp --sport 1001 -j ACCEPT
ipt -A INPUT -i {{vpn_interface}} -p udp --sport 1001 -j ACCEPT
ipt -A INPUT -i mmfd0 -p udp --sport 1001 -j ACCEPT

## allow yanic recieve respondd from batman-adv network
# ipt -A INPUT -i br-ffhb -p udp --sport 1001 -j ACCEPT
