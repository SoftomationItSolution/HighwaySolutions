from scapy.all import ARP, Ether, srp

def scan_local_network(ip_range):
    arp_request = ARP(pdst=ip_range)
    ether = Ether(dst="ff:ff:ff:ff:ff:ff")  # Broadcast MAC address
    arp_broadcast = ether / arp_request
    answered_list = srp(arp_broadcast, timeout=1, verbose=False)[0]

    clients_list = []
    for element in answered_list:
        client_dict = {"ip": element[1].psrc, "mac": element[1].hwsrc}
        clients_list.append(client_dict)

    return clients_list

# Example usage
local_network = "192.168.1.0/24"  # Adjust the IP range as per your network
devices = scan_local_network(local_network)
for device in devices:
    #print(f"IP: {device['ip']}, MAC: {device['mac']}")
    print(device)
