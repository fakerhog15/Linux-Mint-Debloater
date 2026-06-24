#!/bin/bash

PACKAGES=(
    firefox
    libreoffice-core
    libreoffice-common
    thunderbird
    hexchat
    transmission-gtk
    rhythmbox
    celluloid
    hypnotix
    pix
    simple-scan
    drawing
    gnote
    xreader
    redshift
    baobab
    seahorse
    warpinator
    onboard
    gnome-calendar
    gnome-logs
    gnome-power-manager
    webapp-manager
    thingy
)

echo "======================================="
echo "     Linux Mint Debloat (Terminal)"
echo "======================================="
echo ""
echo "Available packages to remove:"
echo ""

for i in "${!PACKAGES[@]}"; do
    printf "%2d) %s\n" $((i+1)) "${PACKAGES[$i]}"
done

echo ""
echo "Enter the numbers of packages to remove (space-separated),"
echo "or 'all' to select everything, or 'q' to quit:"
read -r INPUT

if [ "$INPUT" = "q" ]; then
    echo "Cancelled."
    exit 0
fi

PACKAGES_TO_REMOVE=()
if [ "$INPUT" = "all" ]; then
    PACKAGES_TO_REMOVE=("${PACKAGES[@]}")
else
    for num in $INPUT; do
        idx=$((num-1))
        if [ "$idx" -ge 0 ] && [ "$idx" -lt "${#PACKAGES[@]}" ]; then
            PACKAGES_TO_REMOVE+=("${PACKAGES[$idx]}")
        fi
    done
fi

if [ ${#PACKAGES_TO_REMOVE[@]} -eq 0 ]; then
    echo "No valid packages selected. Exiting."
    exit 0
fi

echo ""
echo "The following packages will be REMOVED:"
for pkg in "${PACKAGES_TO_REMOVE[@]}"; do
    echo "  - $pkg"
done
echo ""
echo "WARNING: Firefox and LibreOffice will be removed."
read -rp "Continue? (y/N): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "Removing packages..."
sudo apt purge -y "${PACKAGES_TO_REMOVE[@]}"
echo ""
echo "Cleaning up..."
sudo apt autoremove -y --purge
sudo apt clean
echo ""
echo "Debloating complete!"
echo ""

echo "Install a browser?"
echo "1) None"
echo "2) LibreWolf (via official repo)"
echo "3) Helium (via apt repo)"
echo "4) Zen Browser (via official install script)"
echo "5) Brave Nightly (via official install script)"
read -rp "Choice [1-5]: " BROWSER_CHOICE

case "$BROWSER_CHOICE" in
    2)
        echo ""
        echo "Adding LibreWolf repository..."
        sudo apt install -y wget gnupg >/dev/null 2>&1
        wget -q https://deb.librewolf.net/librewolf.gpg -O /tmp/librewolf.gpg
        sudo install -o root -g root -m 644 /tmp/librewolf.gpg /etc/apt/trusted.gpg.d/
        echo "deb [arch=amd64] https://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list >/dev/null
        sudo apt update >/dev/null 2>&1
        sudo apt install -y librewolf
        xdg-settings set default-web-browser librewolf.desktop 2>/dev/null
        echo "LibreWolf installed and set as default browser."
        ;;
    3)
        echo ""
        echo "Adding Helium repository..."
        curl -fsSL https://raw.githubusercontent.com/imputnet/helium-linux/main/pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/helium.gpg
        echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/helium.gpg] https://pkg.helium.computer/deb stable main" | sudo tee /etc/apt/sources.list.d/helium.list >/dev/null
        sudo apt update
        sudo apt install -y helium-bin
        echo "Helium Browser installed."
        ;;
    4)
        echo ""
        echo "Installing Zen Browser..."
        curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL
        echo "Zen Browser installed. You can launch it from your app menu."
        ;;
    5)
        echo ""
        echo "Installing Brave Nightly..."
        curl -fsS https://dl.brave.com/install.sh | sh
        echo "Brave Nightly installed."
        ;;
    *)
        echo "Skipping browser installation."
        ;;
esac

echo ""
echo "Done! You may want to restart your session."
