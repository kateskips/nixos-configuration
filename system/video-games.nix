# Based on https://nixos.org/wiki/Steam
{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
}
