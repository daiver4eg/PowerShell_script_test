#Код, который выводит на экран числа от 1 до 146. 
#Если число кратно 3, необходимо вместо него вывести слово "Jackie". 
#Если число кратно 7, необходимо вывести вместо него слово "Chan". 
#Если число кратно 3 и 7, необходимо вывести фразу "JackieChan".
for ($a = 1; $a -le 146; $a++)
{
  if (($a % 3 -eq 0) -and ($a % 7 -eq 0)) {Write-Output "JackieChan"}
  elseif ($a % 3 -eq 0) {Write-Output "Jackie"} 
  elseif ($a % 7 -eq 0) {Write-Output "Chan"} 
  else {Write-Output "$a"}
}
