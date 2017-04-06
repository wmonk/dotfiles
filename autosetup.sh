reset() {
    echo -e "j w"
}
echo -e "\033[1m\033[34m==> Installing brew\033[0m"
if [[ $(which brew) == "/usr/local/bin/brew" ]]
then
    echo "Brew installed already, skipping"
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo ""
echo -e "\033[1m\033[34m==> Installing brew dependencies\033[0m"
brew install $(cat ./brew-list)

echo ""
echo -e "\033[1m\033[34m==> Installing global npm dependencies\033[0m"
npm i -g reload create-react-app yarn supervisor 

echo ""
echo -e "\033[1m\033[34m==> Adding cask alternatives\033[0m"
brew tap caskroom/versions

echo ""
echo -e "\033[1m\033[34m==> Installing cask dependencies\033[0m"
brew cask install iterm2-nightly slack-beta alfred jitouch kap

echo ""
echo -e "\033[1m\033[34m==> Installing vim plug\033[0m"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo $(which fish) >> /etc/shells
chsh -s $(which fish)

osascript -e "tell application \"iTerm2\"\n
tell current session of current window\n
split horizontall with default profile\n
close\n
  end tell\n
end tell"
