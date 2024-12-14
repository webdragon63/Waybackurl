#!/bin/bash

# Colors
clear
VERMILION='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Script to fetch and process Wayback Machine URLs

echo -e "${WHITE}                       ╻ ╻┏━┓╻ ╻┏┓ ┏━┓┏━╸╻┏ ╻ ╻┏━┓╻  ╻┏━┓"
echo -e "${WHITE}                       ┃╻┃┣━┫┗┳┛┣┻┓┣━┫┃  ┣┻┓┃ ┃┣┳┛┃   ┗━┓"
echo -e "${WHITE}                       ┗┻┛╹ ╹ ╹ ┗━┛╹ ╹┗━╸╹ ╹┗━┛╹┗╸┗━╸ ┗━┛"
                                                                           
echo -e "${CYAN}     _______________Extract the url's from  Wayback Machine________________"
                               
echo -e "${BLUE}                           MADE BY:${VERMILION}INDIAN ${WHITE}CYBER ${GREEN}ARMY"                  
echo -e "${BLUE}            YOUTUBE CHANNEL: ${VERMILION}https://${WHITE}www.youtube.com/${GREEN}@indiancyberarmy5" 
echo -e "${BLUE}________________________________________________________________________________"         
echo ""         
echo -e "Enter the domain ${WHITE}(e.g., example.com):"
read domain

# Create a directory for output files
output_dir="wayback_output"
mkdir -p $output_dir

# Fetch URLs from Wayback Machine
echo -e "${BLUE}Fetching URLs from Wayback Machine for $domain..."
curl -s "http://web.archive.org/cdx/search/cdx?url=$domain/*&output=text&fl=original" > $output_dir/urls.txt
# Check if URLs were fetched successfully
if [ -s $output_dir/urls.txt ]; then
    echo -e "${VERMILION}URLs saved to $output_dir/urls.txt"

    # Optional: Filter for specific file extensions (e.g., .php, .jpg, etc.)
    echo -e "${CYAN}Filtering URLs for specific file types..."
    grep -E "\.php|\.jpg|\.css" $output_dir/urls.txt > $output_dir/filtered_urls.txt
    echo -e "${GREEN}Filtered URLs saved to $output_dir/filtered_urls.txt"

    # Display filtered results
    echo -e "${WHITE}Displaying filtered results:"
    echo -e "${BLUE}________________________________________________________________________________"
    echo -e "${GREEN}________________________________________________________________________________"
    echo -e "${BLUE}________________________________________________________________________________"
    echo -e "${CYAN}"
    cat $output_dir/filtered_urls.txt
else
    echo -e "No URLs found for the domain ${WHITE}$domain. ${VERMILION}Might be server side issue"
    sleep 1
    echo -e "${CYAN}Try after some time later ..."
fi

# End of script
