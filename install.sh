#!/bin/sh

# check if root
if [ "$EUID" = 0 ] ; then

  # install necessary packages
  if type "apt" > /dev/null; then
    apt install -y zip zsh curl git
  elif type "dnf" > /dev/null; then
    dnf install -y zip zsh curl git
  elif type "pacman" > /dev/null; then
    pacman -Sy zip zsh curl git
  else
    echo "No package manager found."
    exit 10
  fi

else
  echo "Not root/sudo. Cannot install necessary packages."
fi

# set variables
BASEDIR=$(dirname "$0")
cd $BASEDIR
BASEDIRABS=$PWD
# get the dotfiles/dotfolders to be copied
files=$(ls -ad .* | grep '^.*[^.git]')

echo "Backuping old dotfiles..."
cd $HOME
mkdir .old-dotfiles
mv $files .old-dotfiles/

cd $BASEDIRABS
echo "Creating new configuration..."
for file in $files; do
  echo "Creating symlink for $file"
  ln -s $PWD/$file $HOME/$file
done

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --keep-zshrc

echo "Done."
exit 0
