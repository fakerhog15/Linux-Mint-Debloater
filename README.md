<p align="center">
  <img width="450" alt="Linux Mint Debloater" src="assets/exampleimg.png" />
</p>

<div align="center">
  <h1>Linux Mint Debloater</h1>
  <p>Strip the bloat. Keep the speed.</p>
  <p>
    <a href="https://github.com/fakerhog15/Linux-Mint-Debloater/blob/main/LICENSE">
      <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License"/>
    </a>
    <img src="https://img.shields.io/badge/platform-linux--mint-success" alt="Platform"/>
    <img src="https://img.shields.io/badge/shell-bash-4EAA25?logo=gnubash" alt="Shell"/>
    <img src="https://img.shields.io/github/stars/fakerhog15/Linux-Mint-Debloater?style=social" alt="Stars"/>
  </p>
  <p>
    <a href="#what-it-removes">What It Removes</a> ·
    <a href="#features">Features</a> ·
    <a href="#quick-start">Quick Start</a> ·
    <a href="#browser-options">Browser Options</a> ·
    <a href="#faq">FAQ</a>
  </p>
</div>

---

A simple, interactive script to remove unwanted pre-installed packages from Linux Mint — with both **terminal** and **GUI** modes and optional browser replacement.

## What It Removes

| Package                                       | Category            |
|-----------------------------------------------|---------------------|
| Firefox                                       | Browser             |
| LibreOffice (`libreoffice-core` / `common`)   | Office Suite        |
| Thunderbird                                   | Email Client        |
| Hexchat                                       | IRC Client          |
| Transmission (`transmission-gtk`)             | Torrent Client      |
| Rhythmbox                                     | Music Player        |
| Celluloid                                     | Video Player        |
| Hypnotix                                      | IPTV Player         |
| Pix                                           | Image Viewer        |
| Simple Scan (`simple-scan`)                   | Scanner Utility     |
| Drawing                                       | Image Editor        |
| Gnote                                         | Note-taking         |
| Xreader                                       | Document Viewer     |
| Redshift                                      | Blue Light Filter   |
| Baobab                                        | Disk Analyzer       |
| Seahorse                                      | Password Manager    |
| Warpinator                                    | File Sharing        |
| Onboard                                       | On-screen Keyboard  |
| GNOME Calendar / Logs / Power Manager         | GNOME Apps          |
| Webapp Manager (`webapp-manager`)             | Web App Manager     |
| Thingy                                        | File Manager        |

> **~500 MB+** reclaimed on a fresh Linux Mint install.

## Features

- **Selective or full removal** — pick individual packages or remove them all at once
- **Deep cleanup** — runs `apt autoremove --purge` + `apt clean` to wipe dependencies, configs, and cache
- **Browser replacement** — optionally install a privacy-respecting browser after debloating
- **Dual interface** — terminal menu or a GUI checklist (zenity)
- **Live progress** — the GUI mode shows a progress bar during removal and install

## Requirements

- Linux Mint (tested on Mint; should work on other Ubuntu/Debian-based distros)
- `apt` package manager
- `zenity` for the GUI mode (auto-installed if missing)
- Root privileges (`sudo`)

## Quick Start

### Terminal

```bash
chmod +x Terminal.sh
sudo ./Terminal.sh
```

### GUI

```bash
sudo apt install zenity   # if not installed
chmod +x GuiMenu.sh
sudo ./GuiMenu.sh
```

> Both scripts require **root privileges** and will prompt for your password automatically.

### How it works

1. Shows the full list of removable packages.
2. Lets you pick individual packages, type `all` to remove everything, or use the GUI checklist.
3. Purges the selected packages and runs a deep cleanup.
4. Optionally offers to install a new browser.

## Browser Options

After debloating, you can install one of these:

| Browser         | Based On | Availability | Highlights                        |
|-----------------|----------|--------------|------------------------------------|
| **LibreWolf**   | Firefox  | Terminal + GUI | Privacy-hardened, telemetry-free |
| **Helium**      | Chromium | Terminal + GUI | Lightweight, minimal UI          |
| **Zen Browser** | Firefox  | Terminal only | Modern, feature-rich             |
| **Brave Nightly** | Chromium | Terminal + GUI | Built-in ad/tracker blocking    |

## FAQ

**Will this break my system?**
No. Only the listed packages are removed — your DE, settings, and core system stay untouched. Still, a backup never hurts.

**Can I skip LibreOffice or Firefox?**
Yes — both modes let you choose individual packages.

**Is there an undo?**
Not built-in, but you can reinstall any package with `sudo apt install <package>` (e.g. `sudo apt install firefox libreoffice-core libreoffice-common`).

**Does it work on Ubuntu/Debian?**
It's tested on Linux Mint. Should work on Ubuntu-based distros, though some package names may differ.

**Why does the GUI not offer Zen Browser?**
Zen Browser is installed via its official install script and is only available in the terminal mode.

## Troubleshooting

**`zenity: command not found`**
The GUI script tries to install zenity automatically. If that fails, run `sudo apt install zenity` manually.

**`sudo: command not found` / permission denied**
Make sure the script is executable (`chmod +x`) and you're running it with `sudo`.

**Package not found during purge**
Some packages may already be removed or renamed on your version. The script skips failures gracefully, but you can re-run `sudo apt purge <package>` to check.

## Contributing

Found a package that should be added? Spotted a bug? Open an [issue](https://github.com/fakerhog15/Linux-Mint-Debloater/issues) or send a PR.

## License

Released under the [MIT License](LICENSE).

---

<p align="center">Made by <a href="https://github.com/fakerhog15">fakerhog15</a></p>
