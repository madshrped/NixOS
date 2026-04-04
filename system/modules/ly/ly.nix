{
  environment.etc."ly/animations/current.dur".source = ./animations/current.cur;
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "dur_file";
      box_title = "MHRP PC -- NIXOS";
      animation_frame_delay = 5;
      full_color = true;
      bigclock = true;
      bigclock_24hr = true;
      auth_fails = 5;
      auto_login_session = "niri";
      clear_password = true;
      default_input = "password";
      dur_file_path = "/etc/ly/animations/current.dur";
    };
  };
}
