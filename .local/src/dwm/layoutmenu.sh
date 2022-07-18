#!/bin/sh

# cat <<EOF | dmenu -l 15 | awk '{print $NF}'
# []= Tiled Layout                    0
# [M] Monocle Layout                  1
# [@] Spiral Layout                   2
# [\] Dwindle Layout                  3
# H[] Deck Layout                     4
# TTT Bstack Layout                   5
# === Bstack Horix Layout             6
# HHH Grid Layout                     7
# ### nrow Grid Layout                8
# --- Horiz Grid Layout               9
# ::: Gapless Grid Layout             10
# |M| Centered Master Layout          11
# >M> Centered Floating Master Layout 12
# ><> Floating Layout                 13
# EOF

(
printf "[]=   Tiled Layout,echo 0\n"
printf "[M]   Monocle Layout,echo 1\n"
printf "[@]   Spiral Layout,echo 2\n"
printf "[\]   Dwindle Layout,echo 3\n"
printf "H[]   Deck Layout,echo 4\n"
printf "TTT   Bstack Layout,echo 5\n"
printf "===   Bstack Horix Layout,echo 6\n"
printf "HHH   Grid Layout,echo 7\n"
printf "###   nrow Grid Layout,echo 8\n"
printf "---   Horiz Grid Layout,echo 9\n"
printf ":::   Gapless Grid Layout,echo 10\n"
printf "|M|   Centered Master Layout,echo 11\n"
printf ">M>   Centered Floating Master Layout,echo 12\n"
printf "ㅤㅤㅤ   Floating Layout,echo 13\n"
) | jgmenu --simple --config-file=~/.config/jgmenu/jgmenu_layoutmenu
