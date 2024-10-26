# NixOS Configuration

## Home-Manager on non-NixOS system

Install/Enable the following programs/services (without nix):

- hyprland
- dconf
- xdg-desktop-portal-hyprland
- pipewire wireplumber etc (usual sound stuff)

### Why Download Hyprland with the usual Package Manager ?

We install Hyprland manually to avoid relying on nixGL.
Unfortunately, this requires downloading two Hyprland binaries:

- From the system's package manager repos - this binary serves as our compositor.
- From nixpkgs - this version comes with the Home-Manager module which we use to
    configure Hyprland declaratively.
