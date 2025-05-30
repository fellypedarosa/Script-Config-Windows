# Caminho para salvar os arquivos de confirmacao
$confirmPath = "C:\SCRIPT 2.0\confirm"
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

$pje = $cert = $shodo = if ($advogado -eq "S") { "Sim" } else { "Nao" }

$pje     | Out-File -FilePath "$confirmPath\PJE.txt" -Encoding UTF8
$cert    | Out-File -FilePath "$confirmPath\Certificados.txt" -Encoding UTF8
$shodo   | Out-File -FilePath "$confirmPath\Shodo.txt" -Encoding UTF8
