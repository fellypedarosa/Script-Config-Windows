# MAIN.PS1 - Script principal de automação Rastek

# 1. CONFIGURAÇÕES INICIAIS (energia, permissões, repositórios)
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
    Write-Host "`n==> Instalando Microsoft Office..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_Office.ps1"
}

# 6. INSTALAÇÃO OPCIONAL - PJE OFFICE
$PJEFile = Join-Path $ConfirmPath "PJE.txt"
if ((Test-Path $PJEFile) -and ((Get-Content $PJEFile) -eq 'Sim')) {
    Write-Host "`n==> Instalando PJE Office..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_PJE.ps1"
}

# 7. INSTALAÇÃO OPCIONAL - CERTIFICADOS
$CertFile = Join-Path $ConfirmPath "Certificados.txt"
if ((Test-Path $CertFile) -and ((Get-Content $CertFile) -eq 'Sim')) {
    Write-Host "`n==> Instalando drivers de certificados..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_Certificados.ps1"
}

# 8. INSTALAÇÃO OPCIONAL - SHODO
$ShodoFile = Join-Path $ConfirmPath "Shodo.txt"
if ((Test-Path $ShodoFile) -and ((Get-Content $ShodoFile) -eq 'Sim')) {
    Write-Host "`n==> Instalando Shodo..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_Shodo.ps1"
}

# 9. FINALIZAÇÃO - AGENDAR SCRIPT PÓS-REBOOT (se necessário)
Write-Host "`n==> Agendando execucao pos-reboot..." -ForegroundColor Cyan
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" `
  -Name "Rastek_AposReinicio" `
  -Value "powershell.exe -ExecutionPolicy Bypass -File $env:HOMEDRIVE\SCRIPT 2.0\Final\RunAfterReboot.ps1"

# 10. REINICIAR SISTEMA
Write-Host "`n==> Reiniciando sistema em 30 segundos..." -ForegroundColor Yellow
#shutdown.exe -r -f -t 30

#Temp
Write-Host "`nPressione qualquer tecla para continuar..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")