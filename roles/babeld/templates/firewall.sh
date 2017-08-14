# babeld
ipt -A INPUT -i lo -p tcp --dport 33123 -j ACCEPT
ipt -A INPUT -i {{babel_interface}} -p udp --dport 6696 -j ACCEPT

# l3roamd
ipt -A INPUT -i {{babel_interface}} -p udp --dport 5523 -j ACCEPT

# mmfd
ipt -A INPUT -i {{babel_interface}} -p udp --dport 27275 -j ACCEPT

# mmfd - respondd
ipt -A INPUT -i mmfd0 -p udp --dport 1001 -j ACCEPT

## TEST-Services
#babelweb
ipt -A INPUT -p tcp --dport 8080 -j ACCEPT

#yanic
ipt -A INPUT -p tcp --dport 8081 -j ACCEPT
# allow yanic recieve respondd from babel network
ipt -A INPUT -i {{babel_interface}} -p udp --sport 1001 -j ACCEPT
# allow yanic recieve respondd from batman-adv network
#ipt -A INPUT -i br-ffhb -p udp --sport 1001 -j ACCEPT
