{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> {inherit system;},
}: rec {
  sf-mono-nerd-font = pkgs.callPackage ./pkgs/sf-mono-patched.nix {};
}
