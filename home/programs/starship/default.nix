{ config, pkgs, lib, ... }: {

  programs.starship = {
    enable = true;
    # 自定义配置
    settings = {
      # add_newline = false;
      # aws.disabled = true;
      # gcloud.disabled = true;
      # line_break.disabled = true;
      format = lib.concatStrings [
        "[](#f5c2e7)"
        "$os"
        "[](bg:#cba6f7 fg:#f5c2e7)"
        "$username"
        "[](bg:#f38ba8 fg:#cba6f7)"
        "$directory"
        "[](fg:#f38ba8 bg:#eba0ac)"
        "$git_branch"
        "$git_status"
        "[](fg:#eba0ac bg:#fab387)"
        "$c"
        "$elixir"
        "$elm"
        "$golang"
        "$gradle"
        "$haskell"
        "$java"
        "$julia"
        "$nodejs"
        "$nim"
        "$rust"
        "$scala"
        "[](fg:#fab387 bg:#f9e2af)"
        "$docker_context"
        "[](fg:#f9e2af bg:#a6e3a1)"
        "$time"
        "[ ](fg:#a6e3a1)"
        "$line_break$character"
      ];

      # Disable the blank line at the start of the prompt
      # add_newline = false

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      username = {
        show_always = true;
        style_user = "fg:#1e1e2e bg:#cba6f7";
        style_root = "fg:#1e1e2e bg:#cba6f7";
        format = "[ $user ]($style)";
        disabled = false;
      };
      # An alternative to the username module which displays a symbol that
      # represents the current operating system
      os = {
        symbols = {
          # Linux = " ";
          Windows = " ";
          Macos = " ";
          NixOS = " ";
        };
        style = "fg:#1e1e2e bg:#f5c2e7";
        disabled = false; # Disabled by default
      };
      directory = {
        style = "fg:#1e1e2e bg:#f38ba8";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      # Here is how you can shorten some long paths by text replacement
      # similar to mapped_locations in Oh My Posh:
      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
      };
      c = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";

      };
      docker_context = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#f9e2af";
        format = "[ $symbol $context ]($style)";
      };
      elixir = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      elm = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      git_branch = {
        symbol = "";
        style = "fg:#1e1e2e bg:#eba0ac";
        format = "[ $symbol $branch ]($style)";
      };
      git_status = {
        style = "fg:#1e1e2e bg:#eba0ac";
        format = "[$all_status$ahead_behind ]($style)";

      };
      golang = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";

      };
      gradle = {
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      haskell = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      java = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";

      };
      julia = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      nodejs = {
        symbol = "";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      nim = {
        symbol = "󰆥 ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      rust = {
        symbol = "";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      scala = {
        symbol = " ";
        style = "fg:#1e1e2e bg:#fab387";
        format = "[ $symbol ($version) ]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "fg:#1e1e2e bg:#a6e3a1";
        format = "[   $time ]($style)";
      };
      line_break = { disabled = false; };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_green)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };

    };
  };

}
