#!/usr/bin/env python
"""
ping waybar widget
Ansible managed
"""
import subprocess
import json
import sys

def check_internet():
    """
    Try to ping a host in the internet,
    then return true or false
    """
    try:
        subprocess.check_call(['ping', '-c', '2', 'c3woc.de'],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return True
    except subprocess.CalledProcessError:
        return False

def main():
    """
    parsing internet status and create output
    """
    internet_status = check_internet()
    if internet_status:
        status = {
            "text": "Online",
            "tooltip": "Internet connection is active",
            "class": "pingonline"
        }
    else:
        status = {
            "text": "Offline",
            "tooltip": "No internet connection",
            "class": "pingoffline"
        }
    print(json.dumps(status))
    sys.stdout.flush()

if __name__ == "__main__":
    main()
