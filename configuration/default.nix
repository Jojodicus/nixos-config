_: {
  imports = [
    ./nix.nix
  ];

  # Install Gnome
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
