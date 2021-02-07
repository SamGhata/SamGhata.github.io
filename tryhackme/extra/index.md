# TryHackMe Extra Challenges

## Free Rooms Index
<a href="#LinuxFundamentals1">Linux Fundamentals 1</a><br>
<a href="#Wonderland">Wonderland</a><br>
<br>
## Subscriber Rooms Index
tbd<br>
<br>
### Free Rooms Extra Challenges
<h4 id="LinuxFundamentals1"><a href="https://tryhackme.com/room/linux1">Linux Fundamentals 1</a></h4>
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
<code class="language-plaintext highlighter-rouge">ls -al /etc/shiba/shiba2</code> shows the file is:<br>
-rw-r--r-- 1 root root 9 Feb 13  2020 /etc/shiba/shiba2<br>
This is readable by any local user, so shiba1 can <code class="language-plaintext highlighter-rouge">cat /etc/shiba/shiba2</code> for the password.<br>
      
</details>
</details>
</details>

<br>
<h4 id="Wonderland"><a href="https://tryhackme.com/room/wonderland">Wonderland</a></h4>
The Room is meant to be finished by rooting the box, though both flags can be found with a different method.<br>
<details>
<summary>Hint 1 (<i>click to expand</i>)</summary>
  
Check the flag formats/masks and the Room tags. Tags are sometimes easier to see by doing a <a href="https://tryhackme.com/hacktivities?tab=search">search</a> for the Room name and looking at the preview in results.

<details>
<summary>Hint 2</summary>
  
It is not necessary to Deploy the machine.

<details>
<summary>Solution</summary>

The flag formats for Wonderland are very unusual for TryHackMe: they look like sentences or at least some kind of text. If you search Project Gutenberg, you can find a text-only format of Alice in Wonderland to copy local with:<br>
<code>wget http://www.gutenberg.org/files/11/11-0.txt</code><br>
Now we have the full text and <a href="https://www.gnu.org/software/grep/manual/grep.html#Introduction">grep</a> to search it.<br>
user.txt:<br>
<code class="language-plaintext highlighter-rouge">grep -sw -E '[[:graph:]]{10}[[:blank:]][[:graph:]]{3}[[:blank:]][[:graph:]]{11}' 11-0.txt</code><br>
<br>
root.txt is a little tricker by this method. Formatting the whole grep expression is an effort, but even with that dilligence it fails. However, that also requires learning how to add in checks for the commas, or include the counts in the "graph" portions. Those commas look helpful.<br>
Attempting only a search for the first portion:<br>
<code class="language-plaintext highlighter-rouge">grep -sw -E '[[:graph:]]{7}[,][[:blank:]][[:graph:]]{7}[,][[:blank:]][[:graph:]]{6}' 11-0.txt</code><br>
returns a single match, but on a line alone. Adding in the argument to get this line number from the text:<br>
<code class="language-plaintext highlighter-rouge">grep -swn -E '[[:graph:]]{7}[,][[:blank:]][[:graph:]]{7}[,][[:blank:]][[:graph:]]{6}' 11-0.txt</code><br>
returns 1737 for the line number. Using the <a href="https://linux.die.net/man/1/sed">sed</a> command to see what is happening in this area of the text:<br>
<code class="language-plaintext highlighter-rouge">sed '1732,1742!d' 11-0.txt</code><br>
reveals the two lines, separated from everything else, that can be entered to complete the flag.<br>
      
</details>
</details>
</details>

<br>
### Subscriber Rooms Extra Challenges
tbd<br>
<br>
## Retired Challenges
This is a collection of extra tasks for TryHackMe Rooms that have been patched since they were discovered, and are no longer available.

#### Pickle Rick
A previous version of the machine allowed full sudo in the web command portal. The challenge was to get a root login, which was not a necessary task for completing the Room as intended. The method had an extra step, because it was not possible to `cd` out of /var/www/html. Generating ssh keys in the place required by /etc/ssh/sshd_cofig involved adding an argument to `ssh-keygen`:<br>
extra credit - get shell on box<br>
all work done through web command portal<br>
<br>
`sudo mkdir /root/.ssh`<br>
`sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -b 2048`<br>
`sudo cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys`<br>
`sudo less /root/.ssh/id_rsa` (copy/paste to text editor and save local)<br>
<br>
on local: `chmod 600 id_rsa`<br>
login as: `ssh -i id_rsa root@$target`<br>
<br>
