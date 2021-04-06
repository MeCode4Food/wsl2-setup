# Functions and variables
dqt='"'

check_plugin_and_add() {
  PLUGIN_NAME=$1
  if ! grep plugins= ~/.zshrc | grep -q $PLUGIN_NAME; then
    echo "adding ${PLUGIN_NAME}"
    # find line with plugins as start, remove all other chars aside from within brackets, assign to var
    plugins=$(grep "^plugins=" ~/.zshrc | sed 's/plugins=(//g' | sed 's/)//g')

    # add plugin to list
    plugins="${plugins} ${PLUGIN_NAME}"
    echo $plugins

    # replace entire line with new plugin list
    sed -i "s/^plugins.\+/plugins=(${plugins})/g" ~/.zshrc
  else
    echo "skipping adding ${PLUGIN_NAME}"
  fi
}

# # Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Plugins
# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add to zshrc
check_plugin_and_add zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add to zshrc
check_plugin_and_add zsh-autosuggestions

echo "Please restart zsh"