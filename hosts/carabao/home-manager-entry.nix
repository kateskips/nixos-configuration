import (import ../../dep/home-manager/thunk.nix + "/home-manager/home-manager.nix") {
  pkgs = import ../../dep/nixpkgs {};
  confPath = ./home.nix;
}
