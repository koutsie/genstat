#!/bin/bash
# Depencies:  curl, neofetch, vnstat, lm-sensors, sed. (and maybe even wkhtmltoimage)

SysUptime=$(uptime -p)
SysDistro=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om)
SysUser=$(whoami)
SysBattery=$(upower -d | grep percentage | awk '{print $2;}' | head -1)
SysRam=$(( $(cat /proc/meminfo | grep MemTotal | awk '{ print $2 }') / 1024 ))
SysRamFree=$(( $(cat /proc/meminfo | grep MemFree | awk '{ print $2 }') / 1024 ))
SysRamUsed=$(expr $SysRam - $SysRamFree)
SysCpuUsage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
SysTemp=$(sensors | grep °C | tr -d '+')
TopStat=$(neofetch --stdout | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b | tr '\r' '\0' | sed 's/ \x0//g')
vnStat=$(vnstat)
DiskUsage=$(df)
Date=$(date)

#############K##############O##############U#######T##########S####I#####E#####
cat >/tmp/tmpstat 2>&1 << EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Genstat.sh</title>
</head>
<link rel="stylesheet" href="https://unpkg.com/bulmaswatch/darkly/bulmaswatch.min.css">
<style>
.bars{
    width:25%;
    top: 100;
}
.stats{
    position: fixed;
    top: 140;
    justify-content : center;
    right: 100;
    left: 100;
}
.pre {
    font-family: 'Monospace';
}
</style>
<body>

<section class="hero is-bold">
  <div class="hero-body">
    <div class="container">
      <h1 class="title">
        Welcome back $SysUser
      </h1>
      <h2 class="subtitle">
        $SysDistro <p> $SysUptime
      </h2>
Ram: <b>$SysRamUsed/$SysRam MB</span></b></br>
<progress class="progress is-small is-info" value="$SysRamUsed" max="$SysRam">$SysRamFree</progress>
Cpu: <b>$SysCpuUsage %</b></br>
<progress class="progress is-small is-info" value="$SysCpuUsage" max="100">$SysCpuUsage</progress>
    </div>
  </div>
</section>
</div>
<br>
<div class="container">
	<div class="content">
    </br>
<pre>
$SysTemp
</pre>

</br>
<pre>
$vnStat 
</pre>

</br>
<pre>
$DiskUsage 
</pre>

</br>

 <pre>
 $TopStat 
 </pre>

</br>
<footer class="footer">
  <div class="content has-text-centered">
    <p>
	Generated on <strong>$Date</strong> on <strong>$SysDistro</strong>
    </p>
  </div>
</footer>
</br>
</body>
</html>
EOF

cat /tmp/tmpstat > genstat.html
xdg-open genstat.html

# wkhtmltoimage genstat.html genstat.png
# Koutsie was here <3
