# 🖥️ Dotfiles

Configuraciones de terminal para macOS optimizadas para desarrollo y SRE.

## ✨ Características

- **Zsh** con Oh My Zsh y Starship prompt (tema Tomorrow Night Bright)
- **Tmux** para gestión de sesiones
- **Lazy loading** de NVM y SDKMAN para inicio rápido
- **Herramientas modernas**: `lsd`, `bat`, `atuin`, `btop`
- **Claude Code** MCP servers configurados
- **Carapace** para autocompletado avanzado

## 📦 Instalación

```bash
git clone https://github.com/cbenitezpy-ueno/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
python3 install.py
```

## 🗂️ Contenido

```
~/.dotfiles/
├── shell/          # .zshrc, .zprofile, .bashrc, .bash_profile, .profile
├── git/            # .gitconfig, .gitignore_global
├── tmux/           # .tmux.conf
├── starship/       # starship.toml (Tomorrow Night Bright theme)
├── gh/             # GitHub CLI config
├── atuin/          # Shell history sync
├── btop/           # System monitor
├── lsd/            # ls replacement
├── zed/            # Zed editor settings
├── claude/         # Claude Code config (MCP template)
├── dev/            # .sdkmanrc
└── install.py      # Script de instalación
```

## 🔧 Dependencias

```bash
# Homebrew packages
brew install starship lsd bat atuin btop zoxide carapace

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# SDKMAN (Java)
curl -s "https://get.sdkman.io" | bash

# NVM (Node.js)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```

## ⚙️ Post-instalación

1. **GitHub CLI** - Autenticarse:
   ```bash
   gh auth login
   ```

2. **Claude Code MCP** - Copiar template y agregar token:
   ```bash
   cp ~/.dotfiles/claude/mcp.json.template ~/.claude/mcp.json
   # Editar y agregar tu GitHub PAT
   ```

3. **Atuin** - Sincronizar historial:
   ```bash
   atuin login
   ```

## 🎨 Theme

Starship configurado con paleta **Tomorrow Night Bright**:
- Prompt minimalista con info de Git, AWS, y duración de comandos
- Java deshabilitado (SDKMAN es lento para detección)
- Timeout extendido para comandos pesados

## 📝 Aliases incluidos

```bash
alias ls='lsd'
alias cat='bat'
alias claude="/Users/$USER/.claude/local/claude"
```

---

*Gestionado con symlinks desde `~/.dotfiles`*
