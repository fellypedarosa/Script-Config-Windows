Write-Host "`n-- INSTALACAO DOS SOFTWARES PADROES --" -ForegroundColor DarkCyan

# Take Control
Write-Host "`n==> Instalando Take Control..." -ForegroundColor Magenta
$path = "C:\SCRIPT.2.0\Dependencias\Take_Control\Take_Control.msi"
Start-Process "msiexec.exe" -ArgumentList "/i `"$path`" /qn /norestart" -Wait
Start-Sleep -Seconds  30
Write-Host " Take Control instalado."

# Java
Write-Host "`n==> Instalando Java..." -ForegroundColor Magenta
winget install --id=EclipseAdoptium.Temurin.17.JRE --source winget -e --silent

# Chrome
Write-Host "`n==> Instalando Google Chrome..." -ForegroundColor Magenta
winget install --id=Google.Chrome --source winget -e --silent

# Adobe
Write-Host "`n==> Instalando Adobe Acrobat Reader..." -ForegroundColor Magenta
winget install --id=Adobe.Acrobat.Reader.64-bit --source winget -e --silent

# 7-Zip
Write-Host "`n==> Instalando 7-Zip..." -ForegroundColor Magenta
winget install --id=7zip.7zip --source winget -e --silent

# VLC
Write-Host "`n==> Instalando VLC Media Player..." -ForegroundColor Magenta
winget install --id=VideoLAN.VLC --source winget -e --silent

# PDFsam Basic
Write-Host "`n==> Instalando PDFsam..." -ForegroundColor Magenta
winget install --id=PDFsam.PDFsam --source winget -e --silent

# Firefox
Write-Host "`n==> Instalando Mozilla Firefox..." -ForegroundColor Magenta
winget install --id=Mozilla.Firefox --source winget -e --silent

Write-Host "`n==> Todos os programas foram instalados." -ForegroundColor Magenta
