{ pkgs, ... }:

let
	prime-run = pkgs.writeShellScriptBin "prime-run" ''
		export __NV_PRIME_RENDER_OFFLOAD=1
	        export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
		export __GLX_VENDOR_LIBRARY_NAME=nvidia
		export __VK_LAYER_NV_optimus=NVIDIA_only
		exec "$@"
	'';
in {
	hardware.graphics = {
		enable = true;
	};

	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = true;
		powerManagement.finegrained = false;
		open = true;
		nvidiaSettings = true;
	};

	hardware.nvidia.prime = {
		offload = {
			enable = true;
			enableOffloadCmd = true;
		};

		amdgpuBusId = "PCI:5:0:0";
		nvidiaBusId = "PCI:1:0:0";
	};

	environment.systemPackages = [
		prime-run
	];

	# unsure if needed
	boot.extraModprobeConfig = ''
		options nvidia NVreg_PreserveVideoMemoryAllocations=1
	'';
}
