#Строка ниже решает проблемы с кодировкой #if you have problem with read terminal or log file you must remove comment below string
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("cp866")
#Запрашиваем ресурс для проверки
$dnsip = Read-Host 'Enter host\site name or IP:'
#Информирование
Write-Host -BackgroundColor Red  "For stop script - press Ctrl+C"
Write-Host -BackgroundColor Green "Your log file is here: c:$env:HOMEPATH\desktop\ping_$dnsip.txt"
#Команда для проверки доступности
ping -t $dnsip | Foreach{"{0} - {1}" -f (Get-Date -f "yyyyMMdd HH:mm:ss"),$PSItem} >$env:HOMEPATH\desktop\ping_$dnsip.txt