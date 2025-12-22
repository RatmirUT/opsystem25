# ratmir_bezrodnoi.ps1
# Praktikum 14 – Skriptimine Windowsis (PowerShell)
# Skript kogub testarvuti süsteemiinfo ja salvestab selle faili.
# Autor: Ratmir Bezrodnoi

$OutFile = "ratmir_bezrodnoi.out.txt"

# Abifunktsioon sektsioonide kirjutamiseks
function Write-Section {
    param(
        [string]$Title,
        [object]$Content
    )

    Add-Content $OutFile "=============================="
    Add-Content $OutFile $Title
    Add-Content $OutFile "=============================="

    if ($Content -is [string]) {
        Add-Content $OutFile $Content
    } else {
        $Content | Out-String | Add-Content $OutFile
    }

    Add-Content $OutFile ""
}

# Puhastame faili alguses
"" | Out-File $OutFile -Encoding UTF8

# 1) Masina nimi, PowerShelli ja Windowsi versioon
$hostname = $env:COMPUTERNAME
$psver = $PSVersionTable.PSVersion.ToString()
$os = Get-CimInstance Win32_OperatingSystem

Write-Section "1) Masina nimi, PowerShell ja Windows" @"
Masina nimi: $hostname
PowerShelli versioon: $psver
Windows: $($os.Caption) (Build $($os.BuildNumber))
"@

# 2) Võrgu konfiguratsioon
$net = Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "IPEnabled=True" |
Select-Object Description,
              MACAddress,
              DHCPEnabled,
              @{n="IPAddress";e={$_.IPAddress -join ", "}},
              @{n="Subnet";e={$_.IPSubnet -join ", "}},
              @{n="Gateway";e={$_.DefaultIPGateway -join ", "}}

Write-Section "2) Võrgu konfiguratsioon" ($net | Format-Table -AutoSize)

# 3) CPU ja RAM
$cs = Get-CimInstance Win32_ComputerSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$ramGB = [Math]::Round($cs.TotalPhysicalMemory / 1GB, 2)

Write-Section "3) Protsessor ja RAM" @"
CPU: $($cpu.Name)
RAM (GB): $ramGB
"@

# 4) Graafikakaart
$gpu = Get-CimInstance Win32_VideoController |
Select-Object Name, DriverVersion, DriverDate,
              CurrentHorizontalResolution,
              CurrentVerticalResolution

Write-Section "4) Graafikakaart" ($gpu | Format-Table -AutoSize)

# 5) Kõvakettad ja C: vaba ruum
$disks = Get-CimInstance Win32_DiskDrive |
Select-Object Model,
              @{n="Maht GB";e={[Math]::Round($_.Size/1GB,2)}}

$cdrive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" |
Select-Object DeviceID,
              @{n="Maht GB";e={[Math]::Round($_.Size/1GB,2)}},
              @{n="Vaba GB";e={[Math]::Round($_.FreeSpace/1GB,2)}}

Write-Section "5) Kõvakettad" ($disks | Format-Table -AutoSize)
Write-Section "5b) C: ketas" ($cdrive | Format-Table -AutoSize)

# 6) PCI seadmete draiverid
$pci = Get-CimInstance Win32_PnPSignedDriver |
Where-Object {$_.DeviceID -like "PCI*"} |
Select-Object DeviceName, Manufacturer, DriverVersion

Write-Section "6) PCI seadmete draiverid" ($pci | Format-Table -AutoSize)

# 7) Lokaalsed kasutajad
$users = Get-CimInstance Win32_UserAccount -Filter "LocalAccount=True" |
Select-Object Name, Description, Disabled

Write-Section "7) Lokaalsed kasutajad" ($users | Format-Table -AutoSize)

# 8) Käimasolevate protsesside arv
$procCount = (Get-Process).Count
Write-Section "8) Protsesside arv" "Protsesse kokku: $procCount"

# 9) 10 viimati käivitatud protsessi
$last = Get-Process | Where-Object {$_.StartTime} |
Sort-Object StartTime -Descending |
Select-Object -First 10 Name, Id, StartTime

Write-Section "9) 10 viimati käivitatud protsessi" ($last | Format-Table -AutoSize)

# 10) Kuupäev ja kellaaeg
$now = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
Write-Section "10) Kuupäev ja kellaaeg" $now

