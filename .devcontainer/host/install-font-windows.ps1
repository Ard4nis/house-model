$ErrorActionPreference = "Stop"

$NerdFontsVersion = "3.5.1"
$FontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v$NerdFontsVersion/Meslo.zip"

$TempDir = Join-Path ([System.IO.Path]::GetTempPath()) "meslo-nerd-font-$([guid]::NewGuid())"
$ZipPath = Join-Path $TempDir "Meslo.zip"
$ExtractPath = Join-Path $TempDir "Meslo"

$FontDir = Join-Path $env:LOCALAPPDATA "Microsoft\Windows\Fonts"
$RegistryPath = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts"

try {
    New-Item -ItemType Directory -Path $TempDir -Force | Out-Null

    Write-Host "Downloading Meslo Nerd Font $NerdFontsVersion..."

    Invoke-WebRequest `
        -Uri $FontUrl `
        -OutFile $ZipPath

    Expand-Archive `
        -Path $ZipPath `
        -DestinationPath $ExtractPath `
        -Force

    New-Item -ItemType Directory -Path $FontDir -Force | Out-Null
    New-Item -Path $RegistryPath -Force | Out-Null

    Get-ChildItem `
        -Path $ExtractPath `
        -Recurse `
        -Filter "*.ttf" |
    ForEach-Object {
        $Destination = Join-Path $FontDir $_.Name

        Copy-Item `
            -Path $_.FullName `
            -Destination $Destination `
            -Force

        New-ItemProperty `
            -Path $RegistryPath `
            -Name "$($_.BaseName) (TrueType)" `
            -Value $Destination `
            -PropertyType String `
            -Force |
        Out-Null
    }

    Write-Host ""
    Write-Host "Meslo Nerd Font installed to:"
    Write-Host "  $FontDir"
    Write-Host ""
    Write-Host "Restart VS Code so Windows reloads the fonts."
}
finally {
    if (Test-Path $TempDir) {
        Remove-Item `
            -Path $TempDir `
            -Recurse `
            -Force
    }
}