conky.config = {
    background = true,
    double_buffer = true,
    update_interval = 1,
    alignment = 'top_right',
    gap_x = 40,
    gap_y = 70,
    minimum_width = 460,
    maximum_width = 460,
    minimum_height = 100,
    font = 'FiraCode Nerd Font:size=10',
    default_color = '#fff',
    draw_borders = true,
    border_width = 1,
    border_inner_margin = 10,
    border_outer_margin = 1,
    default_outline_color = '#89CFF0',
    use_xft = true,

    own_window = true,
    own_window_type = 'desktop',
    own_window_transparent = false,
    own_window_colour = '#00030A',
    own_window_argb_visual = true,
    own_window_argb_value = 150,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
};

conky.text = [[
${color #89CFF0}${font Monospace:bold:size=10}[ NOW PLAYING ]${font}${color}
🎵 ${exec playerctl metadata artist} - ${exec playerctl metadata title}
▶ ${exec playerctl metadata xesam:title}
⏱ ${exec playerctl metadata mpris:length | awk '{print int($1/1000000) " sec"}'}
]];

