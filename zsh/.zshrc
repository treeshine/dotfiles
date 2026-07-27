# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  fzf
  zoxide
  uv
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="eza --icons"
alias cd="z"
alias cat="bat"
alias find="fd"
alias grep="rg"

# Prompt
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ---- conda (mac + wsl) safe init ----
# base 자동 활성화는 conda 설정으로 끄는 걸 권장:
#   conda config --set auto_activate_base false

if ! command -v conda >/dev/null 2>&1; then
  # 흔한 설치 위치 후보들
  for _p in \
    "$HOME/miniconda3" \
    "$HOME/anaconda3" \
    "$HOME/mambaforge" \
    "$HOME/micromamba" \
    "/opt/miniconda3" \
    "/opt/anaconda3" \
    "/opt/homebrew/Caskroom/miniconda/base" \
    "/opt/homebrew/Caskroom/anaconda/base" \
    "/usr/local/Caskroom/miniconda/base" \
    "/usr/local/Caskroom/anaconda/base"
  do
    if [ -x "$_p/bin/conda" ]; then
      export PATH="$_p/bin:$PATH"
      break
    fi
  done
fi

# conda가 잡혔으면 zsh hook 로드 (activate가 잘 되게)
if command -v conda >/dev/null 2>&1; then
  __conda_setup="$(conda 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  fi
  unset __conda_setup
fi
# ------------------------------------

# UV
case "$(uname)" in
  Darwin)
    # macOS (brew) → nothing to do
    ;;
  Linux)
    if [[ -f "$HOME/.local/bin/env" ]]; then
      . "$HOME/.local/bin/env"
    fi
    ;;
esac

# Created by `pipx` on 2026-01-24 06:41:55
export PATH="$PATH:/Users/treeshine/.local/bin"

# thefuck
eval "$(thefuck --alias)"
