<head>
<link rel="shortcut icon" type="image/png" href="https://idiotic.me/genstat/Genstat.png"/>
<meta charset="UTF-8">
</head>

<p align="center">
  <img src="https://github.com/koutsie/genstat/raw/master/Genstat.png" width="100" height="100">
</p>

![Genstat](https://github.com/koutsie/genstat/raw/master/genstat.png)


# genstat

<p>A rough script to make a almost presentable system showcase and host it. </p>


Depencies: ```neofetch, vnstat, lm-sensors, curl, perl, awk & sed``` 


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

<p>
*Note: android doesnt do xdg-open so uhh, i need to figure out an way sometime when i get to it
</p>

