# Functions

add_alias() {
  ALIAS_NAME=$1
  COMMAND=$2
  DESCRIPTION=$3
  dqt='"'

  touch ~/.bash_aliases

  if ! grep -q "alias ${ALIAS_NAME}" ~/.bash_aliases; then
    echo "adding alias ${ALIAS_NAME}"
    echo "# Alias ${ALIAS_NAME}: ${DESCRIPTION}\nalias ${ALIAS_NAME}=${dqt}${COMMAND}${dqt}\n" >>~/.bash_aliases
  else
    echo "skipping adding alias ${ALIAS_NAME}"
  fi
}

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

# Add npm & n & get latest node
sudo apt install -y npm

sudo npm i -g n
sudo n install lts

# Add tldr
sudo npm i -g tldr

# Add python and virtualenv/package manager poetry
sudo apt install -y make build-essential libssl-dev zlib1g-dev # add pyenv dependencies
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
source $HOME/.poetry/env

# Add LSD (update package if necessary here https://github.com/Peltoche/lsd/releases)
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
sudo dpkg -i lsd_0.20.1_amd64.deb # adapt version number and architecture
rm lsd_0.20.1_amd64.deb

# Set alias
add_alias ls "lsd" "Replacement for ls"
add_alias la "lsd -la" "Replacement for ls -la"

# Uncommenting DISABLE_LS_COLORS="true" in zshrc due to oh my zsh making their own ls aliases
sed -i -e "s/^# DISABLE_LS_COLORS/DISABLE_LS_COLORS/g" -e "s/^#DISABLE_LS_COLORS/DISABLE_LS_COLORS/g" ~/.zshrc

# Add common shortcuts to .zshrc
add_alias repo "cd /mnt/c/Users/cheec/Documents/Repo" "Alias to repo folder"
add_alias desktop "cd /mnt/c/Users/cheec" "Alias to desktop"

# Add fonts for LSD
echo "Don't forget to get the font here at https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
echo "And configure VScode to use the font via the terminal.integrated.fontFamily parameter"
