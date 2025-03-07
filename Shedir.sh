#!/usr/bin/env bash

# █▀ █░█ █▀▄▀█ █▀▄▀█ █▀▀ █▀█   █▀▄ █▀▀ █▀▀ █▀█ █▀▀ █▀▄ █▀▀
# ▄█ █▄█ █░▀░█ █░▀░█ ██▄ █▀▄   █▄▀ ██▄ █▄▄ █▀▄ ██▄ █▄▀ ██▄
# IP Sleuth - Created by Taha185
# Version 2.0 🔎

# Colors
DARK_GRAY='\033[1;30m'
RED='\033[0;31m'
GOLD='\033[0;33m'
DIM_YELLOW='\033[2;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# ASCII Detective
show_banner() {
    clear
    echo -e "${GOLD}"
    echo "    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄"
    echo "    █▓▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▓█"
    echo "    █▓                                                          ▓█"
    echo "    █▓  ░▒█▀▀▀█░▒█░▒█░█▀▀░█▀▀▄░▀█▀░█▀▀░█▀▄░░░▒█▀▀▄░█▀▀░▀█▀░█▀▀▄  ▓█"
    echo "    █▓  ░░▀▀▀▄▄░▒█▀▀█░█▀▀░█░▒█░░█░░█▀▀░█▀▄░░░▒█▄▄▀░█▀▀░░█░░█░▒█  ▓█"
    echo "    █▓  ░▒█▄▄▄█░▒█░▒█░▀▀▀░▀▀▀░░▀▀▀░▀▀▀░▀░▀░░░▒█░▒█░▀▀▀░░▀░░▀▀▀░  ▓█"
    echo "    █▓                                                          ▓█"
    echo "    █▓▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▓█"
    echo "    ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
    echo -e "${NC}"
    echo -e "${DIM_YELLOW}                   ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░"
    echo -e "${CYAN}                   Case File 2.0 ${DARK_GRAY}|${CYAN} GitHub: Taha185 ${DARK_GRAY}|${CYAN} Licensed under MIT"
    echo -e "${DARK_GRAY}                  ‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗"
}

# Case File Agreement
case_agreement() {
    echo -e "${RED}"
    echo "╔══════════════════════════════════════════════════╗"
    echo "║                 CASE FILE 0427                   ║"
    echo "╠══════════════════════════════════════════════════╣"
    echo -e "${GOLD}"
    echo "  This investigation tool is authorized only for:"
    echo "  - Ethical security research"
    echo "  - Network diagnostics"
    echo "  - Educational purposes"
    echo -e "${RED}"
    echo "╠══════════════════════════════════════════════════╣"
    echo -e "${DIM_YELLOW}"
    echo "  Unauthorized use may violate:"
    echo "  - Computer Fraud and Abuse Act (CFAA)"
    echo "  - General Data Protection Regulation (GDPR)"
    echo "  - Local cybersecurity laws"
    echo -e "${RED}"
    echo "╠══════════════════════════════════════════════════╣"
    echo "║           ENTER 'ACCEPT' TO CONTINUE             ║"
    echo "╚══════════════════════════════════════════════════╝"
    echo -e "${NC}"

    while true; do
        read -p $'\e[31m[🔎] Investigative Consent: \e[0m' agreement
        case $(echo "$agreement" | tr '[:lower:]' '[:upper:]') in
            ACCEPT)
                echo -e "\n${GOLD}✔ Case file opened. Maintain operational security!\n${NC}"
                sleep 1
                break
                ;;
            *)
                echo -e "${RED}\n✘ Investigation aborted! Authorization required.\n${NC}"
                exit 1
                ;;
        esac
    done
}

# Check tools
check_tools() {
    local missing=()
    command -v curl &>/dev/null || missing+=("curl")
    command -v jq &>/dev/null || missing+=("jq")
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${RED}✘ Missing forensic tools:${NC} ${missing[*]}"
        echo -e "${GOLD}Install with:"
        echo -e "sudo apt install ${missing[*]}${NC}"
        exit 1
    fi
}

# Check connection
check_connection() {
    if ! curl -Is http://ip-api.com | grep -q "HTTP/1.1 200"; then
        echo -e "${RED}✘ Connection to surveillance grid failed!${NC}"
        exit 1
    fi
}

# Trace public IP
trace_public() {
    echo -e "${GOLD}[⌛] Scanning digital footprint...${NC}"
    ip=$(curl -s https://api.ipify.org)
    echo -e "${CYAN}✔ Identified Public IP: ${GOLD}$ip${NC}"
}

# Investigate IP
investigate_ip() {
    while :; do
        read -p $'\e[36m[🔎] Enter Target IP (or X to close case): \e[0m' ip
        [[ "$ip" = "X" ]] && break
        
        if [[ ! "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            echo -e "${RED}✘ Invalid evidence format!${NC}"
            continue
        fi

        echo -e "${GOLD}[⌛] Analyzing digital footprints...${NC}"
        response=$(curl -s "http://ip-api.com/json/$ip?fields=66846719")
        
        if [[ -z "$response" ]] || echo "$response" | jq -e '.status == "fail"' &>/dev/null; then
            echo -e "${RED}✘ Forensic analysis failed!${NC}"
            continue
        fi

        echo -e "\n${DARK_GRAY}══════════════════════════════════════════════════${NC}"
        echo -e "${GOLD}                   SUSPECT PROFILE                   ${NC}"
        echo -e "${DARK_GRAY}══════════════════════════════════════════════════${NC}"
        echo -e "${CYAN}IP Address: ${GOLD}$(jq -r '.query' <<< "$response")"
        echo -e "${CYAN}Last Known Location: ${GOLD}$(jq -r '.city + ", " + .country' <<< "$response")"
        echo -e "${CYAN}Coordinates: ${GOLD}$(jq -r '.lat' <<< "$response"), $(jq -r '.lon' <<< "$response")"
        echo -e "${CYAN}Network Operator: ${GOLD}$(jq -r '.isp' <<< "$response")"
        echo -e "${DARK_GRAY}══════════════════════════════════════════════════${NC}"
        echo -e "${GOLD}                  DIGITAL FOOTPRINTS                 ${NC}"
        echo -e "${DARK_GRAY}══════════════════════════════════════════════════${NC}"
        echo -e "${CYAN}AS Number: ${GOLD}$(jq -r '.as' <<< "$response")"
        echo -e "${CYAN}Organization: ${GOLD}$(jq -r '.org' <<< "$response")"
        echo -e "${CYAN}Local Time: ${GOLD}$(date -d @$(date +%s) -u '+%H:%M UTC')"
        echo -e "${DARK_GRAY}══════════════════════════════════════════════════${NC}\n"
    done
}

# Main interface
main_investigation() {
    while :; do
        echo -e "\n${GOLD}Investigation Menu:${NC}"
        echo -e "1. ${CYAN}Run Public IP Trace${NC}"
        echo -e "2. ${CYAN}Investigate Target IP${NC}"
        echo -e "3. ${CYAN}Close Case Files${NC}"
        
        read -p $'\e[36m[🔎] Select Operation (1-3): \e[0m' choice
        
        case $choice in
            1) trace_public ;;
            2) investigate_ip ;;
            3) echo -e "\n${GOLD}✔ Evidence logged. Terminating session...${NC}"; exit 0 ;;
            *) echo -e "${RED}✘ Unauthorized operation!${NC}" ;;
        esac
        
        read -p $'\e[36m[🔎] Press Enter to continue investigation...\e[0m'
        show_banner
    done
}

# Launch sequence
show_banner
case_agreement
check_tools
check_connection
main_investigation
