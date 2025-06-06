#Renomeia computador
$NewHostName = Read-Host -Prompt ' Coloque o novo nome do Computador: '
$OldHostName = hostname
Rename-Computer -ComputerName "$OldHostName" -NewName "$NewHostName" -Force -PassThru

# Cria o arquivo de confirmação
$confirmPath = "C:\SCRIPT.2.0\confirm\rename.txt"
New-Item -Path $confirmPath -ItemType File -Force | Out-Null
Set-Content -Path $confirmPath -Value "Sim"