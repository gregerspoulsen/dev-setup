{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        ll = "ls -l";
        nix-update = "sudo nixos-rebuild switch --flake /vagrant/system-config --impure";
        home-update = "home-manager switch --flake /vagrant/user#gp";
    };
    # history = {
    #     size = 10000;
    #     path = "${config.xdg.dataHome}/zsh/history";
    # };
    oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "agnoster";
    };

};
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