{lib, ...}:
with lib;
with builtins; {
  listDir = let
    shouldExclude = name: exclude:
      if isString exclude
      then name != exclude
      else !elem name exclude;
    read = path: exclude: filterAttrs (name: _: shouldExclude name exclude) (readDir path);
  in
    dir: exclude: mapAttrsToList (name: _: dir + "/${name}") (read dir exclude);
}
