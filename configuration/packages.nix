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
	];
	syslib = with pkgs; [
		libva-utils
		cudatoolkit
	];
in {
	environment.systemPackages = gui ++ cli ++ syslib;
}
