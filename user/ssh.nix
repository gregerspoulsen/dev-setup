{ programs, ... }:

{
  programs.ssh.enable = true;
  programs.ssh.matchBlocks = {
    "github.com" = {
      host = "github.com";
      user = "git";
      identityFile = "~/.ssh/id_rsa";
    };

    "TCs" = {
      host = "tc*";
      identityFile = "~/.ssh/gp_skytem";
      checkHostIP = false;
      user = "field";
    };
  };
}



# Host 192.168.1.173
#   HostName 192.168.1.173
#   User root

# Host 192.168.1.50
#   HostName 192.168.1.50
#   User root

# Host tc_a 172.23.0.158
#   HostName 172.23.0.158
#   IdentityFile "~/.ssh/gp"
#   StrictHostKeyChecking no
#   UserKnownHostsFile=/dev/null
#   User field

# Host bs
#   HostName 172.23.0.106
#   User build

# Host tc_d
#   HostName 172.23.1.154
#   IdentityFile "~/.ssh/gp"
#   StrictHostKeyChecking no
#   UserKnownHostsFile=/dev/null
#   User field

# Host github.com
# IdentityFile "~/.ssh/id_ssh_github"
# User git

# Host pigeon
#   HostName 192.168.1.100
#   ProxyJump  test_tc
#   User pi

# Host TS-TC
#   HostName 192.168.1.60
#   ProxyJump tc_a
#   User root
#   StrictHostKeyChecking no
#   UserKnownHostsFile=/dev/null

# Host TS
#   HostName 192.168.1.60
#   User root
#   ForwardAgent yes
#   StrictHostKeyChecking no

# Host ocean
#   HostName 161.35.203.217
#   User root
#   IdentityFile "~/.ssh/gp"
#   ForwardAgent yes

# Host txagave
#   HostName bifrost-das-payload.local
#   User root
#   IdentityFile "~/.ssh/gp"
#   ForwardAgent yes
#   ProxyJump tcagave
#   StrictHostKeyChecking no
#   UserKnownHostsFile=/dev/null

# Host tcagave
#   HostName 172.23.0.90
#   IdentityFile "~/.ssh/gp"
#   StrictHostKeyChecking no
#   UserKnownHostsFile=/dev/null
#   User field

# Host blackbird
#   HostName blackbird.local
#   IdentityFile "~/.ssh/gp"
#   StrictHostKeyChecking no
#   UserKnownHostsFile=/dev/null
#   User blackbird
#   ProxyJump tc_a
#   ForwardAgent yes