Write-Host "`n-- INSTALACAO DOS SOFTWARES ADV --" -ForegroundColor DarkCyan

# Caminhos das flags
$leitoraFlag  = "$PSScriptRoot\leitora.txt"
$safesignFlag = "$PSScriptRoot\safesign.txt"
$shodoFlag    = "$PSScriptRoot\shodo.txt"
$usbFlag      = "$PSScriptRoot\usb.txt"
$pjeFlag      = "$PSScriptRoot\PJE.txt"

# Caminho base dos instaladores
$base = Resolve-Path "$PSScriptRoot\..\Dependencias\ADV"
$leitoraMSI  = Join-Path $base "leitora.msi"
$safesignMSI = Join-Path $base "safesign.msi"
$shodoMSI    = Join-Path $base "shodo.msi"
$usbEXE      = Join-Path $base "USB.exe"
$pjeEXE      = Join-Path $base "pjeoffice.exe"

# Instala Leitora
if (!(Test-Path $leitoraFlag)) {
    Write-Host "`n==> Instalando Leitora..." -ForegroundColor Magenta
    Start-Process "msiexec.exe" -ArgumentList "/i `"$leitoraMSI`" /qn /norestart" -Wait
    New-Item -Path $leitoraFlag -ItemType File -Force | Out-Null
    Start-Sleep -Seconds 30
    Write-Host " Leitora de cartao instalada com sucesso."
} else {
    Write-Host " Leitora de cartao ja instalada. Pulando..." -ForegroundColor Green
}

# Instala USB.exe
if (!(Test-Path $usbFlag)) {
    Write-Host "`n==> Instalando Drive USB..." -ForegroundColor Magenta
    Start-Process -FilePath $usbEXE -ArgumentList "/silent" -Wait
    New-Item -Path $usbFlag -ItemType File -Force | Out-Null
    Start-Sleep -Seconds 20
    Write-Host " Drive USB instalado com sucesso."
} else {
    Write-Host " Drive USB ja instalado. Pulando..." -ForegroundColor Green
}

# Instala SafeSign
if (!(Test-Path $safesignFlag)) {
    Write-Host "`n==> Instalando SafeSign..." -ForegroundColor Magenta
    Start-Process "msiexec.exe" -ArgumentList "/i `"$safesignMSI`" /qn /norestart" -Wait
    New-Item -Path $safesignFlag -ItemType File -Force | Out-Null
    Start-Sleep -Seconds 30
    Write-Host " SafeSign instalado com sucesso."
} else {
    Write-Host " SafeSign ja instalado. Pulando..." -ForegroundColor Green
}

# Instala Shodo
if (!(Test-Path $shodoFlag)) {
    Write-Host "`n==> Instalando Shodo..." -ForegroundColor Magenta
    Start-Process "msiexec.exe" -ArgumentList "/i `"$shodoMSI`" /qn /norestart" -Wait
    New-Item -Path $shodoFlag -ItemType File -Force | Out-Null
    Start-Sleep -Seconds 20
    Write-Host " Shodo instalado com sucesso."
} else {
    Write-Host " Shodo ja instalado. Pulando..." -ForegroundColor Green
}

# Instala PJeOffice
if (!(Test-Path $pjeFlag)) {
    Write-Host "`n==> Instalando PJe Office..." -ForegroundColor Magenta
    Start-Process -FilePath $pjeEXE -ArgumentList "/silent" -Wait
    New-Item -Path $pjeFlag -ItemType File -Force | Out-Null
    Start-Sleep -Seconds 20
    Write-Host " PJe Office instalado com sucesso." 
} else {
    Write-Host " PJe Office ja instalado. Pulando..." -ForegroundColor Green
}
