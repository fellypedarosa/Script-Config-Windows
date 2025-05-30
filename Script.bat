@echo off
cd /d "C:\SCRIPT 2.0"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Unrestricted -File .\Main.ps1' -Verb RunAs"
