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

- Question 1
  - Show a list of all services that are "running"


  <details><summary>Click for hint</summary><Strong> 

  ``` 
  Which command can test for a condition to be true regarding the object produced by a cmdlet
  ```
  </Strong></details> 
  <details><summary>Click to see the answer</summary><Strong> 
  
  ```
  Get-Service | Where-Object {$_.Status -eq 'Running'}
  ```
  </Strong></details> 
