{myutils, ...}: {
  imports = myutils.listDir ./. "default.nix";
}
