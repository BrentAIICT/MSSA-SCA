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
    
- Q1.3 Create a function that takes a word as a parameter and returns the count of vowels and the count of consonants

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
    
## 2 Testing the use of Properties

- Q2.1 Create a function that calculates your age in days

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


## 3 Testing your ability to use arrays

- Q3.1 Write a function that will take an array of integers and will return the value of the smallest and largest added together

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

## 4 Testing math 

- Q4.1 Write a function that takes a string like this "12/144" and simplify it to is smallest values. eg 12/144 => 1/12

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
    
- Q4.2 Write a function that creates a list of prime numbers up to a limit where the limit is entered as a parameter

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
    
- Q4.3 Write a function that takes an integer as a parameter and then calculate all of the prime numbers this can be divided into. Use the primes from the previous question to factor the parameter value 

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
