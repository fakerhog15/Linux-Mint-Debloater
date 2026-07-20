<img width="1000" height="1000" alt="New Project" src="https://github.com/user-attachments/assets/a5c4b2ae-845d-44bc-a40a-5fd781a3abcb" />
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
</div>

---

A simple, interactive script to remove unwanted pre-installed packages from Linux Mint — with both **terminal** and **GUI** modes and optional browser replacement.

## What It Removes

| Package              | Category            |
|----------------------|---------------------|
| Firefox              | Browser             |
| LibreOffice          | Office Suite        |
| Thunderbird          | Email Client        |
| Hexchat              | IRC Client          |
| Transmission         | Torrent Client      |
| Rhythmbox            | Music Player        |
| Celluloid            | Video Player        |
| Hypnotix             | IPTV Player         |
| Pix                  | Image Viewer        |
| Simple Scan          | Scanner Utility     |
| Drawing              | Image Editor        |
| Gnote                | Note-taking         |
| Xreader              | Document Viewer     |
| Redshift             | Blue Light Filter   |
| Baobab               | Disk Analyzer       |
| Seahorse             | Password Manager    |
| Warpinator           | File Sharing        |
| Onboard              | On-screen Keyboard  |
| GNOME Calendar, Logs & Power Manager | GNOME Apps |
| Webapp Manager       | Web App Manager     |
| Thingy               | File Manager        |

> **~500 MB+** reclaimed on a fresh Linux Mint install.

## Features

- **Selective or full removal** — pick individual packages or nuke them all at once
- **Deep cleanup** — runs `apt autoremove --purge` + `apt clean` to wipe dependencies, configs, and cache
- **Browser replacement** — choose a privacy-respecting browser after debloating
- **Dual interface** — use the terminal or a GUI checklist (zenity)

## Quick Start

### Terminal

```bash
chmod +x Terminal.sh
sudo ./Terminal.sh
```

### GUI (requires `zenity`)

```bash
sudo apt install zenity   # if not installed
chmod +x GuiMenu.sh
sudo ./GuiMenu.sh
```

> Both scripts require **root privileges**. They'll prompt for your password automatically.

## Browser Options

After debloating, you can install one of these:

| Browser         | Based On       | Highlights                              |
|-----------------|----------------|-----------------------------------------|
| **LibreWolf**   | Firefox        | Privacy-hardened, telemetry-free        |
| **Helium**      | Chromium       | Lightweight, minimal UI                 |
| **Zen Browser** | Firefox        | Modern, feature-rich                    |
| **Brave Nightly** | Chromium     | Built-in ad/tracker blocking            |

## FAQ

**Will this break my system?**  
No. Only the listed packages are removed — your DE, settings, and core system stay untouched. Still, a backup never hurts.

**Can I skip LibreOffice or Firefox?**  
Yes — selective mode lets you uncheck individual packages.

**Is there an undo?**  
Not built-in, but you can reinstall any package with `sudo apt install <package>`.

**Does it work on Ubuntu/Debian?**  
It's tested on Linux Mint. Should work on Ubuntu-based distros, though some packages may differ.

## Contributing

Found a package that should be added? Spotted a bug?  
Open an [issue](https://github.com/fakerhog15/Linux-Mint-Debloater/issues) or send a PR.

---

<p align="center">Made by <a href="https://github.com/fakerhog15">fakerhog15</a></p>
