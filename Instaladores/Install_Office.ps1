$officePath = "C:\SCRIPT 2.0\Dependencias\office"
$setupExe = Join-Path $officePath "setup.exe"
$configXml = "configuration.xml"  # Caminho relativo ao diretório de trabalho

Start-Process -FilePath $setupExe `
    -ArgumentList "/configure $configXml" `
    -WorkingDirectory $officePath `
    -Wait -NoNewWindow
