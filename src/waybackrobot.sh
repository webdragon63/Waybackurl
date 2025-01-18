#!/bin/bash

# waybackrobots.sh
# Fetches robots.txt files from the Wayback Machine for a given domain

clear
VERMILION='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Script to fetch and process Wayback Machine URLs

echo -e "${WHITE}                      ╻ ╻┏━┓╻ ╻┏┓ ┏━┓┏━╸╻┏ ┏━┓┏━┓┏┓ ┏━┓╺┳"
echo -e "${WHITE}                      ┃╻┃┣━┫┗┳┛┣┻┓┣━┫┃  ┣┻┓┣┳┛┃ ┃┣┻┓┃ ┃ ┃"
echo -e "${WHITE}                      ┗┻┛╹ ╹ ╹ ┗━┛╹ ╹┗━╸╹ ╹╹┗╸┗━┛┗━┛┗━┛ ╹"
                                                                           
echo -e "${CYAN}     _____________Extract the robot.txt from  Wayback Machine______________"
                               
echo -e "${BLUE}                           MADE BY:${VERMILION}INDIAN ${WHITE}CYBER ${GREEN}ARMY"                  
echo -e "${BLUE}            YOUTUBE CHANNEL: ${VERMILION}https://${WHITE}www.youtube.com/${GREEN}@indiancyberarmy5" 
echo -e "${BLUE}________________________________________________________________________________" 
echo ""
# Colourize text format into cyan
echo -e "${CYAN}"

# Prompt user for input         
echo -e "Enter the domain ${WHITE}(e.g., example.com):"
read DOMAIN
if [ -z "$DOMAIN" ]; then
  echo "Error: No domain entered. Exiting."
  exit 1
fi

OUTPUT_DIR="${DOMAIN}_robots"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Fetch Wayback Machine's API for robots.txt snapshots
API_URL="http://web.archive.org/cdx/search/cdx?url=${DOMAIN}/robots.txt&output=json&collapse=timestamp:10&filter=statuscode:200"

# Retrieve data and extract timestamps using grep, sed, and awk
SNAPSHOTS=$(curl -s "$API_URL" | grep -oE '"[0-9]{14}"' | sed 's/"//g')

if [ -z "$SNAPSHOTS" ]; then
  echo "No robots.txt snapshots found for $DOMAIN"
  exit 1
fi

echo "Found snapshots for $DOMAIN. Downloading robots.txt files..."

# Loop through each timestamp and download the robots.txt
for TIMESTAMP in $SNAPSHOTS; do
  ARCHIVE_URL="http://web.archive.org/web/${TIMESTAMP}id_/${DOMAIN}/robots.txt"
  OUTPUT_FILE="$OUTPUT_DIR/robots_${TIMESTAMP}.txt"

  echo "Downloading: $ARCHIVE_URL"
  curl -s "$ARCHIVE_URL" -o "$OUTPUT_FILE"

  if [ $? -eq 0 ]; then
    echo "Saved to: $OUTPUT_FILE"
  else
    echo "Failed to download: $ARCHIVE_URL"
  fi

done

echo "All available robots.txt files downloaded to $OUTPUT_DIR"
read -n 1

