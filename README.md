# bash-beauty-guide
This guide is to make your bash beautiful, and make it easy to use.

**The guide to make your vim beautiful, please refer to [vim-beauty-guide](https://github.com/MrCoderKai/vim-beauty-guide).**

# Contents
- [Configure Files List](#configure-files-list)
- [Environment](#environment)
- [Color Scheme for iTerm2](#color-scheme-for-iterm2)
    - [Issue](#issue)
- [Install zsh](#install-zsh)
- [Install MacVim](#install-macvim)
- [Install Powerine Fonts](#install-powerline-fonts)
- [oh-my-zsh](#oh-my-zsh)
    - [Install oh-my-zsh](#install-oh-my-zsh)
    - [Install Powerlevel9k Theme](#install-powerlevel9k-theme)
    - [Configure oh-my-zsh](#confgiure-oh-my-zsh)
        - [Configuration I](#configuration-i)
        - [Configuration II](#configuration-ii)
        - [Configuration III](#configuration-iii)
        - [Configuration IV](#configuration-iv)
    - [Activate oh-my-zsh](#activate-oh-my-zsh)
- [tmux](#tmux)
    - [Install tmux](#install-tmux)
    - [Configure tmux](#configure-tmux)
- [Shortcuts](#shortcuts)
    - [tmux](#tmux)
        - [In zsh Terminal](#in-zsh-terminal)
        - [In tmux](#in-tmux)

# Configure Files List
Describe: There are some other configurations that are not mentioned in this guide. An easy way to configure is move the following configure files to the specific path.

**Note: Even all configure files are provided, you should read this guide carefully.**

1. `.bash_profile` - This file should under path `~/`
2. `.zshrc` - This file should under path `~/`
3. `.tmux.conf` - This file should under path `~/`

# Environment
1. Macbook Pro 2018
2. OS version: macOS Mojave 10.14.4 (18E226)

# Color Scheme for iTerm2
1. Download **solarized** color scheme.
```
cd ~
git clone https://github.com/altercation/solarized.git
```
2. Open iTerm2, select `iTerm2->Preferences...->Profiles->Colors->Color Presets...->import`. Choose solarized color scheme from downloaded git respository, and find `iterm2-colors-solarized` folder. In this case, the path should be `~/solarized/iterm2-colors-solarized`.

## Issue
After setting **solarized** as iTerm2 color scheme, the outputs of command `ls` can not distinguish file and directory by different colors. To solve this issue, please open iTerm2, and select `iTerm2->Preferences...->Profiles->Colors`, uncheck **Bold** in **Basic Colors** region.

# Install zsh
**Zsh** is a shell designed for interactive use, although it is also a powerful scripting language.

1. Check whether **zsh** has been installed or not

`zsh --version`

By default, **zsh** is pre-installed in MacOs.

If **zsh** is not installed, use the following command to install it.

`brew install zsh`

2. Check which bash is used currently.

`echo $SHELL`

If output is not `/bin/zsh`, we should change it.

```
vim ~/.bash_profile
# add following configures to .bash_profile
export SHELL=/bin/zsh
exec /bin/zsh -l
```
Then, **zsh** would be the default termianl.

# Install MacVim
In [vim-beauty-guide](https://github.com/MrCoderKai/vim-beauty-guide), YouCompleteMe plugin is install for auto completion. And error, which is discussed in [issue 3271](https://github.com/Valloric/YouCompleteMe/issues/3271), will accur after setting **zsh** as the default terminal. To avoid this error, **MacVim** should be installed.

1. Click [MacVim download link](https://macvim-dev.github.io/macvim/) to download **MacVim**;
2. Double click **MacVim.dmg** to install **MacVim**.
3. `/Applications/MacVim.app/Contents/MacOS/Vim ~/.zshrc`
4. Add following configurations to **~/.zshrc** to replace **vim** by **MacVim**
```
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
```
5. The default editor of command `crontab` is `nano`, which would accur the same error as **zsh**. Thus, its editor should be replaced by **MacVim**, too.
6. Add following configurations to **~/.bash_profile** to replace default editor of `crontab` by **MacVim**.
```
# set default editor for command `crontab -e`, if not, error accurs
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
```
6. Exit editting **~/.zshrc** and use `source ~/.zshrc` to enable those configurations.

# Install Powerline Fonts
**Powerline** Fonts should be installed before installing **oh-my-zsh**, otherwise, `?` will appear in **zsh** terminal.

The guide to install **powerline** is as following:
1. Download and install powerline fonts
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

2. Configure **iTerm2** default fonts. Open iTerm2, select `iTerm2->Preferences...->Profiles->text`, find `Font` region, click `Change Font`, select `Monaco`, and check `Use a different font for non-ASCII text`, select `Monaco`.

# oh-my-zsh
Oh My Zsh is an open source, community-driven framework for managing your **zsh** configuration.
## Install oh-my-zsh
1. `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

## Install Powerlevel9k Theme
1. `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
2. Edit `~/.zshrc` file, add following configurations:
```
ZSH_THEME="powerlevel9k/powerlevel9k"
```

## Configure oh-my-zsh
### Configuration I
Add following configurations to `~/.zshrc`
```
# DEFAULT_USER must be user name of your account
DEFAULT_USER='administrator'
```

### Configuration II
Simply the appearence of left command line

Add following configurations to `~/.zshrc`
```
# set oh-my-zsh powerlevel9k theme left elements appearence
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
# set oh-my-zsh powerlevel9 theme right elements appearence
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs       time)
```
### Configuration III
Enable syntax highlight.

1. Install `zsh-syntax-highlighting` plugin

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlightin`

2. Add `zsh-syntax-highlighting` plugin to `~/.zshrc` file. Find `plugins=` in `~/.zshrc`, and add `zsh-syntax-highlighting` in brackets. Now, the configuration should like this:
```
# Plugin zsh-syntax-highlighting MUST be the latst one
plugins=(git
    zsh-syntax-highlighting
    )
```

Note: Plugin `zsh-syntax-highlighting` **MUST** be the latst one.

### Configuration IV
Enable command completion.
1. Install plugin `zsh-autosuggestion`
```
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions
vim ~/.zshrc
```
2. Edit `~/.zshrc`, add this plugin. Now, `plugin` configuration should like this:
```
plugins=(git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
```
## Activate oh-my-zsh
1. Add following configurations to `~/.zshrc`:
```
# enable oh-my-sh
export ZSH=/Users/administrator/.oh-my-zsh
source $ZSH/oh-my-zsh.s
```

**Note: `ZSH` should be your real path.**
2. Exit editing `~/.zshrc` file. And execute `source ~/.zshrc` to activate **oh-my-zsh** plugin.

# tmux
## Install tmux
1. `brew install tmux`
## Configure tmux
1. Create `~/.tmux.conf`, and add following configurations:
```
# set prefix
set -g prefix C-x
# unbind prefix with Ctrl-b
unbind C-b
# bind r to reload configuration file
bind r source-file ~/.tmux.conf \; display "Reloaded .tmux.conf file!"

# select pane
# up
bind-key k select-pane -U
# down
bind-key j select-pane -D
# left
bind-key h select-pane -L
# right
bind-key l select-pane -R

# select last used window
bind-key C-l select-window -l

# split pane vertical
bind | split-window -h
# split pane horizontal
bind - split-window -v

# set start index of window is 1, not 0
set -g base-index 1
# set start index of pane is 1, not 0
set -g pane-base-index 1

# enable status notification when non-current window updated
setw -g monitor-activity on
```

# Shortcuts
## tmux
### In zsh Terminal
1. `tmux new -s *session_name*` - Create a new tumx session with name
2. `tmux list-session` or `tmux ls` - List all activated session of in tmux server
3. `tmux a[ttach] -t *session_name*` - Attach to the specific session from terminal
### In tmux
1. `Ctrl+l` - Clear screen. **No Prefix.**
Note: `Ctrl+k` is avoided to clear screen in tmux server, otherwise, screen will in chaos. However, `Ctrl+k` is allowed in terminal.
2. `Prefix+Ctrl+l` - Select the last used window. **Prefix must be pressed**
3. `Prefif+c` - Create new window in tmux server. **c is short for *create*.**
4. `Prefix+n` - **N**ext window.
5. `Prefix+p` - **P**revious window.
6. `Prefix+number` - Select corresponding window marked by `number`.
