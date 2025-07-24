# Desktop configuration

## Neovim + Alacritty

- Download alacritty using `sudo snap install alacritty --classic`
- Download Neovim `0.10.1` from the releases page on github (https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz), extract somehwere and add the bin folder to path
- Install language servers - `npm i typescript-language-server -g`, `pip3 install pyright`
- Download `JetBrainsMono nerd font` from https://www.nerdfonts.com/font-downloads, and install the font `JetBrainsMonoNerdFont-Medium.ttf`
- Configure Alacritty to use the font by copying the file `alacritty.toml` in this repo to `~/.config/alacritty/alacritty.toml`
- Clone this repository to the nvim configuration folder: `git clone https://github.com/ViktorWb/nvim-setup ~/.config/nvim && nvim`
- Run `:PlugInstall`
- Install xclip: `sudo apt install xclip`
- Install gnome-tweaks, go to keyboard -> additional layout options -> caps lock behaviour -> make caps lock an additional esc: `sudo apt install gnome-tweaks`
