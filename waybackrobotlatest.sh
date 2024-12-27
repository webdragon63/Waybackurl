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
                                                                           
echo -e "${CYAN}     __________Extract the latest robot.txt from  Wayback Machine__________"
                               
echo -e "${BLUE}                           MADE BY:${VERMILION}INDIAN ${WHITE}CYBER ${GREEN}ARMY"                  
echo -e "${BLUE}            YOUTUBE CHANNEL: ${VERMILION}https://${WHITE}www.youtube.com/${GREEN}@indiancyberarmy5" 
echo -e "${BLUE}________________________________________________________________________________" 
echo ""
# Colourize text format into cyan
echo -e "${CYAN}"

# Prompt user for input         
echo -e "${CYAN}Enter the domain ${WHITE}(e.g., example.com):"
read DOMAIN
if [ -z "$DOMAIN" ]; then
  echo "Error: No domain entered. Exiting."
  exit 1
fi

OUTPUT_DIR="${DOMAIN}_robots"
mkdir -p "$OUTPUT_DIR"

API_URL="http://web.archive.org/cdx/search/cdx?url=${DOMAIN}/robots.txt&output=json&filter=statuscode:200"

# Fetch the latest snapshot (highest timestamp)
LATEST_TIMESTAMP=$(curl -s "$API_URL" | jq -r '.[1:][] | .[1]' | sort -r | head -n 1)

if [ -z "$LATEST_TIMESTAMP" ]; then
  echo "No robots.txt snapshots found for $DOMAIN"
  exit 1
fi

ARCHIVE_URL="http://web.archive.org/web/${LATEST_TIMESTAMP}id_/${DOMAIN}/robots.txt"
OUTPUT_FILE="$OUTPUT_DIR/robots_${LATEST_TIMESTAMP}.txt"

echo "Downloading latest snapshot: $ARCHIVE_URL"
curl -s "$ARCHIVE_URL" -o "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
  echo "Saved latest robots.txt to: $OUTPUT_FILE"
else
  echo "Failed to download: $ARCHIVE_URL"
  rm -f "$OUTPUT_FILE"  # Remove incomplete file
fi
