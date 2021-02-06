[Linux Fundamentals 1](https://tryhackme.com/room/linux1)<br>
Extra Challenge:<br>
Don't follow the directions for using the shiba1 binary, but find another way to discover shiba2's password.<br>

<details>
  <summary>Hint 1 (<i>click to expand</i></summary>
  
  It's a simple reverse engineering task.

  <details>
    <summary>Hint 2 (<i>click to expand</i></summary>
  
  [strings](https://linux.die.net/man/1/strings)<br>
    <details>
      <summary>Solution (<i>click to expand</i></summary>

      doing `strings shiba1` and review shows it includes the line "cat /etc/shiba/shiba2"<br>
      `ls -al /etc/shiba/shiba2` shows the file is:<br>
      -rw-r--r-- 1 root root 9 Feb 13  2020 /etc/shiba/shiba2<br>
      this is readable by any local user, so shiba1 can `cat /etc/shiba/shiba2` for the password<br>
      
    </details>
  </details>
</details>
      
##TESTING
<details>
  <summary>stuff with *mark* **down** in `summary` doesn't work any more, use HTML <i>italics</i> and <b>bold</b> instead in <code>&lt;summary&gt;</code> (<i>click to expand</i>)</summary>
  <!-- have to be followed by an empty line! -->

## *formatted* **heading** with [a](link)
```java
code block
```

  <details>
    <summary><u>nested</u> <b>stuff</b> (<i>click to expand</i>)</summary>
    <!-- have to be followed by an empty line! -->

A bit more than normal indentation is necessary to get the nesting correct,
 1. list
 1. with
    1. nested
    1. items
        ```java
        // including code
        ```
    1. blocks
 1. and continued non-nested

  </details>
</details>
