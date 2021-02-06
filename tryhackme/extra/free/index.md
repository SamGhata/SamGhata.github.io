# TryHackMe Free Rooms Extra Challenges

### Linux Fundamentals 1 {#LinuxFundamentals1}
[Extra Challenge](https://tryhackme.com/room/linux1):<br>
Don't follow the directions for using the shiba1 binary, but find another way to discover shiba2's password.<br>

<details>
<summary>Hint 1 (<i>click to expand</i>)</summary>
  
It's a simple reverse engineering task.

<details>
<summary>Hint 2</summary>
  
<a href="https://linux.die.net/man/1/strings">strings</a>

<details>
<summary>Solution</summary>

Doing <code>strings shiba1</code> and review shows it includes the line "cat /etc/shiba/shiba2".<br>
<code>ls -al /etc/shiba/shiba2</code> shows the file is:<br>
-rw-r--r-- 1 root root 9 Feb 13  2020 /etc/shiba/shiba2<br>
This is readable by any local user, so shiba1 can <code>cat /etc/shiba/shiba2</code> for the password.<br>
      
</details>
</details>
</details>
