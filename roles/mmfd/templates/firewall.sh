# mmfd
ipt -A INPUT -i {{babel_interface}} -p udp --dport 27275 -j ACCEPT
# mmfd - respondd
ipt -A INPUT -i mmfd0 -p udp --dport 1001 -j ACCEPT
