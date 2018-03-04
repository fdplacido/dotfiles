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

# sublime 3 (and plugins) settings
source = homepath + '.config/sublime-text-3/Packages/User/Preferences.sublime-settings'
dest = str(os.getcwd()) + '/sublime/'
shutil.copy(source, dest)
# key bindings
source = homepath + '.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap'
shutil.copy(source, dest)
# GitGutter plugin
source = homepath + '.config/sublime-text-3/Packages/User/GitGutter.sublime-settings'
shutil.copy(source, dest)

# Firefox theme
source = homepath + '.mozilla/firefox/ttoulgrc.default/chrome/userChrome.css'
dest = str(os.getcwd()) + '/firefox/'
shutil.copy(source, dest)

# Typora
source = homepath + '.config/Typora/conf/conf.user.json'
dest = str(os.getcwd()) + '/typora/conf/'
shutil.copy(source, dest)
# My github theme (numbered)
source = homepath + '.config/Typora/themes/github-numbered.css'
dest = str(os.getcwd()) + '/typora/themes/'
shutil.copy(source, dest)

