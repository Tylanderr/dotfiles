# Dotfiles TODO
- Write shell script to install all required tools to get repo up and running
- Check out ansible vault
- Possibly look into stow?

# Setup neovim
# Remember to run
- sudo apt-get update
- sudo apt-get upgrade
- sudo apt-get install ca-certificates
# Install nvm, npm, gcc and python
- Install nvm
    - curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    - source ~/.bashrc
    - nvm list-remote
    - nvm install version-number
- Create symlinks to the node things that nvm installed
    - sudo ln -s $(realpath `which npm`) /usr/local/bin/npm
    - sudo ln -s `which node` /usr/local/bin/node
    - sudo ln -s `which tsc` /usr/local/bin/tsc
- sudo apt install python3
- sudo apt install gcc
# Download neovim tarball
- move it to ~/.local/bin
- extract it with "tar -xzvf nvim-linux64.tar.gz"
- create a symlink "ln -s ./nvim-linux64/bin/nvim ./nvim"
# Install CLI Tools
- sudo apt-get install ripgrep
- sudo apt install fzf
# Lua files
- create directory ~/.config/nvim
- Move lua files into this directory
# Tmux
- sudo apt install tmux
- git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
- Place tmux.conf in .config/tmux/
    - prefix+I to install
# Install Starship
- curl -sS https://starship.rs/install.sh | sh
# Install Lazygit
- LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
- curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
- tar xf lazygit.tar.gz lazygit
- sudo install lazygit /usr/local/bin
# Install EZA
- sudo apt update
- sudo apt install -y gpg
- sudo mkdir -p /etc/apt/keyrings
- wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
- echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
- sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
- sudo apt update
- sudo apt install -y eza
# Install Java
- sudo apt install openjdk-17-jdk openjdk-17-jre
- sudo apt install maven -y
