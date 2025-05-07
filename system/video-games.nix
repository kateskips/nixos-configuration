# Based on https://nixos.org/wiki/Steam
{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.support32Bit = true;
}
