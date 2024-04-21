@echo off

if "%~1" == "--help" (
    echo Usage: coder [your question...]
    exit /b 0
)

ollama run codeqwen:chat %*
