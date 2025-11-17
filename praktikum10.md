| **Küsimus** | **Linux** | **Windows** | **Linuxi käsk** | **Windowsi tööriist** |
|------------|------------------------|------------------------|------------------|------------------------|
| **1. Mitu protsessi kokku arvutis käib?** | 253 | ~230 | `ps -aux | wc -l` | Task Manager → Performance |
| **2. Kõige esimesena käivitatud protsess** | PID 1 – `/sbin/init splash (systemd)` | smss.exe | `ps -p 1 -o pid,cmd,comm,etime` | Process Explorer |
| **3. Milliste kasutajate protsesse jookseb?** | avahi, colord, cups-browsed, messagebus, polkitd, ratmir, root, syslog, rtkit, systemd-timesync, systemd-resolve jne | SYSTEM, LOCAL SERVICE, NETWORK SERVICE, Sina (user) | `ps -eo user | sort | uniq` | Task Manager / Process Explorer |
| **4. Kui kaua arvuti on töötanud (uptime)?** | up 4 minutes | ~25 minutes | `uptime -p` | Task Manager → Performance |
| **5. Kõige hiljem käivitatud protsess** | kthreadd (kernel helper thread) | TiWorker.exe | `ps -eo pid,cmd,etimes --sort=start_time | tail` | Process Explorer |
| **6. Enim protsessoriaega kasutav protsess** | ps (100% käivitushetkel) | TiWorker.exe | `ps -eo pid,comm,pcpu --sort=-pcpu | head` | Task Manager (CPU) |
| **7. Enim virtuaalmälu kasutav protsess (VSZ / Virtual Size)** | gnome-shell (~4.5 GB) | svchost.exe (NetworkService) | `ps -eo pid,comm,vsz --sort=-vsz | head` | Task Manager → Details |
| **8. Enim füüsilist mälu kasutav protsess (RSS / Working Set)** | gnome-shell (~430 MB) | CompatTelRunner.exe / TiWorker.exe | `ps -eo pid,comm,rss --sort=-rss | head` | Task Manager → Memory |
| **9. Füüsilise mälu seisund** | 3.2 GB kokku, 1.4 GB kasutusel, 131 MB vaba | ~60% RAM kasutusel | `free -h` | Task Manager → Performance → Memory |
| **10. Põhiketta vaba maht** | / ketas: 25 GB → 4.9 GB vaba (~20%) | C: vaba ~20–30% | `df -h /` | Disk Management |
| **11. Suurim fail ja kaust** | Fail: suurim snap (~400 MB). Kaust: /var/lib/snapd | Kaust: C:\Windows\WinSxS, Fail: pagefile.sys | `du -h --max-depth=1 /` | WinDirStat |
| **12. sha1sum /dev/zero vs /dev/urandom CPU kasutus** | zero → 100% user CPU. urandom → rohkem system CPU. | – | `sha1sum /dev/zero | sha1sum /dev/zero` + `top` | – |
| **13a. Kes kirjutab kettale kõige rohkem?** | – | TiWorker.exe | – | Resource Monitor → Disk Activity |
| **13b. Millisesse faili kirjutab?** | – | `C:\Windows\Logs\CBS\CBS.log` | – | Resource Monitor |
| **13c. Kes loeb kettalt kõige rohkem?** | – | svchost.exe (netsvcs -p) | – | Resource Monitor |
| **13d. Millisest failist loeb?** | – | System32 teenusefailid (vastavalt ResMon pildile) | – | Resource Monitor |
| **13e. Millisel protsessil suurim võrguliiklus?** | – | svchost.exe (netsvcs -p), PID 3408 | – | Resource Monitor → Network |
| **14. Võrguliikluse üksikasjad** | – | Local IP: 10.0.2.15 / Port 63292 → Remote: 98.66.133.xx:443, Latency 1 ms, Traffic ~7 B/s | – | Resource Monitor |
| **15. Sõbra aeglane arvuti – mida uurin?** | – | Task Manager (CPU, Memory, Disk, Network), Resource Monitor (Disk Activity, CPU, Memory, Network), Process Explorer (Private Bytes, Working Set, Start Time, Threads) | – | TM, ResMon, ProcExp |

