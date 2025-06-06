Write-Host "`n-- CONFIGURACOES INICIAIS --" -ForegroundColor DarkCyan

# 1. Desativar tempo de desligamento da tela e suspensao (AC/DC)
Write-Host "`n==> Configurando energia..." -ForegroundColor Magenta
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0

# 2. Desativar inicialização rápida
powercfg /h off

# 3. Verificar se winget esta instalado
Write-Host "`n Verificando se o winget esta instalado..." -ForegroundColor Green
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host " Sim, Winget disponivel." -ForegroundColor Green
} else {
    Write-Host "`n==> Winget nao encontrado. Instalando..." -ForegroundColor Magenta

    $depPath = "C:\SCRIPT.2.0\Dependencias"

    try {
        Add-AppxPackage "$depPath\VisualC.Appx"
        Add-AppxPackage "$depPath\UI.Appx"
        Add-AppxPackage "$depPath\winget.Msixbundle"
        Write-Host "Winget instalado com sucesso."
    } catch {
        Write-Host "Erro ao instalar o winget." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }

    Write-Host " Instalacao concluida. Continuando..." -ForegroundColor Green
}

# 4. Politica de execucao
 #Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force