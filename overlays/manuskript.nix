final: prev: {
  manuskript = prev.manuskript.overridePythonAttrs {
    dependencies = with prev.python3Packages; [
      pyenchant
    ];
  };
}
