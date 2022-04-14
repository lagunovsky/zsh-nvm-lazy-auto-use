ZSH_NVM_DIR=${0:a:h}

[[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.nvm"

_zsh_nvm_find_nvmrc () {
  local path_="${PWD}"

	while [ "${path_}" != "" ] && [ ! -f "${path_}/.nvmrc" ]
	do
		path_=${path_%/*}
	done

	if [ -e "${path_}/.nvmrc" ]
	then
		echo "${path_}/.nvmrc"
	fi
}

autoload -U add-zsh-hook
_zsh_nvm_lazy_auto_use() {
  local nvmrc_path="$(_zsh_nvm_find_nvmrc)"
  if [[ -f "$nvmrc_path" ]]; then
    local nvmrc_node_version="$(nvm version $(cat "$nvmrc_path"))"
    local node_version="$(node -v)"
    if [[ "$nvmrc_node_version" != "N/A" && "$node_version" != "$nvmrc_node_version" ]]; then
     nvm use && export NVM_LAZY_AUTO_USE_ACTIVE=true
    fi
  else
    if [[ "$NVM_LAZY_AUTO_USE_ACTIVE" == true ]]; then
      local nvm_default_node_version="$(nvm version default)"
      local node_version="$(node -v)"
      if [[ "$node_version" != "$nvm_default_node_version" ]]; then
        nvm use default && export NVM_LAZY_AUTO_USE_ACTIVE=false
      fi
    fi
  fi
}


# If nvm is installed
if [[ -f "$NVM_DIR/nvm.sh" ]]; then
  # Auto use nvm on chpwd
  [[ "$NVM_LAZY_AUTO_USE" == true ]] && add-zsh-hook chpwd _zsh_nvm_lazy_auto_use && _zsh_nvm_lazy_auto_use
fi