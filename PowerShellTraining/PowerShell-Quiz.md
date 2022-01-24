<!--
    <details><summary>Click for hint</summary><Strong> 

    ``` 
    HINT
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    ANSWER
    ```
    </Strong></details> 
-->

# PowerShell Quiz

## 1 Testing the use of methods

- Q1.1 Create a function that takes a string as a parameter and reverses the case, upper case changed to lower case and lower case changed to upper case


    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Think about the following:
    - How do I test each character for upper or lower case
    - How do I invert the current case of each character
    - Make sure you enter a string that has upper and lower case to test the function fully
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    function ReverseCase {
      Param ([string]$InitialString)
      [string]$RevCaseString = ''
      0..($InitialString.length - 1) | ForEach-Object {
        if ($InitialString[$_].ToString().ToUpper() -ceq $InitialString[$_].ToString()) {$RevCaseString += $InitialString[$_].ToString().ToLower()}
        else {$RevCaseString += $InitialString[$_].ToString().ToUpper()}
      }
      return $RevCaseString
    }
    ReverseCase -InitialString "tHISiSAsTRING"

    ```
    </Strong></details> 


- Q1.2 Create a function that takes two strings in an array and compares the first character of the first word with the last character of the second word if they are the same return $true in not return $false

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Consider:
    - How to get the first and last characters of two words
    - How to compare string values
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    function CompareFirstLast {
      param ([string[]]$TwoWords)
      if ($TwoWords[0][0] -eq $TwoWords[1][-1]) {$Result = $true}
      else {$Result = $false}
      return $Result
    }

    CompareFirstLast -TwoWords bill,lob
    ```
    </Strong></details> 
    

    
## 2 Testing the use of Properties

- Q2.1 Create a function that calculates your age in days

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Create a function that:
    - takes your date of bith as a parameter
    - convert the date string into a [datetime] object
    - calculate your age
    - convert age into days
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    function AgeInDays {
      Param ([datetime]$DateOfBirth)
      $Now = Get-Date
      $Age = $Now - $DateOfBirth
      return $Age.Days
    }

    AgeInDays -DateOfBirth "5 sep 1990"
    ```
    </Strong></details> 


## 3 Testing your ability to use arrays

- Q3.1 Write a function that will take an array of integers and will return the value of the smallest and largest added together

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Think about
    - the easiest ways to find the two smallest values in the array
    - return the value of the two smallest numbers added together
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    function Get-Smallest {
      Param ([int[]]$IntArray)
      $SortedArray = $IntArray | Sort-Object 
      return ($SortedArray[0] + $SortedArray[1])
    }

    Get-Smallest -IntArray 45,3,22,12,1,455
    ```
    </Strong></details> 
    
    - Q3.2 Create a function that takes a word as a parameter and returns the count of vowels and the count of consonants

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Consider:
    - How to test if each character is a vowel or a consonant 
    - How to count how many of each exist in the string
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    function ConsonantsVowels {
      Param ([string]$Word)
      $Consonants = 0
      $Vowels = 0
      $ConList = 'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'
      $VowList = 'a','e','i','o','u'
      $Word.ToCharArray() | ForEach-Object {
        if ($_ -in $VowList) {$Vowels++}
        elseif ($_ -in $ConList) {$Consonants++} 
      }
      return "Consonants = $Consonants, Vowels = $Vowels"
    }

    ConsonantsVowels -Word "Thisisastring"
    ```
    </Strong></details> 

## 4 Testing Maniplulation of objects

- Q4.1 Write a function that lists all of the processes and shows the following: Name, ID, VirtualMemory for all processes that start with a letter given via a parameter

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Think about:
    - what command filters the objects via a condition/test
    - what command restricts which properties will be displayed 
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    function Get-Proc {
      Param ([string]$StartingLetter = 'w')
      $Processes = Get-Process | 
        Where-Object {$_.Name -like "$StartingLetter*"}  |
        Select-Object -Property Name,Id,VirtualMemorySize
      return ($Processes)
    }

    Get-Proc -StartingLetter w    
    ```
    </Strong></details> 
    
## 5 Using .Net Classes

- Q5.1 Using the .Net class WebClient and the URL of http://www.mieliestronk.com/wordlist.html download the list of words to a file called e:\words.txt

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Think about:
    - How do we instantiate a .Net WebClient Object in PowerShell
    - What method in the object will help us achieve the desired outcome
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```
    function Get-WebFile {
      Param ([string]$URL = 'http://www.mieliestronk.com/corncob_lowercase.txt')
      $WebClient = [System.Net.WebClient]::DownloadFile($URL,'E:\words.txt')
    }

    Get-WebFile
    ```
    </Strong></details> 
