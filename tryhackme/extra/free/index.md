[Linux Fundamentals 1](https://tryhackme.com/room/linux1)<br>
Extra Challenge:<br>
Don't follow the directions for using the shiba1 binary, but find another way to discover shiba2's password.<br>
Hint 1:<br>
>! It's a simple reverse engineering task.<br>
Hint 2:<br>
>! [strings](https://linux.die.net/man/1/strings)<br>
Solution:<br>
>! doing `strings shiba1` and review shows it includes the line "cat /etc/shiba/shiba2"
>! `ls -al /etc/shiba/shiba2` shows the file is:
>! -rw-r--r-- 1 root root 9 Feb 13  2020 /etc/shiba/shiba2
>! this is readable by any local user, so shiba1 can `cat /etc/shiba/shiba2` for the password
