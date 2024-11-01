{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = {
        ll = "ls -l";
        nix-up = "/dev-setup/apply.sh";
    };
    # history = {
    #     size = 10000;
    #     path = "${config.xdg.dataHome}/zsh/history";
    # };
    oh-my-zsh = {
        enable = true;
        plugins = [ "git" 
                    "z" ];
        theme = "agnoster";
        extraConfig = ''
                # Required for autocomplete with box: https://unix.stackexchange.com/a/778868
                zstyle ':completion:*' completer _expand _complete _ignored _approximate _expand_alias
                zstyle ':autocomplete:*' default-context curcontext 
                zstyle ':autocomplete:*' min-input 0

                setopt HIST_FIND_NO_DUPS

                autoload -Uz compinit
                compinit

                setopt autocd  # cd without writing 'cd'
                setopt globdots # show dotfiles in autocomplete list
      '';
    };

    plugins = [
      {
        name = "zsh-autocomplete"; # completes history, commands, etc.
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "762afacbf227ecd173e899d10a28a478b4c84a3f";
          sha256 = "1357hygrjwj5vd4cjdvxzrx967f1d2dbqm2rskbz5z1q6jri1hm3";
        }; # e.g., nix-prefetch-url --unpack https://github.com/marlonrichert/zsh-autocomplete/archive/762afacbf227ecd173e899d10a28a478b4c84a3f.tar.gz
      }
    ];

  };
  #programs.starship.enable = true;
  programs.fzf.enable = true;



}
# From Sytup:
    #   users:
    #     - username: "{{ user }}"
    #       antigen_libraries:
    #         - name: oh-my-zsh
    #       antigen_theme:
    #         name: agnoster # This role has no default theme (unlike the `gantsign.oh-my-zsh` role)
    #       antigen_bundles:
    #         - name: git # This role has no default bundles/plugins (unlike the `gantsign.oh-my-zsh` role)
    #         - name: zsh-syntax-highlighting
    #           url: zsh-users/zsh-syntax-highlighting
    #         - name: pip
    #         - name: k # ls with git annotation: https://github.com/supercrabtree/k
    #           url: supercrabtree/k
    #         - name: enhancd # improved cd command: https://github.com/b4b4r07/enhancd
    #           url: b4b4r07/enhancd
    #         - name: zsh-autosuggestions # command suggestions
    #           url:  zsh-users/zsh-autosuggestions 
    #         - name: zsh-completions
    #           url:  zsh-users/zsh-completions 
    #         - name: ssh-agent