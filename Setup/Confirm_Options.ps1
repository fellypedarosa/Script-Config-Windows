# Caminho para salvar os arquivos de confirmacao
$confirmPath = "C:\SCRIPT.2.0\confirm\"
if (!(Test-Path -Path $confirmPath)) {
    New-Item -Path $confirmPath -ItemType Directory | Out-Null
}

# Pergunta se deseja instalar o Office 365
do {
    $office = Read-Host " Deseja instalar o Office 365? (sim/nao)"
} while ($office -notin @("sim", "nao"))

if ($office -eq "sim") {
    "Sim" | Out-File -FilePath "$confirmPath\Office.txt" -Encoding UTF8
} else {
    "Nao" | Out-File -FilePath "$confirmPath\Office.txt" -Encoding UTF8
}

# Pergunta se o computador e para advogado
do {
    $advogado = Read-Host " Este computador precisa dos apps de advogados? (sim/nao)"
} while ($advogado -notin @("sim", "nao"))

$adv = if ($advogado -eq "sim") { "Sim" } else { "Nao" }

$adv     | Out-File -FilePath "$confirmPath\ADV.txt" -Encoding UTF8

