# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# UTF-8 Locale (necesario para Nerd Fonts/Unicode en Starship)
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Path configuration
export PATH="/opt/homebrew/bin:$HOME/.cargo/bin:$PATH"

# Load environment variables
if [[ -f ~/.env ]]; then
    source ~/.env
fi

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Disable Powerlevel10k theme
ZSH_THEME=""

# Plugins
plugins=(
  git
  node
  npm
  python
  pip
  tmux
  docker
  docker-compose
  kubectl
  helm
  extract
  z
  sudo
  colorize
  copypath
  copyfile
  web-search
  aws
  terraform
)

# Load Oh My Zsh (if installed)
if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    source $ZSH/oh-my-zsh.sh
fi

# SDKMAN configuration
export SDKMAN_DIR="$HOME/.sdkman"
if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Carapace completions configuration (después de Oh My Zsh)
if command -v carapace >/dev/null 2>&1; then
    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
    export CARAPACE_LENIENT=false

    # Configuración de zsh completion con límite de 50 opciones
    zstyle ':completion:*' list-max 50
    zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
    zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

    # PRIORIZAR COMANDOS SOBRE ARCHIVOS
    zstyle ':completion:*' completer _complete _ignored _approximate
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*:descriptions' format '%B%d%b'
    zstyle ':completion:*:commands' rehash 1

    # Orden de completado: comandos primero, luego archivos
    zstyle ':completion:*' tag-order 'commands functions aliases builtins reserved-words' 'local-directories directories' files

    # Para git específicamente, priorizar subcomandos
    zstyle ':completion:*:git:*' tag-order 'common-commands'

    # Configuración para navegación con flechas
    zstyle ':completion:*' menu select
    zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

    # Mostrar menú automáticamente sin preguntar
    zstyle ':completion:*' menu select=long
    zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

    # No preguntar si hay muchas opciones, mostrar directamente
    LISTMAX=0

    # Habilitar navegación con flechas en el menú
    bindkey -M menuselect '^[[A' up-line-or-history      # Flecha arriba
    bindkey -M menuselect '^[[B' down-line-or-history    # Flecha abajo
    bindkey -M menuselect '^[[C' forward-char            # Flecha derecha
    bindkey -M menuselect '^[[D' backward-char           # Flecha izquierda
    bindkey -M menuselect '^M' .accept-line              # Enter para aceptar

    source <(carapace _carapace)
fi

# Lazy load NVM for performance
export NVM_DIR="$HOME/.nvm"
nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # Load nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # Load nvm bash_completion
  nvm "$@"
}
node() {
  nvm
  node "$@"
}
npm() {
  nvm
  npm "$@"
}
npx() {
  nvm
  npx "$@"
}

# Atuin configuration
. "$HOME/.atuin/bin/env"

if command -v atuin &> /dev/null; then
    # Inicializar sin bindings por defecto
    eval "$(atuin init zsh --disable-ctrl-r --disable-up-arrow)"

    # Configurar teclas que no conflicten con tmux:
    # Ctrl+F para búsqueda (en lugar de Ctrl+R)
    bindkey '^F' _atuin_search_widget

    # Ctrl+G para búsqueda en directorio actual
    bindkey '^G' _atuin_search_directory_widget

    # Widget personalizado para búsqueda por directorio
    _atuin_search_directory_widget() {
        emulate -L zsh
        zle -I
        local selected=$(atuin search --interactive --filter-mode directory)
        if [[ -n $selected ]]; then
            BUFFER=$selected
            zle end-of-line
        fi
        zle reset-prompt
    }
    zle -N _atuin_search_directory_widget
fi

# Aliases
alias claude="/Users/cbenitez/.claude/local/claude"
alias ls='lsd'
alias cat='bat'

# Local bin environment
. "$HOME/.local/bin/env"

# Starship prompt (must be at the end)
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
# Docker CLI completions
fpath=(/Users/cbenitez/.docker/completions $fpath)

#kubernetes
export KUBECONFIG=/Users/cbenitez/chocolandia_kube/terraform/environments/chocolandiadc-mvp/kubeconfig

# Kubectl autocompletion
if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
fi

# Kubernetes aliases
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgn='kubectl get nodes'
alias kgd='kubectl get deployments'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs'
alias kx='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'

# kubectx/kubens aliases
alias kctx='kubectx'
alias kns='kubens'

# Stern (logs mejorados)
alias ks='stern'

# Helm aliases
alias h='helm'
alias hls='helm list'
alias hin='helm install'
alias hun='helm uninstall'
alias hup='helm upgrade'

# K9s
alias k9='k9s'

# Added by Antigravity
export PATH="/Users/cbenitez/.antigravity/antigravity/bin:$PATH"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
