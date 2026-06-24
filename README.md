# Linux Mint Debloater

A simple shell script to remove unwanted pre-installed packages from Linux Mint, with an option to install a privacy-focused replacement browser afterward.

Available in two forms:
- **Terminal version** (`Terminal.sh`) — plain command-line prompts
- **GUI version** (`GuiMenu.sh`) — graphical menus via `zenity`

## What it removes

- Firefox
- LibreOffice (core + common)
- Thunderbird
- Hexchat
- Transmission
- Rhythmbox
- Celluloid
- Hypnotix
- Pix
- Simple Scan
- Drawing
- Gnote
- Xreader
- Redshift
- Baobab
- Seahorse
- Warpinator
- Onboard
- GNOME Calendar, Logs & Power Manager
- Webapp Manager
- Thingy

## Features

- **Selective removal** – pick individual packages, or remove everything at once
- **Full cleanup** – runs `apt autoremove --purge` and `apt clean` to remove leftover dependencies and cached package files
- **Browser replacement** – after debloating, optionally install one of:
  - LibreWolf
  - Helium Browser
  - Zen Browser
  - Brave Nightly

## Requirements

- Linux Mint (may also work on Ubuntu-based derivatives, untested)
- `sudo` privileges
- `zenity` installed, if using the GUI version

## Usage

### Terminal version

```bash
chmod +x Terminal.sh
./Terminal.sh
```

### GUI version

```bash
sudo apt install zenity   # if not already installed
chmod +x GuiMenu.sh
./GuiMenu.sh
```

Follow the on-screen prompts to select which packages to remove and, optionally, which browser to install in place of Firefox.

## Notes

- Firefox and LibreOffice are included in the removal list — only run this if you're sure you don't need them.
- Since Firefox is removed, installing a replacement browser is recommended. The script offers several privacy-focused options.
- Tested on Linux Mint. Behavior on other Ubuntu-based distros is not guaranteed.

## License

No license specified. Contact the repository owner if you'd like to use this under a specific license.

## Disclaimer

This script removes system packages using `apt`. Review the package list before running it, and use at your own risk.
