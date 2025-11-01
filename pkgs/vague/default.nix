{ stdenv }:

stdenv.mkDerivation {
  pname = "base16-vague";
  version = "1.0";

  src = ./.;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes
    install vague.yaml $out/share/themes/vague.yaml

    runHook postInstall
  '';
}
