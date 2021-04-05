# Functions

add_alias() {
  ALIAS_NAME=$1
  COMMAND=$2
  dqt='"'
  if ! grep -q "alias ${ALIAS_NAME}" ~/.zshrc; then
    echo "adding alias ${ALIAS_NAME}"
    sed -i "1 i # Adding Alias to repo folder\nalias ${ALIAS_NAME}=${dqt}${COMMAND}${dqt}\n" ~/.zshrc
  else
    echo "skipping adding alias ${ALIAS_NAME}"
  fi

}
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get autoremove

# Add npm & n & get latest node
sudo apt-get install npm

sudo npm i -g n
sudo n install lts

# Add tldr
sudo npm i -g tldr

# Add common shortcuts to .zshrc

# Add Alias 
add_alias repo "cd /mnt/c/Users/cheec/Documents/Repo"