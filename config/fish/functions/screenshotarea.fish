function screenshotarea --wraps='grim -g 2816,731 352x262 - | wl-copy' --wraps='grim -g "3042,557 325x303" - | wl-copy' --wraps=grim\ -g\ \'3237,701\ 368x304\'\ -\ \|\ wl-copy --wraps='grim -g "$(slurp -b#00000055 -c#b8bb26 -d)" - | wl-copy' --wraps='grim -g "$(slurp -b#00000055 -c#b8bb26 -d)" - | wl-copy && notify-send "Screenshot taken" "Screenshot saved to your clipboad"' --wraps='grim -g "$(slurp -b#00000055 -c#b8bb26 -d)" - | wl-copy && wl-paste -n > ~/.temp/shot.png && notify-send "Screenshot taken" "Screenshot saved to your clipboard" -i "$HOME/.temp/shot.png"' --description 'alias screenshotarea=grim -g "$(slurp -b#00000055 -c#b8bb26 -d)" - | wl-copy && wl-paste -n > ~/.temp/shot.png && notify-send "Screenshot taken" "Screenshot saved to your clipboard" -i "$HOME/.temp/shot.png"'
  grim -g "$(slurp -b#00000055 -c#b8bb26 -d)" - | wl-copy && wl-paste -n > ~/.temp/shot.png && notify-send "Screenshot taken" "Screenshot saved to your clipboard" -i "$HOME/.temp/shot.png" $argv; 
end
