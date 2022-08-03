#!/bin/bash

echo -e "\e[1;95m    	  _             _             _            _             _            _     
        /\ \           _\ \          /\ \         /\ \     _    /\ \         /\ \   
       /  \ \         /\__ \        /  \ \       /  \ \   /\_\ /  \ \       /  \ \  
      / /\ \ \       / /_ \_\      / /\ \ \     / /\ \ \_/ / // /\ \ \     / /\ \ \ 
     / / /\ \ \     / / /\/_/     / / /\ \ \   / / /\ \___/ // / /\ \_\   / / /\ \_\
   
    / / /  \ \_\   / / /         / / /  \ \_\ / / /  \/____// /_/_ \/_/  / / /_/ / /
   / / /    \/_/  / / /         / / /   / / // / /    / / // /____/\    / / /__\/ / 
  / / /          / / / ____    / / /   / / // / /    / / // /\____\/   / / /_____/  
 / / /________  / /_/_/ ___/\ / / /___/ / // / /    / / // / /______  / / /\ \ \    
/ / /_________\/_______/\__\// / /____\/ // / /    / / // / /_______\/ / /  \ \ \   
\/____________/\_______\/    \/_________/ \/_/     \/_/ \/__________/\/_/    \_\/\n\e[0m"
echo -e "\e[1;95m							Made by @gitblanc - Aug 2022\n\e[0m"

USER=$1

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

gh auth login
gh repo list $USER --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done
