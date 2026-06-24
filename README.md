# Linux Mint Debloater

A collection of Bash scripts to remove pre-installed packages from Linux Mint, freeing up disk space and reducing background resource usage. Comes in two flavors: a terminal-based interactive script and a GUI version using Zenity.

## ⚠️ Disclaimer

Modifying system packages carries inherent risk. **Bloatware is subjective** — what one user considers useless, another may depend on. **Create a Timeshift snapshot** before running these scripts.

## Scripts

| Script        | Interface      | Description                                                  |
| ------------- | -------------- | ------------------------------------------------------------ |
| `Terminal.sh` | Terminal (CLI) | Lists packages by number; select individually, type `all`, or quit. After removal, offers to install a browser. |
| `GuiMenu.sh`  | GUI (Zenity)   | Checklist dialog to pick packages. Shows a progress bar during removal. Offers browser installation at the end. |

## Packages Removed

- `firefox` — Default web browser
- `libreoffice-core`, `libreoffice-common` — Office suite
- `thunderbird` — Email client
- `hexchat` — IRC client
- `transmission-gtk` — BitTorrent client
- `rhythmbox` — Music player
- `celluloid` — Video player
- `hypnotix` — IPTV player
- `pix` — Image viewer/organizer
- `simple-scan` — Document scanner
- `drawing` — Image editor
- `gnote` — Note-taking app
- `xreader` — Document viewer
- `redshift` — Blue-light filter
- `baobab` — Disk usage analyzer
- `seahorse` — Passwords & keys manager
- `warpinator` — LAN file transfer
- `onboard` — On-screen keyboard
- `gnome-calendar`, `gnome-logs`, `gnome-power-manager` — GNOME utilities
- `webapp-manager` — Web app manager
- `thingy` — Device manager

## Optional Browser Installation

After debloating, you can install one of these browsers:

| Browser                              | Description                                  |
| ------------------------------------ | -------------------------------------------- |
| **LibreWolf**                        | Privacy-focused Firefox fork (official repo) |
| **Helium**                           | Lightweight privacy browser (apt repo)       |
| **Zen Browser** *(Terminal.sh only)* | Privacy-oriented browser (official script)   |
| **Brave Nightly**                    | Cutting-edge Brave (official repo)           |

## Usage

```bash
git clone https://github.com/fakerhog15/Linux-Mint-Debloater.git
cd Linux-Mint-Debloater
chmod +x Terminal.sh GuiMenu.sh

# Terminal mode
./Terminal.sh

# GUI mode (requires zenity, installed automatically if missing)
./GuiMenu.sh
```

## What the Scripts Do

1. **Purge** selected packages with `apt purge`
2. **Clean up** residual dependencies with `apt autoremove --purge` and `apt clean`
3. **Offer** to install a replacement browser (optional)
