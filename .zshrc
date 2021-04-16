# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh
source ~/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Colorization Output
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
unalias ls # Not using ls defined in grc, let `zpm-zsh/ls` do the job
export COLORTERM=truecolor
export CLICOLOR=1

# History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# zplug plugins
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zpm-zsh/ls" # use with exa for better colorization
zplug "zpm-zsh/material-colors" # dircolor
zplug "zsh-users/zsh-autosuggestions" # history gray string
zplug "zdharma/fast-syntax-highlighting"
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Bindkey to solve Ctrl+left right issue
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# custom cmd alias
alias updg='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'

# Let zsh throws wildcard (*) to scp
setopt nonomatch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chenghao/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chenghao/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chenghao/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chenghao/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<