from github import Github
# pip install gitpython
from git import Repo
# to obtain current directory
import os

print("_________ .__\n" +
"\_   ___ \|  |   ____   ____   ___________\n" +
"/    \  \/|  |  /  _ \ /    \_/ __ \_  __ \\\n" +
"\     \___|  |_(  <_> )   |  \  ___/|  | \/\n" +
" \______  /____/\____/|___|  /\___  >__|\n" +
"        \/                 \/     \/      ")
print("              Made by gitblanc - nov 2022\n")

# github username
username = input("Introduce your github username:")
# using an access token
g = Github(input("Introduce your github access token: "))
# directory where the repositories will be cloned
repo_dir = os.getcwd() + "/security-copy/"

# We search through the repositories of the user
for repo in g.get_user().get_repos():
    git_url = "https://github.com/" + username + "/" + repo.name + ".git"
    if os.path.exists(repo_dir + repo.name): # If exists, we update it
        print("Updating " + repo.name)
        os.chdir(repo_dir + repo.name)  # Specifying the path where the cloned project needs to be pulled
        os.system("git pull")
    else: # else we clone it
        print("Cloning into " + repo.name)
        os.chdir(repo_dir)  # Specifying the path where the cloned project needs to be cloned
        os.system("git clone --progress --verbose " + git_url)  # verbose
        # os.system("git clone " + git_url) # no verbose
