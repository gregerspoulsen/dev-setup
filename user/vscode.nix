{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.vscode-pylance
      eamodio.gitlens
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      streetsidesoftware.code-spell-checker
      mhutchie.git-graph
  ];
};
}