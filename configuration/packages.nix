{ pkgs, ... }:

let
	gui = with pkgs; [
		vscode
		discord
	];
	cli = with pkgs; [
		lm_sensors
		ncdu
		fastfetch
		smartmontools
		wget
		btop
		helix
		git
		gnumake
		gcc
	];
	syslib = with pkgs; [
		python3
		libva-utils
		cudatoolkit
	];
in {
	environment.systemPackages = gui ++ cli ++ syslib;
}
