#!/bin/sh
echo "Etape 1 : Installation de brew."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Etape 2 : Installation d'Ansible."
brew install Ansible

echo "Etape 3 : Instalaltion de XCODE."
xcode-select --install

echo "Etape 4 : Installation de GIT."
brew install git

echo "Etape 5 : Clonage du dépôt GIT."
git clone https://github.com/VPecquerie/ansible-osx.git ~/.ansible_sources

echo "Etape 6 : Initialisation d'Ansible."
cd ~/.ansible_sources && ansible-playbook osx.yml -i hosts -vvv