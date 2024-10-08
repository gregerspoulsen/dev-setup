{ config, pkgs, ... }:

{
  # Grow partition on boot:
  boot.growPartition = true;
}
