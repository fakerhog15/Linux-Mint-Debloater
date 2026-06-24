# Linux Mint Debloater

A simple script to remove unwanted pre-installed packages from Linux Mint and optionally install a replacement browser.

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

- **Selective removal** – pick individual packages or remove everything at once
- **`apt autoremove --purge` + `apt clean`** – fully cleans up dependencies and cache
- **Browser replacement** – choose from LibreWolf, Helium Browser, Zen Browser, or Brave Nightly after debloating

## Usage

### Terminal version

```bash
chmod +x Terminal.sh
./Terminal.sh
```

### GUI version (requires `zenity`)

```bash
chmod +x GuiMenu.sh
./GuiMenu.sh
```

## Notes

- Firefox and LibreOffice are included in the list – run this only if you're certain you don't need them.
- A new browser is recommended since Firefox is removed. The script offers several privacy-focused alternatives.
- Tested on Linux Mint. May work on Ubuntu-based derivatives.
