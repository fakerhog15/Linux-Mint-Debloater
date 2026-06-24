text_content = """# Linux Mint Debloater

A simple, lightweight bash script designed to streamline Linux Mint by removing pre-installed software, tools, and heavy packages that many users don't need. This helps free up disk space, reduce background resource consumption, and provide a leaner operating system experience.

## ⚠️ Disclaimer

**Use with caution!** Modifying system packages always carries an inherent risk. 
* "Bloatware" is entirely subjective; what one user considers useless, another might consider a vital dependency. 
* It is **highly recommended** that you create a system snapshot using **Timeshift** before running this script so you can easily revert changes if something breaks.

---

## ✨ Features

- **Package Purging:** Uninstalls unnecessary apps (e.g., specific media players, games, drawing tools, or chat clients depending on your script configuration).
- **Residual Cleanup:** Automatically runs `apt autoremove` and `apt autoclean` to purge left-over system dependencies and cache.
- **System Update:** Updates package repositories and upgrades existing packages to make sure your system remains stable post-debloat.
- **Minimalistic & Fast:** Pure shell execution without unnecessary overhead.

## 🚀 Getting Started

### Prerequisites

You need `git` installed to clone this repository. If you don't have it, install it using:
