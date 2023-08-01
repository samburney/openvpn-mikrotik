## Lightweight OpenVPN + FRRouting Container
Created for use on MikroTik Routers, but will work anywhere.

### Supported Environment Variables

- LOCAL_NETWORKS: Your local networks (For a reverse route)
- CONTAINER_GATEWAY: The gateway to point the LOCAL_NETWORKS prefixes at
- FRR_DAEMONS: Enable routing daemons if you want to add dynamic routing

### Usage
```
/container envs
add key=LOCAL_NETWORKS name=openvpn value=x.x.x.x/x
add key=CONTAINER_GATEWAY name=openvpn value=172.16.0.1

/container mounts
add dst=/etc/openvpn name=openvpn_openvpn src=/containers/data/openvpn/openvpn
add dst=/etc/frr name=openvpn_frr src=/containers/data/openvpn/frr

/container
add dns=8.8.8.8,9.9.9.9 envlist=openvpn hostname=openvpn interface=veth1 mounts=openvpn_openvpn,openvpn_frr root-dir=containers/root-dirs/openvpn start-on-boot=yes
```