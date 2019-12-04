# aliases for my vpn
alias vpn="sudo systemctl start openvpn-client@eliot.service"
alias novpn="sudo systemctl stop openvpn-client@eliot.service;sudo iptables -F;sudo iptables -X"

#aliases for jo=    
alias rvpn="sudo systemctl start openvpn-client@gerrit.egnew-bastion-rlr-euc1-mgmt.service"
alias norvpn="sudo systemctl stop openvpn-client@gerrit.egnew-bastion-rlr-euc1-mgmt.service"


