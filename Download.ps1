function Get-DownloadTime {
    param (
        [Parameter(Mandatory)]
        [double]$fileSizeMB,  # Bestandsgrootte in megabytes
        [Parameter(Mandatory)]
        [double]$internetSpeedMbit  # Internetsnelheid in megabits per seconde
    )

    # Stap 1: Bereken de bestandsgrootte in megabits
    $fileSizeMbit = $fileSizeMB * 8

    # Stap 2: Bereken de downloadtijd in seconden
    $downloadTimeSeconds = $fileSizeMbit / $internetSpeedMbit

    # Bereken de downloadtijd in uren, minuten en seconden
    $downloadTimeMinutes = [math]::Floor($downloadTimeSeconds / 60)
    $remainingSeconds = $downloadTimeSeconds % 60
    $downloadTimeHours = [math]::Floor($downloadTimeMinutes / 60)
    $remainingMinutes = $downloadTimeMinutes % 60

    # Toon het resultaat
    Write-Output ("Downloadtijd: {0} seconden" -f [math]::Round($downloadTimeSeconds, 2))
    Write-Output ("Dat is ongeveer {0} uur, {1} minuten en {2} seconden." -f $downloadTimeHours, $remainingMinutes, [math]::Round($remainingSeconds, 2))
}