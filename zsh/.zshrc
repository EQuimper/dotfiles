# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# fnm init moved to end of file (after p10k) to avoid console output during instant prompt

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:$(go env GOPATH)/bin

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

export PATH="/Users/emanuelquimper/Library/Application Support/Herd/bin/":$PATH

export PATH=/opt/homebrew/bin:$PATH

# Theme toggle script (dark <-> light across nvim/tmux/wezterm)
export PATH="$HOME/.config/theme/bin:$PATH"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# export PATH=/usr/bin/zsh 

# React-Native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export ZELLIJ_CONFIG_DIR="$HOME/dotfiles/.config/zellij"

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias n="nvim"

alias ls="eza --icons=always --no-permissions --no-filesize --no-user --no-time"

ta() {
  local session="${1:-main}"
  tmux new-session -A -s "$session"
}

tmux-agents() {
  if [[ -z "$TMUX" ]]; then
    echo "tmux-agents must be run inside tmux" >&2
    return 1
  fi

  tmux display-popup -E -w 60 -h 14 -T " Switch Agent " \
    "$HOME/.config/tmux/.tmux/plugins/tmux-agent-status/scripts/hook-based-switcher.sh"
}

# Kill the process listening on a TCP port — e.g. `kp 3000`
kp() {
  if [[ -z "$1" ]]; then
    echo "Usage: kp <port>" >&2
    return 1
  fi
  local port="$1"
  local pids
  pids=$(lsof -ti tcp:"$port" -sTCP:LISTEN)
  if [[ -z "$pids" ]]; then
    echo "No process listening on port $port"
    return 0
  fi
  echo "$pids" | xargs kill -9 && echo "Killed on port $port: ${pids//$'\n'/ }"
}

eval "$(zoxide init zsh)"

# alias cd="z"

alias fk="fuck"
eval $(thefuck --alias fuck)
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

# Modern CLI tools — install via: brew install bat git-delta direnv atuin
# Guards mean these lines are no-ops until the tools exist.
command -v direnv >/dev/null && eval "$(direnv hook zsh)"
command -v atuin >/dev/null && eval "$(atuin init zsh)"
export BAT_THEME="Catppuccin Macchiato"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/emanuelquimper/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/emanuelquimper/Library/Application Support/Herd/config/php/83/"

. ~/.asdf/plugins/golang/set-env.zsh

export DOCKER_HOST=unix:///$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')

eval "$(/opt/homebrew/bin/mise activate)"

EAS_AC_ZSH_SETUP_PATH=/Users/emanuelquimper/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH; # eas autocomplete setupexport PATH=$PATH:$(go env GOPATH)/bin


# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/emanuelquimper/Library/Application Support/Herd/config/php/85/"
export PATH="$HOME/.local/bin:$PATH"


# Herd injected NVM configuration
# export NVM_DIR="/Users/emanuelquimper/Library/Application Support/Herd/config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Disabled: Herd NVM hooks conflict with fnm (causes nvm_find_nvmrc errors)
# [[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"
# pnpm
export PNPM_HOME="/Users/emanuelquimper/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#



eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# Added by Antigravity
export PATH="/Users/emanuelquimper/.antigravity/antigravity/bin:$PATH"


# Claude options
export CLAUDE_CODE_DISABLE_1M_CONTEXT=true
export CLAUDE_CODE_EFFORT_LEVEL=max

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
