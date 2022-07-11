{ config, pkgs, lib, ... }:

with lib;

let
  pkg = pkgs.realmd;
  cfg = config.services.realmd;
in
{
  options.services.realmd = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enable the realmd service which allows using `realm` to join
        machines to AD/LDAP domains.
      '';
    };
  };

  config = mkIf cfg.enable {
    systemd.packages = [ pkgs.realmd ];

  };
}
