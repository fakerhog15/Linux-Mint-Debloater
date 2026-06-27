<p align="center">
  <img src="linux_mint_icon.png" alt="Linux Mint" width="100"/>
</p>

# Linux Mint Debloater

A simple script to remove unwanted pre-installed packages from Linux Mint and optionally install a replacement browser.

---

## What It Removes

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

---

## Features

- **Selective removal** – pick individual packages or remove everything at once
- **`apt autoremove --purge` + `apt clean`** – fully cleans up dependencies and cache
- **Browser replacement** – choose from LibreWolf, Helium Browser, Zen Browser, or Brave Nightly after debloating

---

## Usage

### Terminal Version

```bash
chmod +x Terminal.sh
./Terminal.sh
```

### GUI Version (requires `zenity`)

```bash
chmod +x GuiMenu.sh
./GuiMenu.sh
```

---

## Notes

- Firefox and LibreOffice are included in the removal list — only run this if you're certain you don't need them.
- Since Firefox is removed, a new browser is strongly recommended. The script offers several privacy-focused alternatives.
- Tested on Linux Mint. May work on other Ubuntu-based derivatives.

---

## FAQ

**Q: Will this break my Linux Mint installation?**  
A: No. The script only removes specific pre-installed packages. Your core system, desktop environment, and settings are untouched. That said, always make a backup before running debloat scripts if you're unsure.

**Q: Can I choose which packages to remove, or is it all-or-nothing?**  
A: Both options are available. The script supports selective removal so you can pick and choose individual packages, or you can remove everything in the list at once.

**Q: I use LibreOffice and Firefox — can I skip those?**  
A: Yes. When using the selective removal mode, just don't check those packages. Nothing gets removed without your confirmation.

**Q: What browsers can I install as a replacement?**  
A: After debloating, the script gives you the option to install one of the following:
- **LibreWolf** – privacy-hardened Firefox fork
- **Helium Browser** – lightweight, minimal browser
- **Zen Browser** – modern Firefox-based browser
- **Brave Nightly** – Chromium-based with built-in ad blocking

**Q: Does this work on Ubuntu or other Ubuntu-based distros?**  
A: It's designed and tested for Linux Mint, but it may work on other Ubuntu-based systems. Results may vary since some packages listed might not be installed by default on other distros.

**Q: What does `apt autoremove --purge` actually do?**  
A: It removes the selected packages along with any leftover dependencies that are no longer needed, and `--purge` ensures config files are deleted too — not just the binaries. `apt clean` then clears the local package cache to free up disk space.

**Q: Do I need to run this as root/sudo?**  
A: Yes. Removing system packages requires root privileges. The script will prompt for your password when needed.

**Q: Is there an undo option if I remove something by mistake?**  
A: There's no built-in undo, but you can reinstall any removed package manually with `sudo apt install <package-name>`. For example: `sudo apt install libreoffice`.

**Q: Which version should I use — Terminal or GUI?**  
A: Both do the same thing. Use the **GUI version** (`GuiMenu.sh`) if you prefer a point-and-click interface with checkboxes (requires `zenity`). Use the **Terminal version** (`Terminal.sh`) if you're comfortable in the command line or `zenity` isn't installed.

**Q: How do I install `zenity` if it's not on my system?**  
A: Run `sudo apt install zenity` before launching the GUI version.

---

## Contributing

Pull requests and issue reports are welcome! If you find a package that should be added to the list, or a bug in the scripts, feel free to open an issue on the [GitHub repo](https://github.com/fakerhog15/Linux-Mint-Debloater).

---

*Made by [fakerhog15](https://github.com/fakerhog15)*
