# 1. Caminho absoluto da pasta a ser removida
$folderPath = 'C:\SCRIPT.2.0'

# 2. Nome único para a chave em RunOnce
$runOnceName = 'DeleteSCRIPT20'

# 3. Comando inline que será executado no próximo login para remover a pasta
$removeCmd = "powershell.exe -NoProfile -WindowStyle Hidden -Command `"Remove-Item -Path '$folderPath' -Recurse -Force`""

# 4. Hive RunOnce no Registro (HKLM: requer execução como Administrador)
$runOnceKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce'

Try {
    # 5. Cria (ou sobrescreve) a entrada RunOnce
    Set-ItemProperty -Path $runOnceKey -Name $runOnceName -Value $removeCmd -Force

    Write-Host "⇒ Agendado: no proximo login, a pasta '$folderPath' sera removida." -ForegroundColor Green
}
Catch {
    Write-Warning "✘ Nao foi possivel criar a entrada RunOnce: $_"
}

Write-Host "`n==> Reiniciando sistema em 15 segundos..." -ForegroundColor Yellow
shutdown.exe -r -f -t 15