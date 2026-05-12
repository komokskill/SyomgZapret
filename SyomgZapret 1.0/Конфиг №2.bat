@echo off
chcp 65001 > nul

set "BIN=%~dp0core\"
set "LISTS=%~dp0lists\"

net session >nul 2>&1
if %errorLevel% neq 0 (echo [!] Запусти от имени администратора! & pause & exit)

taskkill /f /im winws.exe >nul 2>&1

echo [*] Запуск (Конфиг №2)...
echo [*] Список: %LISTS%list.txt

"%BIN%winws.exe" --wf-tcp=80,443,2053,2083,2087,2096,8443 --wf-udp=443,19294-19344,50000-65535 ^
--filter-udp=443 --hostlist="%LISTS%list.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-udp=19294-19344,50000-65535 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=10 --dpi-desync-any-protocol=1 --dpi-desync-autottl=2 --dpi-desync-fake-discord="%BIN%quic_initial_dbankcloud_ru.bin" --dpi-desync-fake-stun="%BIN%quic_initial_dbankcloud_ru.bin" --new ^
--filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=hostfakesplit --dpi-desync-repeats=4 --dpi-desync-fooling=ts --dpi-desync-hostfakesplit-mod=host=www.google.com --new ^
--filter-tcp=443 --hostlist="%LISTS%list.txt" --ip-id=zero --dpi-desync=hostfakesplit --dpi-desync-repeats=4 --dpi-desync-fooling=ts --dpi-desync-hostfakesplit-mod=host=www.google.com --new ^
--filter-tcp=80,443 --hostlist="%LISTS%list.txt" --dpi-desync=hostfakesplit --dpi-desync-repeats=4 --dpi-desync-fooling=ts,md5sig --dpi-desync-hostfakesplit-mod=host=ozon.ru --new ^
--filter-udp=443 --hostlist="%LISTS%list.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-tcp=80,443,8443 --hostlist="%LISTS%list.txt" --dpi-desync=hostfakesplit --dpi-desync-repeats=4 --dpi-desync-fooling=ts --dpi-desync-hostfakesplit-mod=host=ozon.ru

pause