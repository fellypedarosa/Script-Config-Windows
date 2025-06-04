# Caminho para salvar os arquivos de confirmacao
$confirmPath = "C:\SCRIPT.2.0\confirm\"
if (!(Test-Path -Path $confirmPath)) {
    New-Item -Path $confirmPath -ItemType Directory | Out-Null
}

# Pergunta se deseja instalar o Office 365
do {
    $office = Read-Host "Deseja instalar o Office 365? (S/N)"
} while ($office -notin @("S", "N"))

if ($office -eq "S") {
    "Sim" | Out-File -FilePath "$confirmPath\Office.txt" -Encoding UTF8
} else {
    "Nao" | Out-File -FilePath "$confirmPath\Office.txt" -Encoding UTF8
}

# Pergunta se o computador e para advogado
do {
    $advogado = Read-Host "Este computador sera utilizado por advogado? (S/N)"
} while ($advogado -notin @("S", "N"))

$adv = if ($advogado -eq "S") { "Sim" } else { "Nao" }

$adv     | Out-File -FilePath "$confirmPath\ADV.txt" -Encoding UTF8

