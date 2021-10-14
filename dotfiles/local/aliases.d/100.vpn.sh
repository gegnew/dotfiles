# aliases for my vpn
# alias vpn="sudo systemctl start openvpn-client@eliot.service"
# alias novpn="sudo systemctl stop openvpn-client@eliot.service;sudo iptables -F;sudo iptables -X"

#aliases for jo=    
# alias rvpn="sudo systemctl start openvpn-client@gerrit.egnew-bastion-rlr-euc1-mgmt.service"
# alias norvpn="sudo systemctl stop openvpn-client@gerrit.egnew-bastion-rlr-euc1-mgmt.service"


alias vpn="wg-quick up wg_admin"
alias novpn="wg-quick down wg_admin"

alias vpns="sudo systemctl start wg-quick@wg_admin"
alias novpns="sudo systemctl stop wg-quick@wg_admin"
