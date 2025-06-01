# Caminho da flag para idempotencia
$certFlag = "$PSScriptRoot\Certificados.txt"
if (Test-Path $certFlag) {
    Write-Host "Certificados ja instalados. Pulando..."
    return
}

# Caminhos absolutos dos instaladores
$base = Resolve-Path "$PSScriptRoot\..\Dependencias\certificado"
$leitoraMSI = Join-Path $base "leitora.msi"
$safesignMSI = Join-Path $base "safesign.msi"
$shodoMSI = Join-Path $shodoBase "shodo.msi"
$usbEXE = Join-Path $base "USB.exe"

# Instalar USB.exe (ja testado como silencioso)
Write-Host "Instalando USB.exe..."
Start-Process -FilePath $usbEXE -ArgumentList "/silent" -Wait

# Instalar SafeSign.msi
Write-Host "Instalando SafeSign.msi..."
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$safesignMSI`" /qn /norestart" -Wait

# Instalar Leitora.msi
Write-Host "Instalando Leitora.msi..."
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$leitoraMSI`" /qn /norestart" -Wait

# Instalar Shodo
Write-Host "Instalando Shodo.msi..."
Start-Process "msiexec.exe" -ArgumentList "/i `"$shodoMSI`" /qn /norestart" -Wait

# Criar flag
New-Item -Path $certFlag -ItemType File -Force | Out-Null
Write-Host "Certificados instalados com sucesso."
