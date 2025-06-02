@echo off
cd /d "C:\SCRIPT 2.0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File .\Main.ps1' -Verb RunAs"
