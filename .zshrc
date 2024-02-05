# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd

# History in cache directory:
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTSIZE=10000000
SAVEHIST=10000000

# Load aliases.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Some others binds:
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^[[P" delete-char
bindkey '^H' backward-kill-word
bindkey \^K kill-line
bindkey -s '^n' 'nnn\n'

# NNN's cd on quit:
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
   source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh 
fi
