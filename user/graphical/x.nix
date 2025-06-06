{ pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  xsession = {
    enable = false;

    windowManager.xmonad = {
      enable = true;
      # TODO: Patch xmonad-contrib to fix
      # https://github.com/xmonad/xmonad-contrib/issues/280
      enableContribAndExtras = true;
      config = ./xmonad.hs;
      #extraPackages = p: with p; [ taffybar ];
    };
  };

  home.pointerCursor.x11.enable = true;

  #services.taffybar.enable = true;
  xdg.configFile."taffybar/taffybar.hs".source = ./taffybar.hs;

  # Let GNOME update the time zone automatically.
  dconf.settings = {
    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };
  };

  xresources.properties = {
    # A nice desktop size
    #"*.dpi" = 120;
    # A nice laptop size:
    #"*.dpi" = 150;
    # Double pixels:
    #"*.dpi" = 192;
  };

  home.packages = with pkgs; [
    dmenu
  ];

  # services.redshift = import ./redshift.nix;
}
