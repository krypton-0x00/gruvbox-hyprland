#!/usr/bin/python
import psutil
import socket
import sys


def get_args():
    if len(sys.argv) <= 1:
        sys.stderr.write("Usage: python widget.py <INTERFACE>")
        exit(-1)
    return sys.argv


def get_ip(interface):
    addrs = psutil.net_if_addrs()
    if interface not in addrs:
        return None
    for addr in addrs[interface]:
        if addr.family == socket.AF_INET:
            return addr.address

def main():
    args = get_args()
    interface = args[1]
    ip = get_ip(interface)
    print(ip)

main()
