# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash"
source ~/.profile

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/cbenitez/.sdkman"
[[ -s "/Users/cbenitez/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/cbenitez/.sdkman/bin/sdkman-init.sh"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source /Users/cbenitez/.docker/init-bash.sh || true # Added by Docker Desktop

complete -C /opt/homebrew/bin/terraform terraform

. "$HOME/.local/bin/env"

. "$HOME/.atuin/bin/env"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash"
