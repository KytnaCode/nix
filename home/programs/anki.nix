{
  programs.anki = {
    enable = true;
    style = "anki";
    theme = "followSystem";

    sync = {
      autoSync = true;
      autoSyncMediaMinutes = 5;
      networkTimeout = 15;
      syncMedia = true;
      username = "kytnacode@gmail.com";
    };

    answerKeys = [
      {
        ease = 1;
        key = "1";
      }
      {
        ease = 2;
        key = "2";
      }
      {
        ease = 3;
        key = "3";
      }
      {
        ease = 4;
        key = "4";
      }
    ];
  };
}
