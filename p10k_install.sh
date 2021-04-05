# Add powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Replace theme with powerlevel10k in zshrc
sed -i "s/^ZSH_THEME.\+/ZSH_THEME=${dqt}powerlevel10k\/powerlevel10k${dqt}/g" ~/.zshrc

echo "Please Restart zsh shell. To configure powerlevel10k, use\n\n> p10k configure\n"
echo "Don't forget to get the font here at https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
