#!/bin/bash
echo -e "Running Clean Your Mac Script 💛\n"
echo -e -n "Do you want to perform Brew 🍺 tasks like update, upgrade and cleanup? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
#Updating brew
echo -e "Updating Brew 🍺 metadata and cleaning up the Cask 🌊.\nThis might take some time depending on your connection speed \nand number of packages installed on your system."
brew update
brew update --cask
brew upgrade
brew upgrade --cask
brew cleanup
brew doctor
fi

#user cache file
echo -e -n "Cleaning user cache files in \"~/Library/Caches\". (requires sudo) Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
sudo rm -rf ~/Library/Caches/*
echo "✅ Done Cleaning \"~/Library/Caches\"."
fi

#user logs
echo -e -n "Cleaning user log file in \"~/Library/logs\". (requires sudo) Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
sudo rm -rf ~/Library/logs/*
echo "✅ Done Cleaning \"~/Library/logs\"."
fi

#user preference log
echo -e -n "Cleaning user preference logs. Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
rm -rf ~/Library/Preferences/*
echo "✅ Done Cleaning \"/Library/Preferences\"."
fi

#system caches
echo -e -n "Cleaning system caches. (requires sudo) Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
sudo rm -rf /Library/Caches/*
echo "✅ Done Cleaning system cache."
fi

#system logs
echo -e -n "Cleaning system logs in \"/Library/logs\". (requires sudo) Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
sudo rm -rf /Library/logs/*
echo "✅ Done Cleaning \"/Library/logs\"."
fi

echo -e -n "Cleaning system logs in \"/var/log\". (requires sudo) Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
sudo rm -rf /var/log/*
echo "✅ Done Cleaning \"/var/log\"."
fi

echo -e -n "Cleaning in \"/private/var/folders\". (requires sudo) Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
sudo rm -rf /private/var/folders/*
echo "✅ Done Cleaning \"/private/var/folders\"."
fi

#iOS photo caches
echo -e -n "Cleaning iOS photo caches. Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
rm -rf ~/Pictures/iPhoto\ Library/iPod\ Photo\ Cache/*
echo "✅ Done Cleaning \"~/Pictures/iPhoto Library/iPod Photo Cache\"."
fi

#application caches
echo -e -n "Cleaning application caches. Are you sure? [Y/n]: "
read answer
name="${answer:=Y}"
if [ "$answer" != "${answer#[Yy]}" ] ;then
for f in ~/Library/Containers/*
do
    [[ -e "$f" ]] || break
    echo "Cleaning ~/Library/Containers/$f/Data/Library/Caches/"
    rm -rf ~/Library/Containers/"$f"/Data/Library/Caches/*
    echo "✅ Done Cleaning \"~/Library/Containers/$f/Data/Library/Caches\""
done
echo "✅ Done Cleaning application caches."
fi
