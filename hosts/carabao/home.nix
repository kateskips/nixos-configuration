{ ... }:

{
  imports = [
    ../../user
    ../../user/graphical/x.nix
    ../../user/video-games.nix
  ];

  xresources.properties = {
    "*.dpi" = 150;
  };

  # TODO get alacritty to respect the above, and remove this.
  programs.alacritty.settings.font.size = 5.5;

  home.stateVersion = "21.05";
}
