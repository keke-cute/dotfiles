# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#antigen 插件管理器初始化然后下载插件和主题
source ~/antigen.zsh
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export 变量
export GOPATH="$HOME/go"
export GO111MODULE=on
export PATH="$PATH:$HOME/go/bin"

# 自动补全
autoload -U compinit
compinit
zstyle ':completion:*' menu select
setopt completealiases

#别名
alias ls='ls --color=auto'
alias grep='grep --color=auto'
