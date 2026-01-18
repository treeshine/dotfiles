# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  fzf
  fzf-tab
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="eza --icons"
alias cd="z"
alias cat="bat"

# Prompt
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Lazy load conda
conda() {
  unset -f conda
  source /opt/miniconda3/etc/profile.d/conda.sh
  conda "$@"
}
