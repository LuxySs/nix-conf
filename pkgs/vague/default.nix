{ writeTextFile }:

writeTextFile {
  name = "base16-vague";
  destination = "/share/themes/vague.yaml";
  text = ''
    system: "base16"
    name: "Vague"
    variant: "dark"
    palette:
      base00: "#141415" # base (bg)
      base01: "#1c1c24" # mantle (inactiveBg)
      base02: "#252530" # surface0 (line)
      base03: "#333738" # surface1 (visual)
      base04: "#606079" # surface2 (comment)
      base05: "#cdcdcd" # text (fg)
      base06: "#b4d4cf" # accent1 (builtin)
      base07: "#c3c3d5" # accent2 (property)
      base08: "#d8647e" # red (error)
      base09: "#e0a363" # orange (number)
      base0A: "#f3be7c" # yellow (warning/delta)
      base0B: "#7fa563" # green (plus)
      base0C: "#b4d4cf" # cyan (builtin/teal tone)
      base0D: "#7e98e8" # blue (hint)
      base0E: "#6e94b2" # magenta (keyword/type)
      base0F: "#e8b589" # brown (string)
  '';
}
