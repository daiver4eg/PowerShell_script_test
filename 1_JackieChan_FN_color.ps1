function JackieChan(){
#Функция выводит на экран числа от 1 до Х. Х - можно установить в ручную .
#Если число кратно 3, вместо него выведит слово "Jackie". 
#Если число кратно 7, вместо него выведит слово "Chan". 
#Если число кратно 3 и 7, вместо него выведит фразу "JackieChan".
for ($a = 1; $a -le $args[0]; $a++)
{
  if (($a % 3 -eq 0) -and ($a % 7 -eq 0)) {Write-Host -BackgroundColor Green "JackieChan"}
  elseif ($a % 3 -eq 0) {Write-Host -BackgroundColor DarkGreen "Jackie"} 
  elseif ($a % 7 -eq 0) {Write-Host -BackgroundColor DarkGree "Chan"} 
  else {Write-Host -BackgroundColor DarkMagenta $a}
}}
JackieChan(146)