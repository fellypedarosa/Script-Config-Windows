# Mapa de Funcionalidades - Script 2.0

## COMO USAR:
 - Copie a pasta `SCRIPT.2.0` para o `C:\`
 - Entre na pasta e execute o `SCRIPT 2.0.bat` como administrador.

 *`Sugestão:`* Deixe o usuario `USUARIO QUE EXECUTA O SCRIPT` sem senha. Assim o Script 2.0 poderá executar automaticamente após o reboot. (Ao finalizar, no script pode definir uma senha ao usuario).


## Agora veja as funcionalidades presentes no SCRIPT 2.0:
### 1. `Config.ps1`
- Define opções de energia (não suspender, desligar ou hibernar).
- Desativa reinicialização rápida.
- Verificação &/ou instalação do Winget.

### 2. `Rename.ps1`
- Renomeia o computador com base no que o usuário quiser.
- Define nome para hostname.

### 3. `Confirm_Options.ps1`
<pre lang="md">- Pergunta se Deseja instalar o Office 365.
  └──Se for confirmado e instala o Office 365 após a reinicialização.
- Pergunta se o computador é para ADVOGADO.
  └──Se for confirmado ele instala os programas após a reinicialização:
    └──Instala PJE.
    └──Instala Leitora de cartão.
    └──Gerenciador de tokens da Safesign.
    └──Dive USB para o gerenciador de Tokens.
    └──Instala Shodo</pre>

### 4. `Install_Updates.ps1`
- Verifica se já foi realizado atualizações.
- Baixa e instala atualizações do windows via UsoClient.
- Agenda reinicialização com tempo prédefinido e ajustavel.
- Reinicia o Windows.

### 5. `Install_Office.ps1`
- Executa instalador do Office com configuração silenciosa caso tenha sido solicitado.
- Usa arquivo `config.xml` e `setup.exe`.

### 6. `Install_ADV.ps1`
<pre lang="md">- Instala programas dos Advogados:
  └──leitora
  └──safesign
  └──shodo
  └──USB
  └──pjeoffice</pre>

### 7. `Install_Softwares.ps1`
<pre lang="md">- Instala os softwares principais via Winget:
  └──Take Control
  └──Google Chrome
  └──Mozilla Firefox
  └──7-Zip
  └──VLC
  └──Acrobat
  └──Java
  └──PDFSam</pre>

### 8. `RunAfterReboot.ps1 + Fim.ps1`
<pre lang="md">- Executa ações após o reboot:
  └──Apaga pastas temporárias e a pasta do Script.2.0.
  └──Verifica se tem um usuário chamado (USUARIO QUE QUISER). Caso tenha, troca a senha do usuario para a que escolher.
  └──Reinicia a máquina.</pre>
