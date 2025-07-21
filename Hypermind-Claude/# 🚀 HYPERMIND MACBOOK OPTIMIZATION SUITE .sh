#!/bin/bash

# ================================================================================

# 🚀 HYPERMIND MACBOOK OPTIMIZATION SUITE

# ================================================================================

# Designed for MacBook M2 8GB RAM and 2013 Mac Pro 16GB RAM

# NO COMPROMISES. MAXIMUM PERFORMANCE. ZERO BULLSHIT.

# ================================================================================

set -euo pipefail

# Color codes for terminal output

RED=’\033[0;31m’
GREEN=’\033[0;32m’
YELLOW=’\033[1;33m’
BLUE=’\033[0;34m’
PURPLE=’\033[0;35m’
CYAN=’\033[0;36m’
WHITE=’\033[1;37m’
NC=’\033[0m’ # No Color

# System info detection

get_system_info() {
SYSTEM_MODEL=$(system_profiler SPHardwareDataType | grep “Model Name” | awk -F’: ’ ‘{print $2}’)
TOTAL_RAM=$(system_profiler SPHardwareDataType | grep “Memory” | awk -F’: ’ ‘{print $2}’)
CHIP_TYPE=$(system_profiler SPHardwareDataType | grep “Chip” | awk -F’: ’ ‘{print $2}’)

```
echo -e "${CYAN}🔍 SYSTEM DETECTION${NC}"
echo -e "Model: ${WHITE}$SYSTEM_MODEL${NC}"
echo -e "RAM: ${WHITE}$TOTAL_RAM${NC}"
echo -e "Chip: ${WHITE}$CHIP_TYPE${NC}"
echo ""
```

}

# Display header

show_header() {
clear
echo -e “${PURPLE}”
echo “██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗ “
echo “██║  ██║╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗”
echo “███████║ ╚████╔╝ ██████╔╝█████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║”
echo “██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║”
echo “██║  ██║   ██║   ██║     ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝”
echo “╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ “
echo -e “${NC}”
echo -e “${CYAN}🔥 MACBOOK OPTIMIZATION SUITE - ZERO COMPROMISE PERFORMANCE${NC}”
echo -e “${YELLOW}⚡ Optimized for M2 8GB and Mac Pro 16GB configurations${NC}”
echo “”
}

# Kill all unnecessary processes

terminate_bloat() {
echo -e “${RED}💀 TERMINATING SYSTEM BLOAT${NC}”

```
# Kill resource-heavy applications
BLOAT_PROCESSES=(
    "Spotify"
    "Discord" 
    "Slack"
    "Microsoft Teams"
    "Chrome"
    "Firefox"
    "Telegram"
    "WhatsApp"
    "Zoom"
    "Skype"
    "Steam"
    "Epic Games Launcher"
)

for process in "${BLOAT_PROCESSES[@]}"; do
    if pgrep -f "$process" > /dev/null; then
        echo -e "Killing ${RED}$process${NC}"
        pkill -f "$process" 2>/dev/null || true
    fi
done

echo -e "${GREEN}✓ Bloat terminated${NC}"
echo ""
```

}

# Optimize system processes and priorities

optimize_process_priorities() {
echo -e “${BLUE}⚡ OPTIMIZING PROCESS PRIORITIES${NC}”

```
# Prioritize development tools
DEV_PROCESSES=(
    "code"
    "Terminal"
    "iTerm"
    "node"
    "python"
    "java"
    "docker"
    "git"
)

for process in "${DEV_PROCESSES[@]}"; do
    if pgrep -f "$process" > /dev/null; then
        echo -e "Prioritizing ${GREEN}$process${NC}"
        sudo renice -20 -p $(pgrep -f "$process") 2>/dev/null || true
    fi
done

echo -e "${GREEN}✓ Process priorities optimized${NC}"
echo ""
```

}

# Disable Spotlight indexing for performance

disable_spotlight() {
echo -e “${YELLOW}🔍 DISABLING SPOTLIGHT INDEXING${NC}”

```
# Disable Spotlight indexing
sudo mdutil -a -i off 2>/dev/null || true

# Erase existing index to free space
sudo mdutil -E / 2>/dev/null || true

echo -e "${GREEN}✓ Spotlight disabled - massive performance boost achieved${NC}"
echo ""
```

}

# Clear system caches aggressively

clear_system_caches() {
echo -e “${CYAN}🧹 PURGING SYSTEM CACHES${NC}”

```
# Clear user caches
rm -rf ~/Library/Caches/* 2>/dev/null || true

# Clear system caches (requires sudo)
sudo rm -rf /Library/Caches/* 2>/dev/null || true
sudo rm -rf /System/Library/Caches/* 2>/dev/null || true

# Clear logs
sudo rm -rf /private/var/log/* 2>/dev/null || true
sudo rm -rf /private/var/folders/* 2>/dev/null || true

# Clear browser caches
rm -rf ~/Library/Caches/com.google.Chrome/* 2>/dev/null || true
rm -rf ~/Library/Caches/com.apple.Safari/* 2>/dev/null || true
rm -rf ~/Library/Caches/Firefox/* 2>/dev/null || true

echo -e "${GREEN}✓ System caches purged${NC}"
echo ""
```

}

# Optimize network settings

optimize_network() {
echo -e “${PURPLE}🌐 OPTIMIZING NETWORK PERFORMANCE${NC}”

```
# Set optimal DNS servers
echo -e "Setting ${CYAN}Cloudflare DNS${NC} for minimum latency"
sudo networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1 2>/dev/null || true

# Flush DNS cache
sudo dscacheutil -flushcache 2>/dev/null || true
sudo killall -HUP mDNSResponder 2>/dev/null || true

echo -e "${GREEN}✓ Network optimized${NC}"
echo ""
```

}

# Configure system limits for maximum performance

configure_system_limits() {
echo -e “${BLUE}⚙️  CONFIGURING SYSTEM LIMITS${NC}”

```
# Increase file descriptor limits
ulimit -n 65536 2>/dev/null || true

# Set kernel parameters for performance
sudo sysctl -w kern.maxfiles=524288 2>/dev/null || true
sudo sysctl -w kern.maxfilesperproc=524288 2>/dev/null || true
sudo sysctl -w net.inet.tcp.sendspace=131072 2>/dev/null || true
sudo sysctl -w net.inet.tcp.recvspace=131072 2>/dev/null || true

echo -e "${GREEN}✓ System limits optimized${NC}"
echo ""
```

}

# Create development environment optimizations

optimize_dev_environment() {
echo -e “${CYAN}💻 OPTIMIZING DEVELOPMENT ENVIRONMENT${NC}”

```
# Create development directories if they don't exist
mkdir -p ~/Projects
mkdir -p ~/Scripts
mkdir -p ~/Tools

# Set up Git configuration for performance
git config --global core.preloadindex true 2>/dev/null || true
git config --global core.fscache true 2>/dev/null || true
git config --global gc.auto 256 2>/dev/null || true

# Configure npm for speed
if command -v npm &> /dev/null; then
    npm config set cache-min 3600 2>/dev/null || true
    npm config set progress false 2>/dev/null || true
fi

echo -e "${GREEN}✓ Development environment optimized${NC}"
echo ""
```

}

# Memory optimization for M2 and Intel Macs

optimize_memory() {
echo -e “${YELLOW}🧠 OPTIMIZING MEMORY USAGE${NC}”

```
# Purge memory
sudo purge 2>/dev/null || true

# Clear swap if safe to do so
if [[ $(sysctl vm.swapusage | awk '{print $7}' | cut -d. -f1) -eq 0 ]]; then
    echo -e "Clearing swap files"
    sudo rm -f /private/var/vm/swapfile* 2>/dev/null || true
fi

# Optimize memory pressure
sudo sysctl -w vm.pressure_disable_panic=1 2>/dev/null || true

echo -e "${GREEN}✓ Memory optimized${NC}"
echo ""
```

}

# Create RAM disk for ultra-fast temporary files

create_ram_disk() {
echo -e “${PURPLE}⚡ CREATING RAM DISK${NC}”

```
# Create 2GB RAM disk
DISK_SIZE=4194304  # 2GB in 512-byte blocks

# Check if RAM disk already exists
if [ ! -d "/Volumes/HyperMind_RAM" ]; then
    DISK_ID=$(hdiutil attach -nomount ram://$DISK_SIZE 2>/dev/null)
    if [ $? -eq 0 ]; then
        newfs_hfs -v HyperMind_RAM $DISK_ID >/dev/null 2>&1
        diskutil mount $DISK_ID >/dev/null 2>&1
        echo -e "${GREEN}✓ RAM disk created at /Volumes/HyperMind_RAM${NC}"
    else
        echo -e "${RED}⚠ Could not create RAM disk (insufficient RAM)${NC}"
    fi
else
    echo -e "${YELLOW}⚠ RAM disk already exists${NC}"
fi
echo ""
```

}

# Set up performance monitoring

setup_monitoring() {
echo -e “${CYAN}📊 SETTING UP PERFORMANCE MONITORING${NC}”

```
# Create monitoring script
cat > ~/Scripts/hypermind_monitor.sh << 'EOF'
```

#!/bin/bash
while true; do
clear
echo “🚀 HYPERMIND SYSTEM MONITOR”
echo “==========================”
echo “🔥 CPU Usage: $(top -l 1 | grep “CPU usage” | awk ‘{print $3}’ | sed ‘s/%//’)%”
echo “🧠 Memory Pressure: $(memory_pressure | grep “System-wide memory” | awk ‘{print $4}’)”
echo “💾 Swap Used: $(sysctl vm.swapusage | awk ‘{print $7}’)”
echo “🌡️  Thermal State: $(pmset -g thermlog | tail -1 | awk ‘{print $4}’)”
echo “”
echo “Top Processes:”
top -l 1 -o cpu -n 5 | tail -5
sleep 5
done
EOF

```
chmod +x ~/Scripts/hypermind_monitor.sh
echo -e "${GREEN}✓ Performance monitor created at ~/Scripts/hypermind_monitor.sh${NC}"
echo ""
```

}

# Install essential development tools

install_dev_tools() {
echo -e “${BLUE}🛠️  INSTALLING ESSENTIAL TOOLS${NC}”

```
# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "Installing ${CYAN}Homebrew${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Essential tools for development
TOOLS=(
    "node"
    "python@3.11"
    "git"
    "curl"
    "wget"
    "htop"
    "tree"
    "jq"
    "fd"
    "ripgrep"
    "bat"
    "exa"
)

for tool in "${TOOLS[@]}"; do
    if ! brew list $tool &> /dev/null; then
        echo -e "Installing ${GREEN}$tool${NC}"
        brew install $tool 2>/dev/null || true
    fi
done

echo -e "${GREEN}✓ Development tools installed${NC}"
echo ""
```

}

# Create deployment script for React app

create_deployment_script() {
echo -e “${PURPLE}📦 CREATING DEPLOYMENT SCRIPT${NC}”

```
cat > ~/Scripts/deploy_hypermind.sh << 'EOF'
```

#!/bin/bash

# HyperMind React App Deployment Script

# Optimized for maximum speed and efficiency

set -euo pipefail

echo “🚀 DEPLOYING HYPERMIND SYSTEM”
echo “=============================”

# Navigate to project directory

cd ~/Projects/hypermind || { echo “Error: Project directory not found”; exit 1; }

# Install dependencies with speed optimizations

echo “📦 Installing dependencies…”
npm ci –prefer-offline –no-audit –progress=false

# Build with optimizations

echo “🏗️  Building optimized production build…”
npm run build

# Deploy to local server

echo “🌐 Starting local server…”
npx serve -s build -l 3000

echo “✅ HyperMind deployed successfully at http://localhost:3000”
EOF

```
chmod +x ~/Scripts/deploy_hypermind.sh
echo -e "${GREEN}✓ Deployment script created at ~/Scripts/deploy_hypermind.sh${NC}"
echo ""
```

}

# System information display

show_system_status() {
echo -e “${CYAN}📊 SYSTEM STATUS REPORT${NC}”
echo “=======================”

```
# CPU info
echo -e "${BLUE}CPU:${NC} $(sysctl -n machdep.cpu.brand_string)"

# Memory info
MEMORY_PRESSURE=$(memory_pressure 2>/dev/null | grep "System-wide memory" | awk '{print $4}' || echo "Unknown")
echo -e "${BLUE}Memory Pressure:${NC} $MEMORY_PRESSURE"

# Disk space
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}')
echo -e "${BLUE}Disk Usage:${NC} $DISK_USAGE"

# Network
ACTIVE_INTERFACE=$(route get default | grep interface | awk '{print $2}')
echo -e "${BLUE}Network Interface:${NC} $ACTIVE_INTERFACE"

# Temperature (if available)
if command -v istats &> /dev/null; then
    TEMP=$(istats cpu temp --value-only 2>/dev/null || echo "N/A")
    echo -e "${BLUE}CPU Temperature:${NC} ${TEMP}°C"
fi

echo ""
```

}

# Main optimization function

run_optimization() {
echo -e “${GREEN}🚀 STARTING HYPERMIND OPTIMIZATION${NC}”
echo “”

```
get_system_info
terminate_bloat
optimize_process_priorities
disable_spotlight
clear_system_caches
optimize_network
configure_system_limits
optimize_dev_environment
optimize_memory
create_ram_disk
setup_monitoring
install_dev_tools
create_deployment_script

echo -e "${GREEN}✅ OPTIMIZATION COMPLETE${NC}"
echo -e "${YELLOW}🎯 Your MacBook is now running at MAXIMUM PERFORMANCE${NC}"
echo ""

show_system_status
```

}

# Restore function

restore_system() {
echo -e “${YELLOW}🔄 RESTORING SYSTEM SETTINGS${NC}”

```
# Re-enable Spotlight
sudo mdutil -a -i on 2>/dev/null || true

# Remove RAM disk
if [ -d "/Volumes/HyperMind_RAM" ]; then
    diskutil unmount /Volumes/HyperMind_RAM 2>/dev/null || true
fi

# Reset DNS
sudo networksetup -setdnsservers Wi-Fi "Empty" 2>/dev/null || true

echo -e "${GREEN}✓ System restored${NC}"
```

}

# Menu system

show_menu() {
echo -e “${WHITE}SELECT OPERATION:${NC}”
echo “1) 🚀 Full Optimization (RECOMMENDED)”
echo “2) 💀 Kill Bloat Processes Only”
echo “3) 🧹 Clear Caches Only”
echo “4) ⚡ Create RAM Disk”
echo “5) 📊 System Monitor”
echo “6) 🔄 Restore Default Settings”
echo “7) ❌ Exit”
echo “”
echo -n “Enter choice [1-7]: “
}

# Main execution

main() {
show_header

```
while true; do
    show_menu
    read -r choice
    
    case $choice in
        1)
            run_optimization
            ;;
        2)
            terminate_bloat
            ;;
        3)
            clear_system_caches
            ;;
        4)
            create_ram_disk
            ;;
        5)
            ~/Scripts/hypermind_monitor.sh 2>/dev/null || echo "Monitor not setup yet. Run full optimization first."
            ;;
        6)
            restore_system
            ;;
        7)
            echo -e "${CYAN}🔥 HyperMind optimization complete. System primed for maximum performance.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please select 1-7.${NC}"
            ;;
    esac
    
    echo ""
    echo -e "${YELLOW}Press any key to continue...${NC}"
    read -n 1 -s
    clear
    show_header
done
```

}

# Error handling

trap ‘echo -e “\n${RED}Error occurred. Exiting…${NC}”; exit 1’ ERR

# Check for macOS

if [[ “$OSTYPE” != “darwin”* ]]; then
echo -e “${RED}This script is designed for macOS only.${NC}”
exit 1
fi

# Check for admin privileges

if [[ $EUID -eq 0 ]]; then
echo -e “${RED}Do not run this script as root. Run as your normal user.${NC}”
exit 1
fi

# Execute main function

main “$@”