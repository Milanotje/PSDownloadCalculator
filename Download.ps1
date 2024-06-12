function Get-DownloadTime {
    param (
        [Parameter(Mandatory)]
        [double]$fileSizeMB,
        [Parameter(Mandatory)]
        [double]$internetSpeedMbit
    )
    
    $fileSizeMbit = $fileSizeMB * 8


    $downloadTimeSeconds = $fileSizeMbit / $internetSpeedMbit


    $downloadTimeMinutes = [math]::Floor($downloadTimeSeconds / 60)
    $remainingSeconds = $downloadTimeSeconds % 60
    $downloadTimeHours = [math]::Floor($downloadTimeMinutes / 60)
    $remainingMinutes = $downloadTimeMinutes % 60


    Write-Output ("Downloadtijd: {0} seconden" -f [math]::Round($downloadTimeSeconds, 2))
    Write-Output ("Dat is ongeveer {0} uur, {1} minuten en {2} seconden." -f $downloadTimeHours, $remainingMinutes, [math]::Round($remainingSeconds, 2))
}
