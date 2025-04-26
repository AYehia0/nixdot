{ pkgs, ... }:
let
  rga-fzf =
    ''
      rga-fzf() {
        RG_PREFIX="rga --files-with-matches"
        local file
        file="$(
          FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
              --phony -q "$1" \
              --bind "change:reload:$RG_PREFIX {q}" \
              --preview-window="70%:wrap"
        )" &&
        echo "opening $file" &&
        xdg-open "$file"
      }
    '';
  vterm-print = 
    ''
      vterm_printf(){
        if [ -n "$TMUX" ] && ([ "''${TERM%%-*}" = "tmux" ] || [ "''${TERM%%-*}" = "screen" ] ); then
            # Tell tmux to pass the escape sequences through
            printf "\ePtmux;\e\e]%s\007\e\\" "$1"
        elif [ "''${TERM%%-*}" = "screen" ]; then
            # GNU screen (screen, screen-256color, screen-256color-bce)
            printf "\eP\e]%s\007\e\\" "$1"
        else
            printf "\e]%s\e\\" "$1"
        fi
      }
    '';
in {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    dotDir = ".config/zsh";

    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "fzf" "thefuck" ];
    };

    history = {
      size = 1000000;
      save = 1000000;
      ignorePatterns = [
        "cd ..*"
        "ls"
      ];
      extended = true;
      ignoreDups = true;
    };

    shellAliases = {
      v = "nvim";
      cd = "z";
      dev = "nix develop -c zsh";
      gis = "git status";
      gil = "git log";
      gid = "git diff";
      rebuild = "sudo nixos-rebuild switch --flake .";
    };

    initExtra = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
    
    envExtra = ''
      path+=("$HOME/bin")
      path+=("$HOME/.local/share/go/bin")
      export PATH
    '';

    profileExtra = ''
      if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        Hyprland
      fi
    '';
  };
}
