$Counter = 0
do {
$counter ++
    $Speed = (Get-CimInstance -Query "Select BytesTotalPersec from Win32_PerfFormattedData_Tcpip_NetworkInterface"| Where {$_.Name -eq 'Realtek PCIe GbE Family Controller'} | Select-Object BytesTotalPerSec).BytesTotalPerSec / 1Mb * 8
    Write-Host "- $(Get-Date -UFormat %H:%M) - $([math]::round($speed))Mbps"
    Sleep -Seconds 30
} while ($counter -le 60)
