# aliases for my vpn
# alias vpn="sudo systemctl start openvpn-client@eliot.service"
# alias novpn="sudo systemctl stop openvpn-client@eliot.service;sudo iptables -F;sudo iptables -X"

#aliases for jo=    
# alias rvpn="sudo systemctl start openvpn-client@gerrit.egnew-bastion-rlr-euc1-mgmt.service"
# alias norvpn="sudo systemctl stop openvpn-client@gerrit.egnew-bastion-rlr-euc1-mgmt.service"


alias vpn="wg-quick up wg1"
alias novpn="wg-quick down wg1"

alias vpns="sudo systemctl start wg-quick@wg1"
alias novpns="sudo systemctl stop wg-quick@wg1"
