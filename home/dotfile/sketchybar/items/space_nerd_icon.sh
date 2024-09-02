source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Defaults
sketchybar --default padding_left=8                                    \
                     padding_right=8                                   \
                                                                       \
                     background.border_color=$COLOR_YELLOW             \
                     background.border_width=2                         \
                     background.height=40                              \
                     background.corner_radius=12                       \
                                                                       \
                     icon.color=$COLOR_YELLOW                          \
                     icon.highlight_color=$COLOR_BACKGROUND            \
                     icon.padding_left=6                               \
                     icon.padding_right=2                              \
                     icon.font="CaskaydiaCove Nerd Font:Regular:16.0"  \
                                                                       \
                     label.color=$COLOR_YELLOW                         \
                     label.highlight_color=$COLOR_BACKGROUND           \
                     label.padding_left=2                              \
                     label.padding_right=6                             \
                     label.font="CaskaydiaCove Nerd Font:Regular:12.0"

# Register custom event - this will be use by sketchybar's space items as well as app_space.sh
sketchybar --add event window_change

# Space items
COLORS_SPACE=($COLOR_YELLOW $COLOR_CYAN $COLOR_MAGENTA $COLOR_WHITE $COLOR_BLUE $COLOR_RED $COLOR_GREEN)
LENGTH=${#ICONS_SPACE[@]}

for i in "${!ICONS_SPACE[@]}"
do
  sid=$(($i+1))
  PAD_LEFT=2
  PAD_RIGHT=2
  if [[ $i == 0 ]]; then
    PAD_LEFT=8
  elif [[ $i == $(($LENGTH-1)) ]]; then
    PAD_RIGHT=8
  fi
  sketchybar --add space space.$sid left                                       \
             --set       space.$sid script="$PLUGIN_DIR/app_space.sh"          \
                                    associated_space=$sid                      \
                                    padding_left=$PAD_LEFT                     \
                                    padding_right=$PAD_RIGHT                   \
                                    background.color=${COLORS_SPACE[i]}        \
                                    background.border_width=0                  \
                                    background.corner_radius=6                 \
                                    background.height=24                       \
                                    icon=${ICONS_SPACE[i]}                     \
                                    icon.color=${COLORS_SPACE[i]}              \
                                    label="_"                                  \
                                    label.color=${COLORS_SPACE[i]}             \
             --subscribe space.$sid front_app_switched window_change
done

# Space bracket
sketchybar --add bracket spaces '/space\..*/'                      \
           --set         spaces background.color=$COLOR_BACKGROUND