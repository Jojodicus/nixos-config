{ ... }:

{
  system.activationScripts.binbash = {
    deps = [ "binsh" ];
    text = ''
         ln -s /bin/sh /bin/bash
    '';
  };
}
