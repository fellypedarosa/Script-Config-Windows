# Mapa de Funcionalidades - Script 2.0

Este documento resume as funcionalidades presentes no `SCRIPT 2.0`.

---

## 📁 Setup

### 1. `Config.ps1`
- Define opções de energia (não suspender, desligar ou hibernar).
- Cria ponto de restauração do sistema.
- Verifica se tem atualizações do Windows, e se tiver baixa e instala.

### 2. `Rename.ps1`
- Renomeia o computador com base no que o usuário quiser.
- Define nome para hostname e reinicia (caso necessário).

### 3. `Confirm_Options.ps1`
- Pergunta se Deseja instalar o Office 365.
	- Se for confirmado e instala o Office 365.
- Pergunta se o computador é para ADVOGADO.
	- Se for confirmado ele instala os programas:
	  - Instala PJE
	  - Instala Certificados
	  - Instala Shodo



---

## 📁 Instaladores

### 4. `Install_Softwares.ps1`
- Instala os softwares principais:
  - TakeControl
  - Google Chrome
  - Mozilla Firefox
  - 7-Zip
  - VLC
  - Acrobat
  - Java
  - PDFSam

### 5. `Install_Certificados.ps1`
- Instala drivers de token (via instaladores):
  - SafeSign
  - USB
  - leitora

### 6. `Install_Office.ps1`
- Executa instalador do Office com configuração silenciosa caso tenha sido solicitado.
- Usa arquivo `config.xml` e `setup.exe`.

### 7. `Install_PJE.ps1`
  - Instala o PJE Office caso tenha sido solicitado
	  PJE Office (via instalador`.exe`)

### 8. `Install_Shodo.ps1`
- Instala o assinador digital caso tenha sido solicitado.
- Shodo (via instalador `.exe`).

---

## 📁 Final

### 9. `RunAfterReboot.ps1`
- Executa ações após o reboot:
  - Apaga pastas temporárias e a pasta do Script 2.0.
  - Verifica se tem um usuário chamado rtk.sup. Caso tenha, troca a senha do usuario para r4st3kt1!
  - Gera log de conclusão dentro de uma pasta que será criada em C:\TI.
  - Reinicia a máquina, se necessário.

---

