#Проверка на совместимость PS версия 5 или выше #Checking for compatibility PS version 5 or higher
if ($PSVersionTable.PSVersion.Major -lt 5) {
Write-Host -BackgroundColor Red  "Yours PS version "$PSVersionTable.PSVersion.Major" is too old. please update it up to 5 or newer"
pause}

#Строка ниже решает проблемы с кодировкой #if you have problem with read terminal or log file you must remove comment below string
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("cp866")
#Вызываем выбор папки источника #Calling the source folder selection
$object1 = New-Object -comObject Shell.Application 
$Folder1 = $object1.BrowseForFolder(0, 'Выберите каталог-источник (оригинал)', 0,0)
#Проверяем что выбор сделан #  Check folder is not null
if ($Folder1 -eq $null) {
Write-Host -BackgroundColor Red  "Cancel"
break}
#Вызываем выбор папки реплики #Calling the target folder selection
$object2 = New-Object -comObject Shell.Application 
$Folder2 = $object2.BrowseForFolder(0, 'Выберите каталог-реплики (зеркало)', 0,0)
#Проверяем что выбор сделан #  Check folder is not null
if ($Folder2 -eq $null) {
Write-Host -BackgroundColor Red  "Cancel"
break}
#Проверяем, что выбрали не 2 одинаковые папки, иначе ошибка и остановка #Checking that 2 identical folders were not selected, otherwise an error and stop
if ($Folder2.Self.Path -eq $Folder1.Self.Path) {
Write-Host -BackgroundColor Red  "Error: incorect folder!"
Write-Host -BackgroundColor Red  "Каталог-источник не может быть выбран как каталог-реплики!"
pause
break 
}
#Предупреждаем пользователя - возможно удаление файлов!# attention user - it is possible to delete files!
$wshell = New-Object -ComObject Wscript.Shell
$DelContinue = $wshell.Popup("Внимание! Все файлы в каталог-реплики (зеркало) отличные от каталог-источника (оригинал) будут удалены!",0,"Подтвердите действие",4+16)
if ($DelContinue -eq 7) {
Write-Host -BackgroundColor Red  "Cancel"
break }
#Куда складываем логи файлов, по умолчанию в каталог-источник (оригинал) значение $pathlog = 0 #Path to the file logs, by default it in the source directory (original) the value of $Path log = 0
#На рабочий стол пользователя - значение 1 # To the user's desktop - value 1
#Выбрать папку - значение 2 # Select Folder - value 2
$pathlog = 0
#Ниже реализована функция подстановки пути для лог файла # The function of path the log file is implemented below
if ($pathlog -eq 1){
$log = "$env:HOMEPATH\desktop\"
}
elseif ($pathlog -eq 2){
$object3 = New-Object -comObject Shell.Application 
$logFolder = $object3.BrowseForFolder(0, 'Выберите каталог для сохранения лог файла', 0,0)
$log=$logFolder.Self.Path
if ($logFolder -eq $null) {
Write-Host -BackgroundColor Red  "Cancel"
break}}
else{$log = $Folder1.Self.Path}

#Алгоритм выполняет процесс копирования и удаления #main code
robocopy $Folder1.Self.Path $Folder2.Self.Path /mt /z /e /mir /UNILOG:$log"\logfl.txt"


Write-Host -BackgroundColor Green  "Script complete"
#Куда складываем логи ошибок PS # PS error log file
$Error| Out-File -FilePath $log"\logerr.txt"
pause