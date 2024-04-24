@echo off

if "%~1" == "--help" (
    echo Usage: logic [your question...]
    exit /b 0
)

ollama run phi3 %*
