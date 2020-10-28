#!/bin/sh
echo "Etape 1 : Installation de brew."
if ! command -v brew &> /dev/null
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo "Etape 2 : Installation d'Ansible."
if ! command -v ansible &> /dev/null
then
    brew install Ansible
fi

echo "Etape 3 : Instalaltion de XCODE."
xcode-select --install

echo "Etape 4 : Installation de GIT."
brew install git

echo "Etape 5 : Clonage du dépôt GIT."
git clone https://gitlab.com/VPecquerie/ansible-osx.git ~/.ansible_sources

echo "Etape 6 : Initialisation d'Ansible."
cd ~/.ansible_sources && sudo ansible-playbook osx.yml -i hosts -vvv

echo "Etape 7: Configuration diverse."

defaults write com.apple.dock autohide-time-modifier -float 0.2
defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
chflags nohidden ~/Library