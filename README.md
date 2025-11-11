<div align="center">

<!-- Banner -->
<img src="ban.png" alt="Dotfiles Banner" width="800px">

<!-- Badges -->
<p>
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black">
  <img src="https://img.shields.io/badge/Maintained-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/badge/Made%20with-Love-ff69b4?style=for-the-badge">
</p>

<!-- Description -->
<h3>🎨 Aesthetic • ⚡ Lightweight • 🛠️ Functional</h3>
<p>A carefully crafted collection of dotfiles designed for productivity and visual appeal.<br>Optimized for minimal resource usage without compromising on features.</p>

---

</div>

## 📋 Table of Contents

- [Gallery](#-gallery)
- [Features](#-features)
- [System Information](#-system-information)
- [Installation](#-installation)
- [Dependencies](#-dependencies)
- [Keybindings](#%EF%B8%8F-keybindings)
- [Customization](#-customization)
- [Credits](#-credits)

---

## 🖼️ Gallery

### 🌊 I3 Blue Edition

<div align="center">
  <img src="i3-preview.png" alt="I3 Blue Edition Preview" width="800px">
</div>

<div align="center">
  
| Component | Details |
|-----------|---------|
| **WM** | i3-gaps |
| **Bar** | Polybar |
| **Terminal** | Alacritty |
| **Shell** | Zsh |
| **Color Scheme** | Material Design Dark |
| **RAM Usage** | ~300MB idle |

</div>

<details>
<summary>📸 More Screenshots</summary>

<!-- Add more screenshots here -->
```
Add images like:
- Desktop overview
- Terminal with vim/neovim
- Application launcher
- Workspace switching
- Lockscreen
```

</details>

---

## ✨ Features

### 🎯 Core Components

- **🪟 Window Manager**: i3-gaps with beautiful gaps and shadows
- **📊 Status Bar**: Polybar with custom modules (CPU, RAM, Network, Volume)
- **🖥️ Terminal**: Alacritty with GPU acceleration
- **🐚 Shell**: Zsh with autosuggestions and syntax highlighting
- **🎨 Color Scheme**: Material Design with consistent theming across all apps
- **🚀 Performance**: Lightweight setup (~300MB RAM usage)

### 🔧 Enhanced Productivity

- ✅ Vim-like keybindings throughout the system
- ✅ Smart window management with i3
- ✅ Fast application launcher
- ✅ Git integration in terminal prompt
- ✅ Custom aliases for common tasks
- ✅ Automated workspace organization

---

## 💻 System Information

<div align="center">

| Component | Specification |
|-----------|--------------|
| **Distro** | Debian/Ubuntu based |
| **Kernel** | Linux 5.x+ |
| **Display Server** | X11 |
| **Init System** | systemd |

</div>

---

## 🚀 Installation

### Quick Install

```bash
# Clone the repository
git clone https://github.com/user7210unix/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run the installation script
./install.sh

# Or install manually (see below)
```

### Manual Installation

<details>
<summary><b>1. Install Dependencies</b></summary>

```bash
# Core packages
sudo apt update
sudo apt install -y i3-gaps polybar alacritty zsh \
  git curl wget feh picom dunst rofi \
  fonts-nerd-fonts-hack

# Optional but recommended
sudo apt install -y neofetch htop ranger nitrogen
```

</details>

<details>
<summary><b>2. Backup Existing Configs</b></summary>

```bash
# Create backup directory
mkdir -p ~/.config_backup

# Backup existing configs
cp -r ~/.config/i3 ~/.config_backup/ 2>/dev/null
cp -r ~/.config/alacritty ~/.config_backup/ 2>/dev/null
cp -r ~/.config/polybar ~/.config_backup/ 2>/dev/null
cp ~/.zshrc ~/.config_backup/ 2>/dev/null
```

</details>

<details>
<summary><b>3. Install Configurations</b></summary>

```bash
# Copy dotfiles
cp -r .config/* ~/.config/
cp .zshrc ~/

# Install Zsh plugins
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
```

</details>

<details>
<summary><b>4. Set Zsh as Default Shell</b></summary>

```bash
# Change default shell
chsh -s $(which zsh)

# Reload shell
source ~/.zshrc
```

</details>

<details>
<summary><b>5. Apply Changes</b></summary>

```bash
# Reload i3
i3-msg reload

# Restart polybar
killall polybar
polybar main &

# Set wallpaper (replace with your wallpaper path)
feh --bg-scale ~/dotfiles/wallpapers/default.jpg
```

</details>

---

## 📦 Dependencies

### Required

```
i3-gaps          - Window manager with gaps support
polybar          - Status bar
alacritty        - Terminal emulator
zsh              - Shell
picom            - Compositor for transparency and shadows
feh              - Wallpaper setter
dunst            - Notification daemon
rofi             - Application launcher
```

### Optional

```
neofetch         - System information tool
ranger           - File manager
nitrogen         - Wallpaper manager GUI
maim/scrot       - Screenshot tools
```

### Fonts

```
Nerd Fonts       - For icons in terminal and polybar
JetBrains Mono   - Coding font
```

---

## ⌨️ Keybindings

<div align="center">

| Action | Keybinding |
|--------|-----------|
| **Window Management** | |
| Focus Left | `Mod + h` |
| Focus Down | `Mod + j` |
| Focus Up | `Mod + k` |
| Focus Right | `Mod + l` |
| Move Window Left | `Mod + Shift + h` |
| Move Window Down | `Mod + Shift + j` |
| Move Window Up | `Mod + Shift + k` |
| Move Window Right | `Mod + Shift + l` |
| Toggle Fullscreen | `Mod + f` |
| Close Window | `Mod + Shift + q` |
| **Applications** | |
| Terminal | `Mod + Return` |
| Rofi Launcher | `Mod + d` |
| Browser | `Mod + w` |
| File Manager | `Mod + e` |
| **Workspaces** | |
| Switch to Workspace 1-10 | `Mod + 1-0` |
| Move to Workspace 1-10 | `Mod + Shift + 1-0` |
| **System** | |
| Reload i3 | `Mod + Shift + c` |
| Restart i3 | `Mod + Shift + r` |
| Exit i3 | `Mod + Shift + e` |
| Lock Screen | `Mod + x` |

</div>

> **Note**: `Mod` key is set to `Super` (Windows key) by default

---

## 🎨 Customization

### Changing Colors

Edit the color scheme in:
- **Alacritty**: `~/.config/alacritty/colors-material.toml`
- **i3**: `~/.config/i3/config` (color variables at top)
- **Polybar**: `~/.config/polybar/config.ini`

### Changing Wallpaper

```bash
# Set wallpaper
feh --bg-scale /path/to/your/wallpaper.jpg

# Make it persistent
echo 'feh --bg-scale /path/to/your/wallpaper.jpg' >> ~/.config/i3/config
```

### Modifying Polybar Modules

Edit `~/.config/polybar/config.ini` and customize:
- Module order
- Colors
- Update intervals
- Module content

---

## 🐛 Troubleshooting

<details>
<summary><b>Polybar not showing</b></summary>

```bash
# Check if polybar is running
killall polybar
polybar main &

# Check logs
cat /tmp/polybar.log
```

</details>

<details>
<summary><b>Zsh plugins not working</b></summary>

```bash
# Reinstall plugins
rm -rf ~/.zsh
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# Source zshrc
source ~/.zshrc
```

</details>

<details>
<summary><b>Icons not showing in polybar/terminal</b></summary>

```bash
# Install Nerd Fonts
sudo apt install fonts-nerd-fonts-hack
fc-cache -fv
```

</details>

---

## 📝 TODO

- [ ] Add automated install script
- [ ] Create backup/restore functionality
- [ ] Add more color schemes
- [ ] Document customization options
- [ ] Add video showcase
- [ ] Create wiki with detailed guides

---

## 💖 Credits

### Inspiration

- [Owl4ce/dotfiles](https://github.com/Owl4ce/dotfiles) - Design inspiration
- [Material Design](https://material.io) - Color scheme
- [r/unixporn](https://reddit.com/r/unixporn) - Community inspiration

### Tools & Projects

- [i3wm](https://i3wm.org/) - Window manager
- [Polybar](https://github.com/polybar/polybar) - Status bar
- [Alacritty](https://github.com/alacritty/alacritty) - Terminal emulator
- [Zsh](https://www.zsh.org/) - Shell

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">

### ⭐ Star this repo if you find it useful!

**Made with ❤️ by [user7210unix](https://github.com/user7210unix)**

<img src="https://img.shields.io/badge/-Thanks for visiting!-%2378dba9?style=for-the-badge&logo=linux&labelColor=171b20&logoColor=ffffff">

</div>
