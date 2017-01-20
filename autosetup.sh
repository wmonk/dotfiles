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
echo -e "\033[1m\033[34m==> Installing cask dependencies\033[0m"
brew cask install iterm2-nightly

