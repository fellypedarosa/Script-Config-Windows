# Install_Updates.ps1
Write-Host "`n==> Iniciando atualizacoes do Windows..." -ForegroundColor Cyan

# Dispara os comandos silenciosos
UsoClient StartScan
UsoClient StartDownload
UsoClient StartInstall

Write-Host "`n==> Aguardando 30 minutos para aplicacao das atualizacoes..." -ForegroundColor Cyan
Start-Sleep -Seconds 300 #1800

# Cria o arquivo de confirmação
$updateFlag = "$PSScriptRoot\..\Dependencias\Update\update.txt"
New-Item -Path $updateFlag -ItemType File -Force | Out-Null
Set-Content -Path $updateFlag -Value "Sim"

# Agendar retomada com RunOnce
$scriptPath = "C:\SCRIPT 2.0\Final\RunAfterReboot.cmd"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce" `
  -Name "ResumeScript" `
  -Value "powershell.exe -ExecutionPolicy Bypass -NoProfile -File `"$scriptPath`""


# Reinicia
Write-Host "`n==> Reiniciando sistema em 15 segundos..." -ForegroundColor Yellow
Start-Sleep -Seconds 15
Restart-Computer -Force
