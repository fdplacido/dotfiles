import os
import pwd
import shutil

def get_username():
    return pwd.getpwuid( os.getuid() )[ 0 ]

user = get_username()
homepath = '/home/' + user + '/'
cwd = str(os.getcwd())

# args: copy file 'source' to directory 'dest'
def copy_file(source, dest):
  source = homepath + source
  dest = cwd + dest
  if not os.path.exists(dest):
    os.makedirs(dest)
  shutil.copy(source, dest)

# Bashrc
copy_file('.bashrc', '/bashrc/')

# tmux
copy_file('.tmux.conf', '/tmux/')

# vim
copy_file('.vimrc', '/vim/')

# sublime 3 (and plugins) settings
copy_file('.config/sublime-text-3/Packages/User/Preferences.sublime-settings', '/sublime/')
# key bindings
copy_file('.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap', '/sublime/')
# GitGutter plugin
copy_file('.config/sublime-text-3/Packages/User/GitGutter.sublime-settings', '/sublime/')

# Firefox theme
copy_file('.mozilla/firefox/2rgud95x.default/chrome/userChrome.css', '/firefox/')
# Firefox config
copy_file('.mozilla/firefox/2rgud95x.default/user.js', '/firefox/')

# Typora
copy_file('.config/Typora/conf/conf.user.json', '/typora/conf/')
# My github theme (numbered)
copy_file('.config/Typora/themes/github-numbered.css', '/typora/themes/')

