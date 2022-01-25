function CompareTwoWords {
  [cmdletbinding()]
  Param(
    [string[]]$TwoWords
  )
  $FirstWord = $TwoWords[0]
  $LastWord = $TwoWords[-1]
  if ($FirstWord[0] -eq $LastWord[-1]) {return $true}
  else {return $false}
}

CompareTwoWords -TwoWords "billy","hob" 
