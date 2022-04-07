# zsh-nvm-lazy-auto-use

[`zsh-nvm`](https://github.com/lukechilds/zsh-nvm) extension to load a `.nvmrc` in nvm lazy load mode.

## Install as an [Oh My ZSH!](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone `zsh-nvm-lazy-auto-use` and [`zsh-nvm`](https://github.com/lukechilds/zsh-nvm) into your custom plugins repo

```shell
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/lagunovsky/zsh-nvm-lazy-auto-use ~/.oh-my-zsh/custom/plugins/zsh-nvm-lazy-auto-use
```
Then load plugins in your `.zshrc`

```shell
plugins=(
  zsh-nvm
  zsh-nvm-lazy-auto-use
)
```

Enable plugin
```shell
export NVM_LAZY_LOAD=true
export NVM_LAZY_AUTO_USE=true
```
