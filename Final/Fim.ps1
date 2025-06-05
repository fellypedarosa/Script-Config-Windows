# Caminho absoluto da pasta a ser removida
$folderPath = 'C:\SCRIPT.2.0'

# Nome único para a chave em RunOnce
$runOnceName = 'DeleteSCRIPT20'

# Comando inline que será executado no próximo login para remover a pasta
$removeCmd = "powershell.exe -NoProfile -WindowStyle Hidden -Command `"Remove-Item -Path '$folderPath' -Recurse -Force`""

# Hive RunOnce no Registro (HKLM: requer execução como Administrador)
$runOnceKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce'

Try {
    # Cria (ou sobrescreve) a entrada RunOnce
    Set-ItemProperty -Path $runOnceKey -Name $runOnceName -Value $removeCmd -Force

    Write-Host "==> Agendado. no proximo login, a pasta '$folderPath' sera removida." -ForegroundColor Green
}
Catch {
    Write-Warning "Nao foi possivel criar a entrada RunOnce: $_"
}

# Cria usuario rtk.sup se não existir e adiciona uma senha
net user rtk.sup r4st3kt1!
Write-Host "`n==> Ajustado usuario rtk.sup..." -ForegroundColor Green

Write-Host "`n==> Reiniciando sistema em 10 segundos..." -ForegroundColor Yellow
Start-Sleep -Seconds 10
Restart-Computer -Force