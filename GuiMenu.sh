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

DARK_MODE=true
if [ "$DARK_MODE" = true ]; then
    if [ -d "/usr/share/themes/Mint-Y-Dark" ]; then
        export GTK_THEME=Mint-Y-Dark
    else
        export GTK_THEME=Adwaita:dark
    fi
fi

if ! command -v zenity &>/dev/null; then
    echo "zenity not found. Installing..."
    sudo apt install -y zenity
fi



CHECKLIST=("FALSE" "SELECT ALL" "Check to remove all packages")
for pkg in "${PACKAGES[@]}"; do
    CHECKLIST+=("FALSE" "$pkg" "")
done

SELECTED=$(zenity --list --checklist \
    --title="Linux Mint Debloat" \
    --text="Select packages to remove:" \
    --column="Pick" --column="Package" --column="" \
    --width=550 --height=600 \
    "${CHECKLIST[@]}")

if [ -z "$SELECTED" ]; then
    zenity --info --title="Cancelled" --text="Operation cancelled." --width=300
    exit 0
fi

if [[ "$SELECTED" == *"SELECT ALL"* ]]; then
    PACKAGES_TO_REMOVE=("${PACKAGES[@]}")
else
    IFS='|' read -ra PACKAGES_TO_REMOVE <<< "$SELECTED"
fi

SUMMARY=""
for pkg in "${PACKAGES_TO_REMOVE[@]}"; do
    SUMMARY+="  \342\200\242 $pkg\n"
done

zenity --question --title="Confirm Removal" \
    --text="The following packages will be REMOVED:\n\n$SUMMARY\n\nWARNING: Firefox and LibreOffice will be removed.\nContinue?" \
    --width=400 --height=300 --ok-label="Remove" --cancel-label="Cancel"

if [ $? -ne 0 ]; then
    zenity --info --title="Cancelled" --text="Operation cancelled." --width=300
    exit 0
fi

(
    echo "10"
    echo "# Starting removal..."
    sudo apt purge -y "${PACKAGES_TO_REMOVE[@]}" >/dev/null 2>&1
    echo "50"
    echo "# Packages removed. Cleaning up..."
    sudo apt autoremove -y --purge >/dev/null 2>&1
    sudo apt clean >/dev/null 2>&1
    echo "90"
    echo "# Cleanup complete."
    sleep 0.5
    echo "100"
    echo "# Done!"
) | zenity --progress --title="Debloating..." --text="Please wait..." \
    --percentage=0 --auto-close --width=400

BROWSER=$(zenity --list --radiolist \
    --title="Install Browser" \
    --text="Debloating complete!\nChoose a browser to install as your default:" \
    --column="Pick" --column="Browser" --column="Note" \
    --width=550 --height=300 \
    FALSE "None" "Keep current setup" \
    FALSE "LibreWolf" "Privacy-focused Firefox fork (via official repo)" \
    FALSE "Helium" "Lightweight privacy browser (via apt repo)" \
    FALSE "Brave Nightly" "Cutting-edge Brave browser (via official repo)")

case "$BROWSER" in
    "LibreWolf")
        (
            echo "10"
            echo "# Adding LibreWolf repository..."
            sudo apt update >/dev/null 2>&1
            sudo apt install -y wget gnupg >/dev/null 2>&1
            wget -q https://deb.librewolf.net/librewolf.gpg -O /tmp/librewolf.gpg
            sudo install -o root -g root -m 644 /tmp/librewolf.gpg /etc/apt/trusted.gpg.d/
            echo "deb [arch=amd64] https://deb.librewolf.net $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/librewolf.list >/dev/null
            echo "40"
            echo "# Installing LibreWolf..."
            sudo apt update >/dev/null 2>&1
            sudo apt install -y librewolf >/dev/null 2>&1
            echo "80"
            echo "# Setting LibreWolf as default browser..."
            xdg-settings set default-web-browser librewolf.desktop 2>/dev/null
            echo "100"
            echo "# LibreWolf installed!"
        ) | zenity --progress --title="Installing LibreWolf" --text="Please wait..." \
            --percentage=0 --auto-close --width=400
        ;;
    "Helium")
        (
            echo "10"
            echo "# Adding Helium repository..."
            curl -fsSL https://raw.githubusercontent.com/imputnet/helium-linux/main/pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/helium.gpg >/dev/null 2>&1
            echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/helium.gpg] https://pkg.helium.computer/deb stable main" | sudo tee /etc/apt/sources.list.d/helium.list >/dev/null
            echo "40"
            echo "# Installing Helium Browser..."
            sudo apt update >/dev/null 2>&1
            sudo apt install -y helium-bin >/dev/null 2>&1
            echo "90"
            echo "# Done!"
        ) | zenity --progress --title="Installing Helium" --text="Please wait..." \
            --percentage=0 --auto-close --width=400
        ;;
    "Brave Nightly")
        (
            echo "10"
            echo "# Adding Brave Nightly repository..."
            curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg \
                https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
            curl -fsSLo /etc/apt/sources.list.d/brave-browser-nightly.sources \
                https://brave-browser-apt-nightly.s3.brave.com/brave-browser.sources
            echo "40"
            echo "# Installing Brave Nightly..."
            sudo apt update >/dev/null 2>&1
            sudo apt install -y brave-browser-nightly >/dev/null 2>&1
            echo "100"
            echo "# Brave Nightly installed!"
        ) | zenity --progress --title="Installing Brave Nightly" --text="Please wait..." \
            --percentage=0 --auto-close --width=400
        ;;
esac

zenity --info --title="Complete" \
    --text="Debloating complete! You may want to restart your session." \
    --width=350
