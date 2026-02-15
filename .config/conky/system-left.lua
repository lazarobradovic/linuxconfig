conky.config = {
    background = true,
    double_buffer = true,
    update_interval = 1,
    alignment = 'top_left',
    gap_x = 40,
    gap_y = 70,
    minimum_width = 460,
    maximum_width = 460,
    minimum_height = 1330,
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
${alignc}${font Monospace:bold:size=12}СИСТЕМСКА КОНТРОЛА РАКЕТЕ${font}


${color #89CFF0}${font Monospace:bold:size=10}[ SYSTEM INFORMATION ]${font}${color}
HOST    ${goto 130}$nodename
CORE    ${goto 130}$kernel
UPTIME  ${goto 130}$uptime
GPU     ${goto 130}${execi 300 lspci | grep VGA | sed -n 's/.*\[\(.*\)\]/\1/p'}
DRIVER  ${goto 130}${execi 300 glxinfo | grep "OpenGL renderer" | cut -d ":" -f2 | sed 's/^ *//'}

${color #89CFF0}${font Monospace:bold:size=10}[ PROCESSORS ]${font}${color}
MODEL   ${goto 130}${execi 600 cat /proc/cpuinfo | grep "model name" | head -n1 | cut -d ":" -f2 | sed 's/^ *//'}
TEMP    ${goto 130}${hwmon 0 temp 1}°C
FREQ    ${goto 130}${freq} MHz
${alignr 0}${cpugraph cpu0 100,200 white #efaa65}
AVERAGE ${alignr 0}${cpu}% ${cpubar 8,200}
${if_existing /sys/devices/system/cpu/cpu0}CORE 01 ${alignr 0}${cpu cpu0}% ${cpubar cpu0 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu1}CORE 02 ${alignr 0}${cpu cpu1}% ${cpubar cpu1 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu2}CORE 03 ${alignr 0}${cpu cpu2}% ${cpubar cpu2 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu3}CORE 04 ${alignr 0}${cpu cpu3}% ${cpubar cpu3 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu4}CORE 05 ${alignr 0}${cpu cpu4}% ${cpubar cpu4 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu5}CORE 06 ${alignr 0}${cpu cpu5}% ${cpubar cpu5 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu6}CORE 07 ${alignr 0}${cpu cpu6}% ${cpubar cpu6 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu7}CORE 08 ${alignr 0}${cpu cpu7}% ${cpubar cpu7 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu8}CORE 09 ${alignr 0}${cpu cpu8}% ${cpubar cpu8 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu9}CORE 10 ${alignr 0}${cpu cpu9}% ${cpubar cpu9 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu10}CORE 11 ${alignr 0}${cpu cpu10}% ${cpubar cpu10 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu11}CORE 12 ${alignr 0}${cpu cpu11}% ${cpubar cpu11 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu12}CORE 13 ${alignr 0}${cpu cpu12}% ${cpubar cpu12 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu13}CORE 14 ${alignr 0}${cpu cpu13}% ${cpubar cpu13 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu14}CORE 15 ${alignr 0}${cpu cpu14}% ${cpubar cpu14 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu15}CORE 16 ${alignr 0}${cpu cpu15}% ${cpubar cpu15 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu16}CORE 17 ${alignr 0}${cpu cpu16}% ${cpubar cpu16 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu17}CORE 18 ${alignr 0}${cpu cpu17}% ${cpubar cpu17 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu18}CORE 19 ${alignr 0}${cpu cpu18}% ${cpubar cpu18 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu19}CORE 20 ${alignr 0}${cpu cpu19}% ${cpubar cpu19 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu20}CORE 21 ${alignr 0}${cpu cpu20}% ${cpubar cpu20 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu21}CORE 22 ${alignr 0}${cpu cpu21}% ${cpubar cpu21 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu22}CORE 23 ${alignr 0}${cpu cpu22}% ${cpubar cpu22 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu23}CORE 24 ${alignr 0}${cpu cpu23}% ${cpubar cpu23 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu24}CORE 25 ${alignr 0}${cpu cpu24}% ${cpubar cpu24 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu25}CORE 26 ${alignr 0}${cpu cpu25}% ${cpubar cpu25 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu26}CORE 27 ${alignr 0}${cpu cpu26}% ${cpubar cpu26 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu27}CORE 28 ${alignr 0}${cpu cpu27}% ${cpubar cpu27 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu28}CORE 29 ${alignr 0}${cpu cpu28}% ${cpubar cpu28 8,200}${endif}
${if_existing /sys/devices/system/cpu/cpu29}CORE 30 ${alignr 0}${cpu cpu29}% ${cpubar cpu29 8,200}${endif}

${color #89CFF0}${font Monospace:bold:size=10}[ MEMORY ]${font}${color}
RAM : ${alignr 0}$mem / $memmax ($memperc%) ${membar 8,200}
DISK: ${alignr 0}${fs_used /} / ${fs_size /} (${fs_used_perc /}%) ${fs_bar 8,200 /}

${color #89CFF0}${font Monospace:bold:size=10}[ NETWORK ]${font}${color}
LINK      ${alignr 0}${wireless_essid enx6c70cbb36bc7}
IP        ${alignr 200}${addr enx6c70cbb36bc7} 
UPLOAD    ${alignr 0}${downspeed enx6c70cbb36bc7} ${downspeedgraph enx6c70cbb36bc7 8,200 f49d53 1d2733}
DOWNLOAD  ${alignr 0}${upspeed enx6c70cbb36bc7} ${upspeedgraph enx6c70cbb36bc7 8,200 f49d53 1d2733}
]];


