#!/bin/bash
#Depencies:  curl, neofetch, vnstat, lm-sensors, sed, and python for the experimental features
echo -e "import sys\nx = sys.argv[1]\nprint(x[6:-1])" > /tmp/py.py
SysUptime=$(uptime -p)
#SysDistro=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om)
SysDistro=$(python /tmp/py.py "$(cat /etc/*release | head -n1)")
SysUser=$(whoami)
SysBattery=$(upower -d | grep percentage | awk '{print $2;}' | head -1)
SysRam=$(vmstat -s -S M | grep ' memory' | awk '{print $1}' | head -n1)
SysRamFree=$(vmstat -s -S M | grep 'used' | awk '{print $1}' | head -n1)
SysRamUsed=$(expr $SysRam - $SysRamFree)
SysCpuUsage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
SysTemp=$(sensors | grep °C | tr -d '+')
TopStat=$(neofetch --stdout)
vnStat=$(vnstat)
DiskUsage=$(df)
Date=$(date)


# Notice: 
# sensors dont work on macos, ill put in an os detect thing
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
echo "Uploading to 0x0.st..." & curl -F'file=@ngenstat.html' https://0x0.st

# wkhtmltoimage genstat.html genstat.png
# ndt, 2019
# this licence is stupid but i am partially exempt so i cant really complain
