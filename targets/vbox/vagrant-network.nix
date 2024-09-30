{ config, pkgs, ... }:
{
  networking.interfaces = {
    enp0s8.ipv4.addresses = [{
    }];
  };
}
