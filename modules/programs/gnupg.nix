{ pkgs, ... }:
{
    programs.gnupg = {
        agent = {
            enable = true;   
            pinentryFlavor = "gnome3";
        };
    };
}
