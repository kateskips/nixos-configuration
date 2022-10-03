{ config, pkgs, ... }:

{
  nixpkgs.config.firefox = {
    #enableGnomeExtensions = true;
    #enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
    #bluetooth.enable = true;
  };

  hardware = {
    #bluetooth.enable = true;
    opengl.enable = true;
  };

  programs.dconf.enable = true;

  services.hardware.bolt.enable = true;

  services.upower.enable = true;

  # No acidental shutdowns.

  # These are now the default
  # services.logind.lidSwitch = "suspend";
  # services.logind.lidSwitchDocked = "ignore";
  # services.logind.lidSwitchExternalPower = "suspend";

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
  '';

  # # locks X and text vtys.
  # services.physlock.enable = true;
  # services.physlock.allowAnyUser = true;

  # Media Keys
  sound.mediaKeys.enable = true;
  services.actkbd.bindings = [
    { keys = [ 224 ]; events = [ "key" "rep" ]; command = "${pkgs.light}/bin/light -U 4"; }
    { keys = [ 225 ]; events = [ "key" "rep" ]; command = "${pkgs.light}/bin/light -A 4"; }
    { keys = [ 229 ]; events = [ "key" "rep" ]; command = "${pkgs.kbdlight}/bin/kbdlight down"; }
    { keys = [ 230 ]; events = [ "key" "rep" ]; command = "${pkgs.kbdlight}/bin/kbdlight up"; }
  ];
}
