#!/usr/bin/env python3

import time
import os
import re
import json
import sys
import logging
import subprocess
import argparse

logger = logging.getLogger(__name__)


## Calls bluetoothctl and returns result
def call_bluetoothctl(command, subcommand, args):
    result = subprocess.run(
        ["bluetoothctl", command, subcommand],
        capture_output=True,  # Python >= 3.7 only
        text=True,  # Python >= 3.7 only
    )
    return result.stdout


## Returns a list containing all Connected Devices (names and addresses)
## as json objects in a list
def get_devices(args):
    raw_devices = call_bluetoothctl("devices", "Connected", args)
    devices = []

    for line in raw_devices.splitlines():
        split_line = line.split(" ")
        devices.append({"hwaddress": split_line[1], "name": split_line[2]})

    if args.no_devices:
        devices = []
    return devices


## Gets more information about given device and returns it
def get_device_infos(raw_device, parameters, args):
    # print(raw_device)
    device = {}
    for param in parameters:
        if param == "battery percentage":
            re_comp = re.compile(r"\s*%s: 0x.. \((\d*)\)" % param, re.IGNORECASE)
        else:
            re_comp = re.compile(r"\s*%s: (.*)" % param, re.IGNORECASE)

        if result := re_comp.search(raw_device):
            device.update({param: result.group(1)})

    # print(device)
    return device


def parse_arguments():
    parser = argparse.ArgumentParser()

    parser.add_argument("-v", "--verbose", action="count", default=0)
    parser.add_argument(
        "--no_devices",
        default=0,
        action="store_true",
        help="Fake currently no devices connected",
    )

    group = parser.add_mutually_exclusive_group(required=False)
    group.add_argument(
        "--no",
        dest="powered",
        const="no",
        action="store_const",
        help="Fake bluetooth controller powered off state",
    )
    group.add_argument(
        "--yes",
        dest="powered",
        const="yes",
        action="store_const",
        help="Fake bluetooth controller powered on state",
    )
    parser.set_defaults(powered="None")

    return parser.parse_args()


def build_result(device, args):
    result = ""
    # print(device)

    if device == "":
        return " \n"

    try:
        match device["icon"]:
            case "input-keyboard":
                result = "󰌓\u2009"  # Unicode thin space char
            case "input-mouse":
                result = "󰦋\u2009"
            case "audio-headset":
                result = "󰥰\u2009"
            case _:
                result = ""
    except KeyError:
        pass

    try:
        bat = int(device["battery percentage"])
        # print(bat)
        match bat:
            case _ if bat < 10:
                result += ""
            case _ if bat < 30:
                result += ""
            case _ if bat < 50:
                result += ""
            case _ if bat < 70:
                result += ""
            case _ if bat < 101:
                result += ""
            case _:
                result = ""
    except KeyError:
        pass

    return result


def main():
    args = parse_arguments()
    logger.setLevel(max((3 - args.verbose) * 10, 0))

    while 1:
        devices = get_devices(args)

        icon = ""
        text = ""
        first = 1
        parameters = [
            "alias",
            "icon",
            "paired",
            "bonded",
            "trusted",
            "battery percentage",
        ]
        for device in devices:
            if not first:
                text += " "
            first = 0

            raw_device = call_bluetoothctl("info", device["hwaddress"], args)
            device.update(get_device_infos(raw_device, parameters, args))
            text += build_result(device, args)

        # when no device connected, show bluetooth controller state
        print(args)
        if not text:
            parameters = ["powered"]
            raw_device = call_bluetoothctl("show", "", args)
            device = get_device_infos(raw_device, parameters, args)
            icon = device[parameters[0]]

        if args.powered != "None":
            icon = args.powered

        sys.stdout.write((f'{{"alt": "{icon}", "text": "{text}"}}\n'))
        # {\"icon\": \"0\", \"text\": \"%s\"}", result)
        sys.stdout.flush()

        time.sleep(60)


if __name__ == "__main__":
    main()
