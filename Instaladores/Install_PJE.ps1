# Caminho do marcador para idempotencia
$pjeFlag = "$PSScriptRoot\PJE.txt"
if (Test-Path $pjeFlag) {
    Write-Host "PJe Office ja instalado. Pulando..."
    return
}

# Caminho absoluto do instalador
$installerPath = Resolve-Path "$PSScriptRoot\..\Dependencias\PJE\pjeoffice.exe"

Write-Host "Iniciando instalacao silenciosa do PJe Office..."

# Executa o instalador com o parametro /silent
Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait

# Cria o marcador
New-Item -Path $pjeFlag -ItemType File -Force | Out-Null

Write-Host "PJe Office instalado com sucesso."
