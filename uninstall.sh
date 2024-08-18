#!/bin/bash

#  __    __  .__   __.  __  .__   __.      _______.___________.    ___       __       __
# |  |  |  | |  \ |  | |  | |  \ |  |     /       |           |   /   \     |  |     |  |
# |  |  |  | |   \|  | |  | |   \|  |    |   (----`---|  |----`  /  ^  \    |  |     |  |
# |  |  |  | |  . `  | |  | |  . `  |     \   \       |  |      /  /_\  \   |  |     |  |
# |  `--'  | |  |\   | |  | |  |\   | .----)   |      |  |     /  _____  \  |  `----.|  `----.
#  \______/  |__| \__| |__| |__| \__| |_______/       |__|    /__/     \__\ |_______||_______|

set -e

# Check if stdout is a tty
if [ -t 1 ]; then
  is_tty() { true; }
else
  is_tty() { false; }
fi

setup_color() {
  # Only use colors if connected to a terminal
  if is_tty; then
    GRAY='\033[1;30m'
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    CYAN='\033[0;36m'
    NC='\033[0m' # No Color
  else
    GRAY=''
    RED=''
    GREEN=''
    YELLOW=''
    CYAN=''
    NC=''
  fi
}

# Helpers
info() { echo " - $1"; }
infon() { echo "    . $1"; }
yellow() { printf " - ${YELLOW}$1${NC}\n"; }
yellown() { printf "    - ${YELLOW}$1${NC}\n"; }
cyan() { printf "${CYAN}$1${NC}\n"; }
cyann() { printf "    . ${CYAN}$1${NC}\n"; }
gray() { printf "${GRAY}$1${NC}\n"; }
grayn() { printf "    . ${GRAY}$1${NC}\n"; }
success() { printf "${GREEN}$1${NC}\n"; }
error() { printf "${RED}$1${NC}\n"; }
newline() { echo ""; }
clearLastLine() { tput cuu1 && tput el && tput el1; }
exitWithError() { error "\nError: $1"; exit 1; }

# Function to check if Homebrew is installed
check_homebrew() {
  if ! command -v brew &> /dev/null; then
    exitWithError "Homebrew is not installed."
  fi
}

# Function to check if a package is installed via Homebrew
check_package_installed() {
  local package=$1
  if brew list $package &> /dev/null; then
    cyann "$package is installed"
    installed_packages+=($package)
  else
    grayn "$package is not installed"
  fi
}

# Confirm uninstallation
confirm_uninstall() {
  read -p " - Do you want to continue with the uninstallation? (y/n): " confirm
  if [[ "$confirm" != "y" ]]; then
    cyan "Uninstallation canceled."
    exit 1
  fi
}

# Remove Neovim configuration directories
remove_nvim_dirs() {
  info "Removing Neovim-related directories..."

  # Define an array of directories to remove
  directories=(
    "$HOME/.config/nvim"
    "$HOME/.local/share/nvim"
    "$HOME/.local/state/nvim"
    "$HOME/.cache/nvim"
  )

  # Loop through the array and remove each directory
  for dir in "${directories[@]}"; do
    infon "Removing directory at $dir"
    rm -rf "$dir"
  done

  info "Neovim directories removed."
}

# Start uninstall
setup_color

check_homebrew

# Initialize an empty array to store installed packages
packages=(neovim ripgrep fd stylua)
installed_packages=()

info "Checking if the following packages are installed via Homebrew"
for package in "${packages[@]}"; do
  check_package_installed "$package"
done

# Only proceed if there are installed packages
if [[ ${#installed_packages[@]} -eq 0 ]]; then
  yellow "None of the packages are installed. Exiting"
  exit 0
fi

confirm_uninstall

info "Preparing to uninstall packages..."
for package in "${installed_packages[@]}"; do
  yellown "Uninstalling $package"
  brew uninstall $package
done
info "Packages uninstalled successfully"

remove_nvim_dirs

newline
success "Neovim uninstall complete"
