import os
import pwd
import shutil

def get_username():
    return pwd.getpwuid( os.getuid() )[ 0 ]

def copy_file(source, dest):
  if not os.path.exists(dest):
    os.makedirs(dest)
  shutil.copy(source, dest)

user = get_username()
homepath = '/home/' + user + '/'
cwd = str(os.getcwd())

# Bashrc
source = homepath + '.bashrc'
dest = cwd + '/bashrc/'
copy_file(source, dest)

# tmux
source = homepath + '.tmux.conf'
dest = cwd + '/tmux/'
copy_file(source, dest)

# vim
source = homepath + '.vimrc'
dest = cwd + '/vim/'
copy_file(source, dest)

# sublime 3 (and plugins) settings
source = homepath + '.config/sublime-text-3/Packages/User/Preferences.sublime-settings'
dest = cwd + '/sublime/'
copy_file(source, dest)
# key bindings
source = homepath + '.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap'
copy_file(source, dest)
# GitGutter plugin
source = homepath + '.config/sublime-text-3/Packages/User/GitGutter.sublime-settings'
copy_file(source, dest)

# Firefox theme
source = homepath + '.mozilla/firefox/ttoulgrc.default/chrome/userChrome.css'
dest = cwd + '/firefox/'
copy_file(source, dest)

# Typora
source = homepath + '.config/Typora/conf/conf.user.json'
dest = cwd + '/typora/conf/'
copy_file(source, dest)
# My github theme (numbered)
source = homepath + '.config/Typora/themes/github-numbered.css'
dest = cwd + '/typora/themes/'
copy_file(source, dest)

