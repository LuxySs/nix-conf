# A very stupid derivation that serves as an example

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  name = "example";
  src = ./.;

  buildPhase = ''
    mkdir -p $out/bin/
    echo "echo example" > $out/bin/example
    chmod +x $out/bin/example
  '';
}
