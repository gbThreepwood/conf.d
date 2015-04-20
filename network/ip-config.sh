ip addr add 192.168.1.2/24 dev enp3s0
ip link set enp3s0 up
ip route add default via 192.168.1.1
