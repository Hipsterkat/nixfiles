{ config, pkgs, ... }:

{
  # Locale
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
    keyMap = "us";
  };

  # timezone
  time.timeZone = "Europe/Bucharest";

  # User
  users.users.hipster = {
    isNormalUser = true;
    initialPassword = "johnydeep";
    extraGroups = [ "wheel" ];
  };
}
