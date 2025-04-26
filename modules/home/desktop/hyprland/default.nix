{ pkgs, ... }:
{
  imports = [ ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "ALT";
      "$terminal" = "kitty";
      "$guiFM" = "thunar";
      "$tuiFM" = "yazi";
      "$menu" = "fuzzel";
      "$browser" = "firefox";

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Adwaita"
        "GTK_THEME,Tokyonight-Dark-BL-LB"

        # NVIDIA / Wayland
        "NIXOS_OZONE_WL,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "GBM_BACKEND,nvidia-drm"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "__NV_PRIME_RENDER_OFFLOAD,1"
        "__VK_LAYER_NV_optimus,NVIDIA_only"
        "__GL_GSYNC_ALLOWED,1"
        "__GL_VRR_ALLOWED,1"
        "WLR_RENDERER,vulkan"
        "CLUTTER_BACKEND,wayland"
        "NVD_BACKEND,direct"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "GDK_BACKEND,wayland,x11,*"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];

      exec-once = [
        "waybar"
        "mpdscribble"
      ];

      monitor = [ "eDP-1,preferred,auto,1" "monitor=HDMI-A-1@144,preferred,auto,1" ];
      cursor = {
      	no_hardware_cursors = 0;
      };

      input = {
        kb_layout = "us,ara";
        kb_options = "grp:shifts_toggle,caps:escape";
        follow_mouse = 1;
        sensitivity = 0.0;
        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(7aa2f7aa)";
        "col.inactive_border" = "rgba(414868aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];

        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 2, default, popin 80%"
          "border, 1, 3, default"
          "fade, 1, 2, default"
          "workspaces, 1, 1, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      windowrule = [ ];

      windowrulev2 = [ "noblur,title:^()$,class:^()$" ];

      bind = [
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, Q, killactive,"

        # Apps
        "$mainMod, X, exec, $terminal"
        "$mainMod, B, exec, $browser"
        ## Files
        "$mainMod, F, exec, $guiFM"
        "$mainMod SHIFT, E, exec, $terminal -e $tuiFM"

        # Utils
        "$mainMod, M , exec, pamixer --default-source -t" # mute mic
        "$mainMod SHIFT, M , exec, pamixer -t" # mute sound

        # Hypr
        "CTRL ALT, delete, exit,"
        "$mainMod, SHIFT, W, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, U, togglesplit,"

        # Screenshot bindings
        "$mainMod ALT, S, exec, grim - | tee ~/Pictures/Screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"
        "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy"

        # Focus movement with vim keys
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Swap windows
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Resize Windows
        "ALT, l, resizeactive, 30 0"
        "ALT, h, resizeactive, -30 0"
        "ALT, k, resizeactive, 0 -30"
        "ALT, j, resizeactive, 0 30"

        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, TAB, workspace, previous" # jump to last used workspace
        # "ALT,Tab,cyclenext"
        # "ALT,Tab,bringactivetotop"

        # Move windows to workspaces
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Brightness and Sound Control
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
        ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
        ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

       # Workspace scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  home.packages = with pkgs; [ hyprpicker ];
}
