Write-Host "`n-- CONFIGURACOES INICIAIS --" -ForegroundColor Cyan

# 1. Desativar tempo de desligamento da tela e suspensao (AC/DC)
Write-Host "Configurando energia para nunca suspender a tela ou o sistema..."
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0

# 2. Verificar se winget esta instalado
Write-Host "Verificando se o winget esta instalado..."
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "Winget disponivel."
} else {
    Write-Host "Winget nao encontrado. Instalando offline..." -ForegroundColor Yellow

    $depPath = "C:\SCRIPT 2.0\Dependencias"

    try {
        Add-AppxPackage "$depPath\VisualC.Appx"
        Add-AppxPackage "$depPath\UI.Appx"
        Add-AppxPackage "$depPath\winget.Msixbundle"

        Write-Host "App Installer instalado. Talvez seja necessario reiniciar o sistema." -ForegroundColor Green
    } catch {
        Write-Host "Erro ao instalar o winget." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }

    Write-Host "Instalacao concluida. Continuando a execucao..." -ForegroundColor Green
}

# 3. Politica de execucao
 Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# 4. Atualização
Write-Host "`n==> Verificando atualizacoes do Windows..." -ForegroundColor Cyan

if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    Write-Host "Instalando modulo PSWindowsUpdate..."
    Install-PackageProvider -Name NuGet -Force | Out-Null
    Install-Module -Name PSWindowsUpdate -Force -Confirm:$false
}

Import-Module PSWindowsUpdate

# Executa atualização (sem interação, sem reboot automático)
Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot
Write-Host "Atualizacoes aplicadas. Reboot manual pode ser necessario." -ForegroundColor Yellow


# 4. (Comentado) Reinicializacao opcional
# Write-Host "Reiniciando sistema para aplicar configuracoes..." -ForegroundColor Yellow
# shutdown.exe -r -f -t 30
