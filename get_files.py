import os
import pwd
import shutil

def get_username():
    return pwd.getpwuid( os.getuid() )[ 0 ]

user = get_username()
homepath = '/home/' + user + '/'

# Bashrc
source = homepath + '.bashrc'
dest = str(os.getcwd()) + '/bashrc/'
shutil.copy(source, dest)

# tmux
source = homepath + '.tmux.conf'
dest = str(os.getcwd()) + '/tmux/'
shutil.copy(source, dest)

# vim
source = homepath + '.vimrc'
dest = str(os.getcwd()) + '/vim/'
shutil.copy(source, dest)

# sublime settings
source = homepath + '.config/sublime-text-3/Packages/User/Preferences.sublime-settings'
dest = str(os.getcwd()) + '/sublime/'
shutil.copy(source, dest)