# nixos-configuration

Much better than a .dotfiles repo

## Home manager

To upgrade the home manager configuration, do this:

```sh
"$(nix-build ~/src/nixos-configuration/hosts/carabao/home-manager-entry.nix --no-out-link)/activate"
```

## NixOS

To upgrade NixOS, do this:

```sh
sudo nix-env \
  --profile /nix/var/nix/profiles/system \
  --set "$(nix-build ~/src/nixos-configuration/hosts/carabao/nixos-entry.nix -A system --no-out-link)"
sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch
```

To view the current configuration with `nixos-option`, do this:

```sh
nixos-option \
  --options_expr '(import ./nixos-entry.nix).options' \
  --config_expr '(import ./nixos-entry.nix).config'
```
