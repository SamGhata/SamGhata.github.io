[Linux Fundamentals 1](https://tryhackme.com/room/linux1)<br>
Extra Challenge:<br>
Don't follow the directions for using the shiba1 binary, but find another way to discover shiba2's password.<br>

<details>
<summary>Hint 1 (*click to expand*)</summary>
  
It's a simple reverse engineering task.

<details>
<summary>Hint 2</summary>
  
[strings](https://linux.die.net/man/1/strings)<br>

<details>
<summary>Solution</summary>

doing `strings shiba1` and review shows it includes the line "cat /etc/shiba/shiba2"<br>
`ls -al /etc/shiba/shiba2` shows the file is:<br>
-rw-r--r-- 1 root root 9 Feb 13  2020 /etc/shiba/shiba2<br>
this is readable by any local user, so shiba1 can `cat /etc/shiba/shiba2` for the password<br>
      
</details>
</details>
</details>
