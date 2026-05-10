{ pkgs, ... }:

{
  #Yazi pkgs
  environment = {
    systemPackages = with pkgs; [
      fd
      ripgrep
      ffmpeg
      poppler
      jq
      resvg
    ];
  };

  programs.yazi = {
    enable = true;
    plugins = {
      bookmarks = pkgs.yaziPlugins.bookmarks;
      chmod = pkgs.yaziPlugins.chmod;
    };
    settings = {
      keymap = {
        mgr.prepend_keymap = [
          #bookmarks
          {
            run = "plugin bookmarks save";
            on = [
              "b"
              "s"
            ];
          }
          {
            run = "plugin bookmarks jump";
            on = [
              "g"
              "b"
            ];
          }
          {
            run = "plugin bookmarks delete";
            on = [
              "b"
              "d"
            ];
          }
          {
            run = "plugin bookmarks delete_all";
            on = [
              "b"
              "D"
            ];
          }
          # chmod
          {
            run = "plugin chmod";
            on = [
              "c"
              "m"
            ];
          }
          # other
          {
            run = "cd ~/nixos";
            on = [
              "g"
              "n"
            ];
          }
        ];
      };
    };
  };
}
