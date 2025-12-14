#!/usr/bin/env python3
"""
Instala dotfiles creando symlinks
"""
from pathlib import Path

HOME = Path.home()
DOTFILES = HOME / ".dotfiles"

# Mapeo: archivo_en_dotfiles -> destino_en_home
LINKS = {
    "shell/.zshrc": ".zshrc",
    "shell/.zprofile": ".zprofile",
    "shell/.bashrc": ".bashrc",
    "shell/.bash_profile": ".bash_profile",
    "shell/.profile": ".profile",
    "git/.gitconfig": ".gitconfig",
    "git/.gitignore_global": ".gitignore_global",
    "tmux/.tmux.conf": ".tmux.conf",
    "starship/starship.toml": ".config/starship.toml",
    "gh/config.yml": ".config/gh/config.yml",
    "atuin/config.toml": ".config/atuin/config.toml",
    "btop/btop.conf": ".config/btop/btop.conf",
    "lsd/config.yaml": ".config/lsd/config.yaml",
    "zed/settings.json": ".config/zed/settings.json",
    "dev/.sdkmanrc": ".sdkmanrc",
    "claude/CLAUDE.md": ".claude/CLAUDE.md",
    "claude/mcp.json": ".claude/mcp.json",
    "claude/settings.json": ".claude/settings.json",
}


def install():
    print("🔗 Instalando dotfiles...")
    
    for source_rel, target_rel in LINKS.items():
        source = DOTFILES / source_rel
        target = HOME / target_rel
        
        if not source.exists():
            continue
        
        # Crear directorio padre
        target.parent.mkdir(parents=True, exist_ok=True)
        
        # Backup si existe y no es symlink
        if target.exists() and not target.is_symlink():
            backup = target.parent / f"{target.name}.pre-dotfiles"
            target.rename(backup)
            print(f"   📦 Backup: {target_rel}")
        
        # Remover symlink existente
        if target.is_symlink():
            target.unlink()
        
        target.symlink_to(source)
        print(f"   ✓ {target_rel}")
    
    print("\n✨ Dotfiles instalados!")


if __name__ == "__main__":
    install()
