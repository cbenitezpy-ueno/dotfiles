# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash"
source /Users/cbenitez/.docker/init-bash.sh || true # Added by Docker Desktop

. "$HOME/.local/bin/env"

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# Configuración de atuin
if [ -f ~/.bash-preexec.sh ]; then
    source ~/.bash-preexec.sh
fi

if command -v atuin &> /dev/null; then
    # Inicializar sin bindings por defecto
    eval "$(atuin init bash --disable-ctrl-r --disable-up-arrow)"
    
    # Configurar teclas que no conflicten con tmux:
    # Ctrl+F para búsqueda (en lugar de Ctrl+R)
    bind '"\C-f": "\C-a\C-k\C-uatuin search --interactive\C-m"'
    
    # Opcional: Ctrl+G para búsqueda en directorio actual
    bind '"\C-g": "\C-a\C-k\C-uatuin search --interactive --filter-mode directory\C-m"'
fi

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash"
