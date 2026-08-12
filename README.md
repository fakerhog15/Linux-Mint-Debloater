<p align="center">
  <img width="600" alt="Linux Mint Debloater" src="assets/exampleimg.png" />
</p>

<div align="center">

# Linux Mint Debloater

**Strip the bloat. Keep the speed.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/fakerhog15/Linux-Mint-Debloater/blob/main/LICENSE)
[![Platform: Linux Mint](https://img.shields.io/badge/Platform-Linux%20Mint-success?logo=linuxmint)](https://linuxmint.com/)
[![Shell: Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![GitHub Stars](https://img.shields.io/github/stars/fakerhog15/Linux-Mint-Debloater?style=social)](https://github.com/fakerhog15/Linux-Mint-Debloater/stargazers)

<p>
  <a href="#what-it-removes">What It Removes</a> ·
  <a href="#features">Features</a> ·
  <a href="#quick-start">Quick Start</a> ·
  <a href="#browser-options">Browser Options</a> ·
  <a href="#faq">FAQ</a> ·
  <a href="#troubleshooting">Troubleshooting</a>
</p>

</div>

---

A powerful, fast, and interactive script suite to remove unwanted pre-installed packages from Linux Mint. Reclaim disk space, reduce background resource usage, and streamline your system with support for both **Terminal** and **GUI** (Zenity) workflows, plus seamless alternative browser installations.

---

## 📦 What It Removes

By removing pre-installed applications and running a deep system purge, you can reclaim **500 MB+** of disk space and reduce startup/background overhead.

| Package | Category | Description |
| :--- | :--- | :--- |
| `firefox` | Browser | Default web browser |
| `libreoffice-core` / `common` | Office Suite | Office document editor suite |
| `thunderbird` | Email Client | Email and calendar client |
| `hexchat` | IRC Client | Internet Relay Chat client |
| `transmission-gtk` | Torrent Client | BitTorrent download client |
| `rhythmbox` | Music Player | Audio playback application |
| `celluloid` | Video Player | MPV-based video player |
| `hypnotix` | IPTV Player | Live TV and IPTV streaming app |
| `pix` | Image Viewer | Image browser and management |
| `simple-scan` | Scanner Utility | Document and photo scanning |
| `drawing` | Image Editor | MS Paint-like drawing tool |
| `gnote` | Note-taking | Tomboy-inspired note manager |
| `xreader` | Document Viewer | PDF and document reader |
| `redshift` | Blue Light Filter | Screen color temperature adjuster |
| `baobab` | Disk Analyzer | Disk space usage analyzer |
| `seahorse` | Password Manager | GNOME keyring and keys manager |
| `warpinator` | File Sharing | Local network file transfer |
| `onboard` | On-screen Keyboard | Virtual keyboard utility |
| `gnome-calendar` | GNOME App | Calendar application |
| `gnome-logs` | GNOME App | System log viewer |
| `gnome-power-manager` | GNOME App | Power statistics manager |
| `webapp-manager` | Web App Manager | Turn websites into desktop apps |
| `thingy` | File Manager / Doc tool | Document collection viewer |

---

## ✨ Features

- **Dual Interfaces:** Choose between an interactive **Terminal Menu** or a sleek **GUI Checklist** powered by Zenity.
- **Granular Selection:** Pick individual packages or type `all` to purge everything in one go.
- **Deep System Cleanup:** Automatically executes `apt autoremove --purge` and `apt clean` to wipe orphaned dependencies, config files, and package caches.
- **Optional Browser Replacement:** Choose a modern, privacy-respecting alternative browser to install immediately after debloating.
- **Live Progress Reporting:** Visual progress bars during removal and browser installation steps in GUI mode.

---

## 🚀 Quick Start

### Prerequisites
- **Linux Mint** (or Ubuntu/Debian-based distributions)
- **Root privileges** (`sudo`)
- **Zenity** (automatically installed in GUI mode if missing)

---

### Method 1: GUI Mode (Recommended)
Launch the graphical checklist interface with progress bars and dark theme support:

```bash
git clone https://github.com/fakerhog15/Linux-Mint-Debloater.git
cd Linux-Mint-Debloater
sudo apt install zenity   # if not already installed
chmod +x GuiMenu.sh
sudo ./GuiMenu.sh
```

---

### Method 2: Terminal Mode
Run the text-based interactive terminal menu:

```bash
git clone https://github.com/fakerhog15/Linux-Mint-Debloater.git
cd Linux-Mint-Debloater
chmod +x Terminal.sh
sudo ./Terminal.sh
```

---

## 🌐 Browser Options

After debloating your system, you can optionally install a modern alternative browser:

| Browser | Engine / Base | Available In | Highlights |
| :--- | :--- | :--- | :--- |
| **LibreWolf** | Firefox | Terminal & GUI | Privacy-hardened, telemetry-free, enhanced security |
| **Helium** | Chromium | Terminal & GUI | Lightweight, minimal UI, fast performance |
| **Zen Browser** | Firefox | Terminal Only | Innovative modern UI, vertical tabs, highly customizable |
| **Brave Nightly** | Chromium | Terminal & GUI | Built-in ad/tracker blocking, cutting-edge features |

---

## ❓ FAQ

<details>
<summary><b>Will debloating break my Linux Mint system?</b></summary>
<p>No. The script only targets user-facing pre-installed applications. Your desktop environment (Cinnamon, MATE, XFCE), core system utilities, and system stability remain completely untouched.</p>
</details>

<details>
<summary><b>Can I pick specific packages to keep (e.g. keep Firefox)?</b></summary>
<p>Yes! Both Terminal and GUI modes allow you to select individual packages or uncheck anything you wish to keep.</p>
</details>

<details>
<summary><b>How can I restore a removed package?</b></summary>
<p>You can reinstall any package at any time using apt:</p>

```bash
sudo apt update && sudo apt install <package-name>
```
<p>For example: <code>sudo apt install firefox libreoffice-core</code></p>
</details>

<details>
<summary><b>Does this work on Ubuntu or Debian?</b></summary>
<p>The script is specifically tailored and tested for Linux Mint. While it should work on Ubuntu and Debian-based distributions, some package names may vary.</p>
</details>

---

## 🛠️ Troubleshooting

- **`zenity: command not found`**: The GUI script attempts to install `zenity` automatically. If your package manager fails, install it manually: `sudo apt install zenity`.
- **Permission Denied / `sudo: command not found`**: Ensure execution permissions are granted (`chmod +x *.sh`) and run the scripts with `sudo`.
- **Package Not Found**: Certain packages might already be uninstalled or named differently depending on your Linux Mint version. The scripts handle missing packages gracefully.

---

## 🤝 Contributing

Contributions, bug reports, and feature suggestions are always welcome! Feel free to open an [Issue](https://github.com/fakerhog15/Linux-Mint-Debloater/issues) or submit a Pull Request.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/fakerhog15">fakerhog15</a>
</p>
