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

    Write-Host " Agendado. no proximo login, a pasta '$folderPath' sera removida." -ForegroundColor Green
}
Catch {
    Write-Warning " Nao foi possivel criar a entrada RunOnce: $_" -ForegroundColor Red
}

# Adiciona uma senha no usuario
# net user seu.usuario sua.senha 
Write-Host "`n Ajustado usuario..." -ForegroundColor Green
Start-Sleep -Seconds 5

Write-Host "`n==> Finalizando o SCRIPT 2.0. Espero que tenha gostado : )" -ForegroundColor Cyan
Start-Sleep -Seconds 15

Write-Host "`n==> Reiniciando sistema em 10 segundos..." -ForegroundColor Green
Start-Sleep -Seconds 10
Restart-Computer -Force