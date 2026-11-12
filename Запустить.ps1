# Запуск на компьютере
$ErrorActionPreference = 'Stop'
$folder = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $folder
$python = Get-Command python -ErrorAction SilentlyContinue
if (-not $python) { $python = Get-Command py -ErrorAction SilentlyContinue }
if (-not $python) {
    Start-Process (Join-Path $folder 'index.html')
    Write-Host 'Открыт файл. Для микрофона, датчиков и офлайн-режима установите Python и запустите этот файл снова.'
    Read-Host 'Нажмите Enter для выхода'
    exit
}
$exe = $python.Source
$args = if ($python.Name -eq 'py.exe') { '-m http.server 8000' } else { '-m http.server 8000' }
Start-Process 'http://localhost:8000'
Write-Host 'Практикум доступен на http://localhost:8000. Для остановки закройте это окно.'
& $exe -m http.server 8000
