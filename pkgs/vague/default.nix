{ writeTextFile }:

writeTextFile {
  name = "base16-vague";
  destination = "/share/themes/vague.yaml";
  text = ''
    system: "base16"
    name: "Vague"
    variant: "dark"
    palette:
      base00: "#141415"
      base01: "#1c1c24"
      base02: "#252530"
      base03: "#333738"
      base04: "#878787"
      base05: "#cdcdcd"
      base06: "#c3c3d5"
      base07: "#aeaed1"
      base08: "#d8647e" # red
      base09: "#e0a363" # orange
      base0A: "#f3be7c" # yellow (orange2)
      base0B: "#7fa563" # green
      base0C: "#6e94b2" # cyan
      base0D: "#7e98e8" # blue
      base0E: "#bb9dbd" # purple
      base0F: "#c48282" # brown
  '';
}
