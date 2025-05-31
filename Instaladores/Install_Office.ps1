Write-Host "`n==> Instalando Office..." -ForegroundColor Cyan

$officePath = "C:\SCRIPT 2.0\Dependencias\office"
$setupExe = Join-Path $officePath "setup.exe"
$configXml = "configuration.xml"  # nome do arquivo dentro da pasta

Start-Process -FilePath $setupExe `
    -ArgumentList "/configure $configXml" `
    -WorkingDirectory $officePath `
    -Wait -NoNewWindow
