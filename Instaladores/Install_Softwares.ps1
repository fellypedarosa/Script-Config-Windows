Write-Host "`n-- INSTALACAO DE SOFTWARES (SEQUENCIAL) --" -ForegroundColor Cyan

# Take Control
Write-Host "Instalando Take Control..."
$path = "C:\SCRIPT 2.0\Instaladores\Take_Control.msi"
Start-Process "msiexec.exe" -ArgumentList "/i `"$path`" /qn /norestart" -Wait
Write-Host "Take Control instalado."

# Java
Write-Host "Instalando Java..."
winget install --id=EclipseAdoptium.Temurin.17.JRE --source winget -e --silent

# Chrome
Write-Host "Instalando Google Chrome..."
winget install --id=Google.Chrome --source winget -e --silent

# Adobe
Write-Host "Instalando Adobe Acrobat Reader..."
winget install --id=Adobe.Acrobat.Reader.64-bit --source winget -e --silent

# 7-Zip
Write-Host "Instalando 7-Zip..."
winget install --id=7zip.7zip --source winget -e --silent

# VLC
Write-Host "Instalando VLC Media Player..."
winget install --id=VideoLAN.VLC --source winget -e --silent

# PDFsam Basic
Write-Host "Instalando PDFsam..."
winget install --id=PDFsam.PDFsam --source winget -e --silent

# Firefox
Write-Host "Instalando Mozilla Firefox..."
winget install --id=Mozilla.Firefox --source winget -e --silent

Write-Host "`nTodos os programas foram instalados." -ForegroundColor Green
