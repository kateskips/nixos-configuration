{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    #gimpPlugins.resynthesizer

    #hexchat

    #musescore

    vscode

    libreoffice
    dbeaver-bin
    meld

    qemu
    gdb

    ncdu
    #unison_2_40
    htop

    xsel

    p7zip
    unzip
    unrar

    chromium

    thunderbird

    element-desktop
    signal-desktop
    telegram-desktop

    haskellPackages.nix-diff

    pavucontrol

    zoom-us

    # Bits of Gnome
    # gnome3.gnome_terminal
    gnome.gnome-notes
    evince

    zoom-us
    slack
  ];

  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
  };

  programs.alacritty = {
    enable = true;
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  programs.firefox.enable = true;

}
