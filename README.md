# DOOM running through an OpenWrt TL-WR941ND v5 (js-dos 6.22.60)
The router only serves the files staticly. The DOOM.EXE runs on YOUR BROWSER, inside of DOSBox (js-dos).

For more informations about the router and the OpenWRT:
https://openwrt.org/toh/tp-link/tl-wr941nd


## Router (TL-WR941ND v5, OpenWrt 18.06)
   1. `cd /tmp && wget https://github.com/0x00bit/Doom-Router/blob/main/doom.tar`
   2. `tar xf doom.tar` 
   3. `uhttpd -p 8666 /Doom-Router-main/www/`

if the uhttpd is not avaliable: `httpd -p 8080 -h /tmp/doom/Doom-Router-main/www`

Note: after each reboot, you will need to download it again
speed: http://HOST:8080/?cycles=20000 (default: max)
Controls:
Mouse is not used; keyboad: arrows, Ctrl (shoot), space (use item), Shift (run).

## Code Structure
doom-router/
  www/                  
    index.html
    js-dos.js
    wdosbox.js
    wdosbox.wasm.js
    doom.zip            (DOOM.EXE + DOOM1.WAD + DEFAULT.CFG)
  README.md
