<img src="https://github.com/twodotcs/genstat/raw/master/nice.png"></br>
# genstat, ndt's fork with added features

A rough script to make a almost presentable system showcase and host it. </br>
Example: https://0x0.st/zKil.html

Depencies: ```neofetch, vnstat, lm-sensors, curl, perl, awk & cut```</br>

## debian
- `sudo apt install neofetch vnstat lm-sensors curl`
- `wget https://github.com/koutsie/genstat/raw/master/genstat.sh`
- `chmod +x genstat.sh && ./genstat.sh`

## gentoo
- `sudo emerge --ask net-analyzer/vnstat net-misc/curl app-misc/neofetch`
- `wget https://github.com/koutsie/genstat/raw/master/genstat.sh`
- `chmod +x genstat.sh && ./genstat.sh`

## arch
- `sudo pacman -S curl neofetch vnstat lm_sensors sed`
- `wget https://github.com/koutsie/genstat/raw/master/genstat.sh`
- `chmod +x genstat.sh && ./genstat.sh`

## android
- `pkg install neofetch curl wget`
- `wget https://github.com/koutsie/genstat/raw/master/genstat.sh`
- `chmod +x genstat.sh && ./genstat.sh`

### options
- coming soon:
- something to make it work on OSX
- added options to disable stuff
- added options to write to stdout

