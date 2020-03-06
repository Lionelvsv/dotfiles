echo "Creating an SSH key for you..."
ssh-keygen -t rsa -C "lionelvsv@gmail.com"

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"

echo "key name  should be  /Users/lionelvsv/.ssh/id_rsa_lionel"
echo "add the  key  to  ssh  in  seperate window"
echo "ssh-add ~/.ssh/id_rsa_lionel"
read -p "Press [Enter] key after this..."

eval "$(ssh-agent -s)"


echo "Creating an SSH key for work..."
ssh-keygen -t rsa -C "vishal@wagstays.com"

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"

echo "key name  should be  /Users/lionelvsv/.ssh/id_rsa_wagstays"
echo "add the  key  to  ssh  in  seperate window"
echo "ssh-add ~/.ssh/id_rsa_wagstays"
read -p "Press [Enter] key after this..."


cd
cp config ~/.ssh

echo ""
echo "------------------------------"
echo "Updating OSX and installing Xcode command line tools"
echo "------------------------------"
echo ""
./osxprep.sh

# Run the brew.sh Script
# For a full listing of installed formulae and apps, refer to
# the commented brew.sh source file directly and tweak it to
# suit your needs.
echo ""
echo "------------------------------"
echo "Installing Homebrew along with some common formulae and apps."
echo "This might take a while to complete, as some formulae need to be installed from source."
echo "------------------------------"
echo ""
./brew.sh


echo "Git config"

git config --global user.name "lionelvsv"
git config --global user.email lionelvsv@gmail.com



# #  bash completion
# echo "installing bash completion"

# brew install bash-completion
# # brew search completion
# echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile




#  install emacs

echo "installing emacs"
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d




#  install fira code

brew tap homebrew/cask-fonts
brew cask install font-fira-code


git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..

# install unarchiver

# brew cask install the-unarchiver



brew install  nvm



./npm.sh


echo "Cleaning up brew"
brew cleanup



# Install the Solarized Dark theme for iTerm
open "./Dracula.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


# karabiner settings
echo -n "linking karabiner settings"
ln -s $HOME/dotfiles/karabiner ~/.config/karabiner
echo "done"


ln -s $HOME/dotfiles/.zshrc ~/.config/.zshrc
# Reload zsh settings
source ~/.zshrc
