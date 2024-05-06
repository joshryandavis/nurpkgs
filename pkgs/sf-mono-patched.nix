{
  fetchFromGitHub,
  stdenv,
  lib,
}: let
  source = stdenv.mkDerivation rec {
    pname = "sf-mono-nerd-font";
    version = "18.0d1e1.0";
    src = fetchFromGitHub {
      owner = "epk";
      repo = "SF-Mono-Nerd-Font";
      rev = "85a9d57314dda11ed04cdd3e3059ff0c9b2d16ef";
      hash = "sha256-PZwEfvrkICnfOfOjWLyrclGHOMpEp2RQilcP/K55tfA=";
    };
  };
in
  stdenv.mkDerivation {
    inherit (source) pname version src;
    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      for f in *; do
          install -Dm644 "$f" "$out/share/fonts/opentype/$(basename "$f")"
      done
    '';
    meta = with lib; {
      license = licenses.unfree;
      description = "patched sf-mono";
      platforms = ["x86_64-darwin" "x86_64-linux" "aarch64-darwin" "aarch64-linux"];
    };
  }
