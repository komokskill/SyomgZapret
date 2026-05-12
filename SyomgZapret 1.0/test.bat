@echo off
chcp 65001 >nul

set "TEST_SCRIPT=%~dp0core\test zapret.ps1"

if not exist "%TEST_SCRIPT%" (
    echo [!] Ошибка: Файл "%TEST_SCRIPT%" не найден.
    echo Проверь, лежит ли он в папке core.
    pause
    exit /b
)

echo [*] Запуск тестирования стратегий из папки core...
echo [*] Сейчас откроется окно PowerShell для проверки твоего провайдера.
echo.

start "" powershell -NoProfile -ExecutionPolicy Bypass -File "%TEST_SCRIPT%"

echo [OK] Тест запущен.
pause