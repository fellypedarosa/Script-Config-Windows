# Script 2.0 – Automação de Configuração do Windows

Este projeto contém um conjunto de scripts em PowerShell projetados para automatizar a configuração de máquinas Windows recém formatadas.

## ⚙️ Funcionalidades

- Instalação automática de softwares essenciais via Winget
- Ajustes de energia e desativação de hibernação
- Renomeação do computador
- Instalação opcional do Office 365
- Instalação opcional de ferramentas jurídicas (PJe, Shodo, SafeSign, etc.)
- Atualizações do Windows
- Execução automatizada após reinicialização
- Execução silenciosa e sem necessidade de interação do usuário

## 🚀 Como usar

1. Copie a pasta `SCRIPT.2.0` para o diretório `C:\`
2. Execute o arquivo `SCRIPT 2.0.bat` como administrador
3. Siga as instruções exibidas durante a execução

> **Importante:** recomenda-se deixar o usuário `usuario que executa o script` sem senha antes de iniciar. O script pode definir uma senha automaticamente no final da execução caso seja adicionado no arquivo `Fim.ps1`.

---

## 📁 Estrutura esperada

Alguns arquivos não foram incluídos neste repositório devido ao tamanho exceder o limite permitido pelo GitHub. No entanto, para que o script funcione corretamente, é necessário garantir que os seguintes arquivos estejam presentes nos caminhos indicados:

| Caminho Esperado                                | Nome do Arquivo             | Observações                               |
|-------------------------------------------------|-----------------------------|-------------------------------------------|
| `Dependencias/winget.Msixbundle`                | `winget.Msixbundle`         | Instalador do Winget                      |
| `Dependencias/ADV/pjeoffice.exe`                | `pjeoffice.exe`             | Instalador utilizado por advogados        |

> Esses arquivos devem ser [baixados](https://drive.google.com/drive/folders/1KbVq5g7ArK-gFW-DPgpklGzijXcW1nip?usp=sharing) e copiados manualmente para os diretórios correspondentes **antes de executar o script**.

---

## 📌 Observações

- Este projeto é modular e pode ser facilmente adaptado para novos cenários.
- O script executa todas as etapas de forma minimizada para evitar interferência do usuário.
- Após a finalização, a pasta `SCRIPT.2.0` é removida automaticamente.

---

## 📞 Suporte

Para mais informações ou sugestões de melhoria, sinta-se à vontade para abrir uma issue neste repositório.

![image](https://github.com/user-attachments/assets/96264f9f-1ce2-498d-bf31-241451265f23)

