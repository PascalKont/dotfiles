#!/bin/bash
#
# Ansible managed
#

get_tz_letter() {
    case $(date +%Z) in
        UTC) echo "Z";;   # Zulu time
        CET) echo "A";;   # Central European Time
        CEST) echo "B";;  # Central European Summer Time
        EST) echo "C";;   # Eastern Standard Time
        EDT) echo "D";;   # Eastern Daylight Time
        GMT) echo "Z";;   # Greenwich Mean Time
        *) echo "Z";;     # Default to Z if unrecognized
    esac
}

TZ_LETTER=$(get_tz_letter)

# Get current date and format it
DATE_OUTPUT=$(date +'%d%H%M%h%y' | tr '[:upper:]' '[:lower:]')
MD_OUTPUT=$(date +'%B %Y')

# Bold the time part (HHMM)
DAY=${DATE_OUTPUT:0:2}
TIME=${DATE_OUTPUT:2:4}
ZONE=${TZ_LETTER}
MONTH=${DATE_OUTPUT:6:3}
YEAR=${DATE_OUTPUT:9:2}

full_calendar="Mo Tu We Th Fr Sa Su\\n"
current_date=$(date '+%A, %B %d, %Y')
month=$(date +%m)
year=$(date +%Y)
first_day_of_week=$(date -d "$year-$month-01" +%u)

for ((j=1; j<first_day_of_week; j++)); do
    full_calendar+="   "
done

# Fill in the days of the month
for i in $(seq 1 $(date -d "$year-$month-01 +1 month -1 day" +%d)); do
    full_calendar+=$(printf "%2d " $i)
    if [[ $(date -d "$year-$month-$i" +%u) -eq 7 ]]; then
        full_calendar+="\\n"
    fi
done

# "format-alt": "{:%F %H:%M %Z (%a)}"

# print in JSON
printf '{"text": "%s<b><big>%s</big></b>%s%s%s", "tooltip": "<big>%s</big>\\n<tt><small>%s</small></tt>", "class": "customclock"}' "${DAY}" "${TIME}" "${ZONE}" "${MONTH}" "${YEAR}" "${MD_OUTPUT}" "$full_calendar"
