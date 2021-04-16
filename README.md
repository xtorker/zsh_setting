# zsh_setting

## Prerequisite
- grc
`apt install grc`

- exa
`apt install exa` (from Ubuntu 20.10)
or
Install manually (https://the.exa.website/install/linux#manual)

- marlonrichert/zsh-autocomplete
In $HOME,
`git clone https://github.com/marlonrichert/zsh-autocomplete.git`

## Install zsh and zplug
- zsh
`apt install zsh`

- zplug
`curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh`

## Test everything is fine
`exec zsh`

If everything is alright, change your default shell.
`chsh -s $(which zsh)`

## Reload
Everytime you make a change to `.zshrc` or `.zprofile`, use `exec zsh` to reload and make it works.