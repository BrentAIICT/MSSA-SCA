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

  > Make sure all of these functions get saved in your GitHub Repository 

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
    
    ```PowerShell
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

- Q1.2 Create a function that takes a three word sentence as a string parameter and only return th middle word <br>
  For this challenge use the methods .IndexOf() to find the location of the spaces and .Substring() to extract the middle word 

  <details><summary>Click for hint</summary><Strong> 

  ``` 
  If your parameter value was "Three Blind Mice"
  How can you return just the word "Blind" 
  ```
  </Strong></details> 
  <details><summary>Click to see the answer</summary><Strong> 
    
  ```PowerShell
  function Find-MiddleWord {
    Param ([string]$Sentence = 'Three Blind Mice' )
      
    $IndexMidWord = $Sentence.IndexOf(' ') + 1
    $IndexEndMidWord = $Sentence.IndexOf(' ',$IndexMidWord)
    $WordLength = $IndexEndMidWord - $IndexMidWord
    $MiddleWord = $Sentence.Substring($IndexMidWord,$WordLength)
    Return $MiddleWord
  }
    Find-MiddleWord -Sentence "Three Blind Mice"

  ```
  </Strong></details> 
   
## 2 Testing the use of Properties

- Q2.1 Create a function that calculates your age in days

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Create a function that:
    - takes your date of bith as a parameter, enter the date like this "15-Sep-1990"
    - convert the date string into a [datetime] object
    - calculate your age
    - convert age into days
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    function Get-AgeInDays {
      Param ([datetime]$DateOfBirth)
      $Now = Get-Date
      $Age = $Now - $DateOfBirth
      return $Age.Days
    }

    Get-AgeInDays -DateOfBirth "15-sep-1990"
    ```
    </Strong></details> 


## 3 Testing your ability to use arrays

- Q3.1 Write a function that will take an array of integers and will return the value of the smallest and largest added together <br>
       Keep these functions as you will need then for later exercises.

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Think about
    - the easiest ways to find the smallest and largest values in the array
    - return the value of the two numbers added together
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    function Get-Smallest {
      Param ([int[]]$IntArray)
      $SortedArray = $IntArray | Sort-Object 
      return ($SortedArray[0] + $SortedArray[-1])
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
    
    ```PowerShell
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
    
- Q3.3 Create a function that takes two strings in an array and compares the first character of the first word with the last character of the second word if they are the same return $true in not return $false

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    Consider:
    - How to get the first and last characters of two words
    - How to compare string values
    - When entering an array of strings for this function use this format 
      - "FirstWord","SecondWord"   NOT "FirstWord,SecondWord"
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    function CompareFirstLast {
      param ([string[]]$TwoWords)
      if ($TwoWords[0][0] -eq $TwoWords[1][-1]) {$Result = $true}
      else {$Result = $false}
      return $Result
    }

    CompareFirstLast -TwoWords bill,lob
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
    
    ```PowerShell
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

- Q5.1 Create a function that builds a new PowerShell Object based on the .Net class "WebClient" 
  - Use this new PowerShell object to download a file from the internet. 
  - Make sure the function has a parameter that allows you to enter a URL and set this URL as the default value:
    - http://www.mieliestronk.com/wordlist.html/corncob_lowercase.txt 
  - Download the internet file to a local file called e:\words.txt
  - After running your function make sure the local file has a list of words in it

  <details><summary>Click for hint</summary><Strong> 

  ``` 
  Think about:
  - How do we instantiate a .Net WebClient Object in PowerShell
  - What method in the object will help us achieve the desired outcome
  ```
  </Strong></details> 
  <details><summary>Click to see the answer</summary><Strong> 
  
  ```PowerShell
  function Get-WebFile {
    Param ([string]$URL = 'http://www.mieliestronk.com/corncob_lowercase.txt')
    $WebClient = [System.Net.WebClient]::New()
    $WebClient.DownloadFile($URL,'E:\words.txt')
  }

  Get-WebFile
  Get-Content E:\words.txt
  ```
  </Strong></details> 
  
- Q5.2 Create a function that uses the \[Math] class 
  - Write a function that has two parameters that are [int] types 
  - Have the function divide the first number by the second number
  - Return the result rounded to two decimal places
  - 

  <details><summary>Click for hint</summary><Strong> 

  ``` 
  Think about:
  - How do you get help about .net classes
  - What method in the object will help us achieve the desired outcome
  ```
  </Strong></details> 
  <details><summary>Click to see the answer</summary><Strong> 
  
  ```PowerShell
  function Divide {
    Param (
      [int]$Number1, 
      [int]$Number2
    )
    
    $Result = $Number1 / $Number2
    $Rounded = [math]::Round($Result,2)
    return $Rounded
  }
  
  Divide -Number1 2341 -Number2 113  
  ```
  </Strong></details> 


## 6 Using Comment Based Help

- Q6.1 Using the function you built for exercise 3, build "Comment Based Help" to show others how to use your function

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    To understand how to build Comment Based Help run the following command:
      Get-Help About_Comment_Based_Help 
    read the help page to help you learn how to produce the help content
    Make sure the Help content that you build has the following sections filled in:
    - Synopsis 
    - Description 
    - Parameter 
    - Example
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell

    function Get-Smallest {
      Param ([int[]]$IntArray)
      $SortedArray = $IntArray | Sort-Object 
      return ($SortedArray[0] + $SortedArray[-1])
    }
    
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
    
    function CompareFirstLast {
      param ([string[]]$TwoWords)
      if ($TwoWords[0][0] -eq $TwoWords[1][-1]) {$Result = $true}
      else {$Result = $false}
      return $Result
    }

    ```
    </Strong></details>
    

## 7 Create Modules

- Q7.1 Using the functions you built for exercise 3, create a module that contains the three functions <br>
       Save the module into one of the special locations that will allow the Module to auto load when a function within it is executed

    <details><summary>Click for hint</summary><Strong> 

    ``` 
    A PowerShell module is just a collection of functions in a library file called a Module and has the extension .psm1
    Remember not to call a function when it is in a Module file
    You can have your functions automatically load if they are saved in the correct location    
    ```
    </Strong></details> 
    <details><summary>Click to see the answer</summary><Strong> 
    
    ```PowerShell
    function Get-AgeInDays { 
      <#
        .Synopsis
           Takes your birthdate and calculates your age in days
        .DESCRIPTION
           This script accepts a parameter as a datetime object and using the current date
           calculates how old you are in days
        .EXAMPLE
           Get-AgeInDays -DateOfBirth '20-Jun-1979'
        .Parameter DateOfBirth
           This must be your date of birth entered in this format '20-Jun-1979' it will then use
           this date to discover how old you are in days 
      #>
      Param ([datetime]$DateOfBirth)
      $Now = Get-Date
      $Age = $Now - $DateOfBirth
      return $Age.Days
    }
    
    # Now to test the help
    Get-Help -Full Get-AgeInDays 
    ```
    </Strong></details>

        
