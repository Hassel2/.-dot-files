dir="$HOME/.config/hypr/rofi/"
theme='applauncher'

## Run
grim - > ~/.temp/rofi.png && ffmpeg -i ~/.temp/rofi.png -vf "boxblur=10" -c:a copy ~/.temp/rofi_copy.png -y 
killall -SIGUSR1 waybar &
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
killall -SIGUSR1 waybar
