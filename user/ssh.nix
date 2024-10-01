{ programs, ... }:

{
  programs.ssh.enable = true;
  programs.ssh.matchBlocks = {
    "github.com" = {
      host = "github.com";
      user = "git";
      identityFile = "~/.ssh/id_ssh_github";
    };
  };
}