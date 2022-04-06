ZSH_NVM_DIR=${0:a:h}

[[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.nvm"

_zsh_nvm_has() {
  type "$1" > /dev/null 2>&1
}

autoload -U add-zsh-hook
_zsh_nvm_lazy_auto_use() {
  local nvmrc_path="$(pwd)/.nvmrc"

  if [[ -f "$nvmrc_path" ]]; then
    local nvmrc_node_version="$(nvm version $(cat "$nvmrc_path"))"

    if [[ "$nvmrc_node_version" != "N/A" ]]; then
     nvm use && export NVM_LAZY_AUTO_USE_ACTIVE=true
    fi
  else
    _zsh_nvm_has nvm_find_nvmrc || return
    nvm use default && export NVM_AUTO_USE_ACTIVE=false
  fi
}


# If nvm is installed
if [[ -f "$NVM_DIR/nvm.sh" ]]; then
  # Auto use nvm on chpwd
  [[ "$NVM_LAZY_AUTO_USE" == true ]] && add-zsh-hook chpwd _zsh_nvm_lazy_auto_use && _zsh_nvm_lazy_auto_use
fi