# MAIN.PS1 - Script principal de automação Rastek

# 1. CONFIGURAÇÕES INICIAIS (energia, atualização, repositórios)
Write-Host "`n==> Executando configuracoes iniciais..." -ForegroundColor Cyan
& "$PSScriptRoot\Setup\Config.ps1"

# 2. RENOMEIA O COMPUTADOR
Write-Host "`n==> Renomeando computador..." -ForegroundColor Cyan
& "$PSScriptRoot\Setup\Rename.ps1"

# 3. CONFIRMA INSTALAÇÕES OPCIONAIS (PJE, Certificados, etc.)
Write-Host "`n==> Perguntas sobre instalacoes opcionais..." -ForegroundColor Cyan
& "$PSScriptRoot\Setup\Confirm_Options.ps1"

# 4. INSTALA SOFTWARES ESSENCIAIS COM WINGET (Chrome, Adobe, etc.)
Write-Host "`n==> Instalando softwares principais..." -ForegroundColor Cyan
& "$PSScriptRoot\Instaladores\Install_Softwares.ps1"

# Caminho base da pasta de confirmação
$ConfirmPath = "$env:HOMEDRIVE\SCRIPT 2.0\confirm"

# 5. INSTALAÇÃO OPCIONAL - OFFICE
$OfficeFile = Join-Path $ConfirmPath "Office.txt"
if ((Test-Path $OfficeFile) -and ((Get-Content $OfficeFile) -eq 'Sim')) {
    Write-Host "`n==> Certo vamos instalar o Office 365..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_Office.ps1"
}

# 6. INSTALAÇÃO OPCIONAL - ADVOGADOS
$advFile = Join-Path $ConfirmPath "ADV.txt"
if ((Test-Path $advFile) -and ((Get-Content $advFile) -eq 'Sim')) {
    Write-Host "`n==> Instalando apps dos advogados..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_ADV.ps1"
}

# 7. FINALIZAÇÃO - AGENDAR SCRIPT PÓS-REBOOT (se necessário)
Write-Host "`n==> Agendando execucao pos-reboot..." -ForegroundColor Cyan
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" `
  -Name "Rastek_AposReinicio" `
  -Value "powershell.exe -ExecutionPolicy Bypass -File $env:HOMEDRIVE\SCRIPT 2.0\Final\RunAfterReboot.ps1"

# 8. REINICIAR SISTEMA
Write-Host "`n==> Reiniciando sistema em 30 segundos..." -ForegroundColor Yellow
#shutdown.exe -r -f -t 30

#Temp
Write-Host "`nPressione qualquer tecla para continuar..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")