Write-Host "`n-- INSTALACAO DO OFFICE 365 --" -ForegroundColor DarkCyan
Write-Host "`n==> Instalando Office..." -ForegroundColor Magenta

$officePath = "C:\SCRIPT.2.0\Dependencias\office"
$setupExe = Join-Path $officePath "setup.exe"
$configXml = "configuration.xml"  

Start-Process -FilePath $setupExe `
    -ArgumentList "/configure $configXml" `
    -WorkingDirectory $officePath `
    -Wait -NoNewWindow

Write-Host " Office 365 instalado."