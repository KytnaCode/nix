{lib, ...}:
with lib; let
  readFiles = dir:
    filterAttrs
    (name: value: name != "default.nix" && value == "regular")
    (builtins.readDir dir);
  listFiles = dir: map (f: dir + "/${f}") (attrNames (readFiles dir));
  readOverlays = dir: map import (listFiles dir);
in
  readOverlays ./.
