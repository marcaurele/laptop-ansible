function displayright() {
  xrandr --output $1 --auto --right-of eDP-1
}

function displayleft() {
  xrandr --output $1 --auto --left-of eDP-1
}
