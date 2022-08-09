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

menu () {
	# -----Menu-----
	while true ; do
        	echo "1. Clone your repositories (1000 max)"
	        echo "2. Pull a repository"
        	echo ""
	        echo "0. exit"
		echo ""

        	read -p "Select an option: " OPTION
        	case "$OPTION" in
         		[1]) github_cloner;;
         		[2]) github_puller;;
         		[0]) exit 0;;
         		  *) echo "Option not valid";;
        	esac
done
}

# -----Cloner-----
# Clones 1000 repositories as maximum
github_cloner () {
	read -p "Introduce your Github username: " USER
	echo ""

	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt update
	sudo apt install gh

	gh auth login
	gh repo list $USER --limit 1000 | while read -r repo _; do
	  gh repo clone "$repo" "$repo"
	done
}

github_puller () {
	while true ; do
		echo "---------------------"
        	echo "Select an option: "
		echo "1. Pull a repository"
		echo ""
		echo "0. Exit"
		echo ""

		read -p "Select an option: " OPTION
        	case "$OPTION" in
         		[0]) break ;;
         		[1]) read -p "Please, indicate the route of your repository: " ROUTE
	    		     cd $ROUTE
			     git pull 
			     cd;;
	  		  *) echo "Option not valid."
        esac
done

}

menu
