{ pkgs, config, ... }:
{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animate = true;
      animation = "gameoflife";
      bigclock = true;
      bigclock_12hr = true;
      auth_fails = 5;
      auto_login_session = "niri";
      auto_login_user = "mads";
      clear_password = true;
      default_input = "password";
      gameoflife_entropy_interval = 10;
      gameoflife_frame_delay = 6;
      gameoflife_initial_density = 0.4;
    };
  };
}
