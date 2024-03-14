{ pkgs, ... }:

{
    services.pipewire = {
        
        enable = true;
        wireplumber.enable = true;
        audio.enable = true;
        pulse.enable = true;
        jack.enable = true;
        alsa.enable = true;

    };
}
