#!/usr/bin/env python
__author__ = 'ma11ock'

from scapy.all import Ether,IP,TCP,sr1

# just showing a send receive layer 3 scapy request
pkt = sr(IP(dst="127.0.0.1")/ARP()/"XXX")
# pkt = (response, unanswered)
# breaks up our pkt into a response and unanswered section
response, no_response = _
# gives our full results
response[0]
# this gives us our results with the IP packet
response[0][1].show()

