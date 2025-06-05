# Install_Updates.ps1
Write-Host "`n==> Iniciando atualizacoes do Windows..." -ForegroundColor Cyan

# Dispara os comandos silenciosos
UsoClient StartScan
UsoClient StartDownload
UsoClient StartInstall

# Cria o arquivo de confirmação
$updateFlag = "C:\SCRIPT.2.0\confirm\update.txt"
New-Item -Path $updateFlag -ItemType File -Force | Out-Null
Set-Content -Path $updateFlag -Value "Sim"

# Aguarda a conclusão do processo de atualização
Write-Host "`n==> Aguardando 30 minutos para aplicacao das atualizacoes..." -ForegroundColor Cyan
Start-Sleep -Seconds 1800

#Permissão para executar scripts
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Agendar retomada com RunOnce
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" -Name Restark_AposReinicio -Value "powershell -ExecutionPolicy Bypass -File C:\SCRIPT.2.0\Final\RunAfterReboot.ps1"

# Reinicia
Write-Host "`n==> Reiniciando sistema em 10 segundos..." -ForegroundColor Yellow
Start-Sleep -Seconds 10
Restart-Computer -Force
