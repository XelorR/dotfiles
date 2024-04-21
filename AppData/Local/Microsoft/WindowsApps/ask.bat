@echo off

if "%~1" == "--help" (
    echo Usage: ask [your question...]
    exit /b 0
)

ollama run nous-hermes2 %*
