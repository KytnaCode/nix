{lib, ...}:
with lib; let
  programs = filterAttrs (name: value: name != "default.nix") (builtins.readDir ./.);
  imports = traceValSeq (mapAttrsToList (name: _: ./. + "/${name}") programs);
in {
  inherit imports;
}
