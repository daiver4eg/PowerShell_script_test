
for ($a = 1; $a -le 146; $a++)
{
  if (($a % 3 -eq 0) -and ($a % 7 -eq 0)) {Write-Output "JackieChan"}
  elseif ($a % 3 -eq 0) {Write-Output "Jackie"} 
  elseif ($a % 7 -eq 0) {Write-Output "Chan"} 
  else {Write-Output "$a"}
}