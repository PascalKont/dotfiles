#!/usr/bin/python3
# https://pagure.io/rofi-audio-output-selector/blob/master/f/select_audio_output

import subprocess
import re


def theme():
    return "configuration{show-icons:false;} #window { width: 800px; anchor: north east; location: north east; } mainbox { children: [inputbar,listview];} listview{ lines:3;}"


def parse_sinks():
    result = subprocess.run(["wpctl", "status"], stdout=subprocess.PIPE)
    output = result.stdout.decode("utf-8")

    hook_sinks_re = re.compile(r"├─ Sinks:")
    hook_end_re = re.compile(r"├─")
    sink_re = re.compile(r"│[ *]*(\d+)\.\ (.*)\ \[vol.*")

    sinks = []
    hook_active = 0

    for line in output.split("\n"):
        hook_sinks_match = hook_sinks_re.search(line)
        if hook_sinks_match:
            hook_active = 1
            continue

        if not hook_active:
            continue

        sink_match = sink_re.search(line)
        try:
            sinks.append(
                {"id": sink_match.group(1).strip(), "name": sink_match.group(2).strip()}
            )
        except (AttributeError, IndexError):
            pass

        hook_end_match = hook_end_re.search(line)
        if hook_end_match:
            break

    return sinks


def select_device(devices):
    # Format the devices for rofi
    rofi_input = "\n".join([f"{d['name']}" for d in devices])
    # rofi_input = "\n".join([f"{d['product_name']} - {d['profile_description']} ({d['nick']})" for d in devices])

    # Run rofi to select a device
    result = subprocess.run(
        [
            "wofi",
            "-dmenu",
            "-theme-str",
            theme(),
            "-i",
            "-p",
            "Select Audio Output Device",
        ],
        input=rofi_input,
        text=True,
        stdout=subprocess.PIPE,
    )
    selected_device = result.stdout.strip()

    if not selected_device:
        return None

    for d in devices:
        if d["name"] == selected_device:
            return d["id"], d["name"]


def set_default_sink(id, name):
    if id:
        subprocess.run(["wpctl", "set-default", id])
        subprocess.run(["notify-send", "New Audio Output Device", f"{name}"])

    else:
        subprocess.run(["notify-send", "Audio Output Device", "No device selected"])


if __name__ == "__main__":
    # print(parse_sinks().get('59'))
    devices = parse_sinks()

    # devices = get_audio_devices()
    try:
        id, name = select_device(devices)
        set_default_sink(id, name)
    except TypeError:
        pass
