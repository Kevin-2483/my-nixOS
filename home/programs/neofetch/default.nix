{ pkgs, ... }: {
  home.packages = [ pkgs.neofetch ];
  home.file.".config/neofetch/config.conf".text = ''
    print_info() {
    prin " \n \n ╭─────┤ $(color 5) Nix-Darwin $(color 15)├─────╮"
    info " " kernel
    info " " wm
    info " " shell
    info " " term
    # info "󰏖 " packages
    info "󰍛 " memory
    info "󰔛 " uptime
    prin " \n \n ╰──────────────────────────╯"
    prin " \n \n \n \n $(color 1) \n $(color 2) \n $(color 3) \n $(color 4) \n $(color 5) \n $(color 6) \n $(color 7) \n $(color 0)"
    }

    kernel_shorthand="on"
    uptime_shorthand="on"
    memory_percent="on"
    memory_unit="gib"
    package_managers="on"
    shell_path="off"
    shell_version="off"
    cpu_brand="off"
    cpu_speed="off"
    cpu_cores="off"
    cpu_temp="off"
    gpu_brand="on"
    gpu_type="all"
    refresh_rate="off"
    colors=(distro)
    bold="off"
    separator=""

    image_backend="ascii" # ascii kitty iterm2
    image_source="/Users/kevin/.config/imgs/NixDarwin.png" # auto /path/to/img /path/to/ascii
    image_size="200px" # auto 00px 00% none
    
    ascii_distro="MacOS_small"
    ascii_colors=(distro)
    ascii_bold="on"

    image_loop="true"
    crop_mode="normal" # normal fit fill
    crop_offset="center" # northwest north northeast west center east southwest south southeast
    gap=1 # num -num
'';
}
