final: prev: {
  anki = prev.anki.overrideAttrs (finalAttrs: prevAttrs: {
    propagatedBuildInputs =
      (prevAttrs.propagatedBuildInputs or [])
      ++ [
        prev.texlive.combined.scheme-full
      ];
  });
}
