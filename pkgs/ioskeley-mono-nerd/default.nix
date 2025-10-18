{
  pkgs,
  ioskeley-mono ? pkgs.ioskeley-mono,
}:

pkgs.stdenv.mkDerivation {
  pname = "ioskeley-mono-nerd";
  version = "2025.10.09-6";

  src = ioskeley-mono;

  nativeBuildInputs = [ pkgs.nerd-font-patcher ];

  buildPhase = ''
    runHook preBuild

    mkdir -p build/

    for f in "$src"/share/fonts/truetype/*.ttf; do
      nerd-font-patcher --complete --adjust-line-height --quiet --no-progressbars --outputdir build/ "$f"
    done

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype/
    install -Dm444 build/*.ttf -t $out/share/fonts/truetype/

    runHook postInstall
  '';
}
