# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#antigen 插件管理器初始化然后下载插件和主题

source ~/antigen.zsh
antigen use oh-my-zsh
#antigen theme denysdovhan/spaceship-prompt
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export 变量
export PATH="$PATH:/home/keke/.local/bin:/home/keke/dotfiles/bin:/home/keke/go/bin"
#export TERM=xterm
#补全 
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.



alias fuck="sudo wrmsr -a 0x1FC 262238;"
alias e="emacs -nw"
alias luping="ffmpeg -f x11grab -s 1366x768 -r 25 -i $DISPLAY -c:v libx264 -b:v 800k -s 1366x768 test.mp4"
alias zipai="ffmpeg -f v4l2 -s 640x480 -i /dev/video0 output.mpg"
alias sudo='sudo env PATH=$PATH'
alias work="tmux new -s work"
alias bwork="tmux a -t work"
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
