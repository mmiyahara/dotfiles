if status is-interactive
  # Homebrew
  eval (/opt/homebrew/bin/brew shellenv)

  # pyenv
  set -x PYENV_ROOT ~/.pyenv
  set -x PATH PYENV_ROOT/bin $PATH
  pyenv init - | source

  # fzf
  set -U FZF_LEGACY_KEYBINDINGS 0

  set PATH \
    ~/.nodebrew/current/bin \
    ~/.local/bin \
    ~/.local/apache-maven-3.9.4/bin \
    ~/go/bin \
    ~/.cargo/bin \
    $PATH

  # Starship
  starship init fish | source

  # alias
  alias vi nvim
  alias vim nvim
end

