{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "ioskeley-mono-typeface";
  version = "2025.10.09-6";

  src = pkgs.fetchurl {
    url = "https://github.com/ahatem/IoskeleyMono/releases/download/${version}/IoskeleyMono-TTF-Unhinted.zip";
    hash = "sha256-5hvsH2MZlHPzer545Tq6jtXSosFsG2EWWtrpcrHMB6w=";
  };

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm444 TTF-Unhinted/IoskeleyMono*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
