# MAIN.PS1 - Script principal de automação Rastek

# 1. CONFIGURAÇÕES INICIAIS (energia, atualização, repositórios)
Write-Host "`n==> Executando configuracoes iniciais..." -ForegroundColor Cyan
& "$PSScriptRoot\Setup\Config.ps1"

$confirmPath = "C:\SCRIPT.2.0\confirm"
$renameFile = Join-Path $confirmPath "rename.txt"

if ((Test-Path $renameFile)) {
    Write-Host "`n==> Nome atualizado..." -ForegroundColor Green
}
# 2. RENOMEIA O COMPUTADOR
else {
Write-Host "`n==> Renomeando computador..." -ForegroundColor Cyan
& "$PSScriptRoot\Setup\Rename.ps1"
}
# Verifica se os arquivos de confirmação já existem
$advFile = Join-Path $confirmPath "ADV.txt"
$officeFile = Join-Path $confirmPath "Office.txt"

if ((Test-Path $advFile) -and (Test-Path $officeFile)) {
    Write-Host "`n==> Respostas ja confirmadas anteriormente. Pulando instalacoes opcionais..." -ForegroundColor Green
}
else {
    # 3. CONFIRMA INSTALAÇÕES OPCIONAIS (Apps de ADV e Office 365.)
    Write-Host "`n==> Perguntas sobre instalacoes opcionais..." -ForegroundColor Cyan
    & "$PSScriptRoot\Setup\Confirm_Options.ps1"
}

# 4. VERIFICA SE DEVE INSTALAR ATUALIZACOES DO WINDOWS
$updateFlagPath = "$PSScriptRoot\Dependencias\Update\update.txt"
if ((Test-Path $updateFlagPath) -and ((Get-Content $updateFlagPath) -eq 'Sim')) {
    Write-Host "`n==> Windows ja atualizado. Pulando atualizacoes..." -ForegroundColor Green
}
else {
    Write-Host "`n==> Atualizando o Windows. Essa etapa pode demorar..." -ForegroundColor Yellow
    & "$PSScriptRoot\Setup\Install_Updates.ps1"
    exit
}
# 5. INSTALA SOFTWARES ESSENCIAIS COM WINGET (Chrome, Adobe, etc.)
Write-Host "`n==> Instalando softwares principais..." -ForegroundColor Cyan
& "$PSScriptRoot\Instaladores\Install_Softwares.ps1"

# 6. INSTALAÇÃO OPCIONAL - OFFICE
$OfficeFile = Join-Path $ConfirmPath "Office.txt"
if ((Test-Path $OfficeFile) -and ((Get-Content $OfficeFile) -eq 'Sim')) {
    Write-Host "`n==> Certo vamos instalar o Office 365..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_Office.ps1"
}

# 7. INSTALAÇÃO OPCIONAL - ADVOGADOS
if ((Test-Path $advFile) -and ((Get-Content $advFile) -eq 'Sim')) {
    Write-Host "`n==> Instalando apps dos advogados..." -ForegroundColor Cyan
    & "$PSScriptRoot\Instaladores\Install_ADV.ps1"
}

# 8. REINICIAR SISTEMA
Write-Host "`n==> Reiniciando sistema em 15 segundos..." -ForegroundColor Yellow
shutdown.exe -r -f -t 15

#Temp
#Write-Host "`nPressione qualquer tecla para continuar..." -ForegroundColor Yellow
#$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")