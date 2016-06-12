#roxOS 
<br/>
Some experimentations into what makes an operating system.</br>
<br/>
An interesting project -I thought- to get me back up to speed with assembly and perhaps C and C++ (and as it turns out, NASM, Bochs and Sublime as well).  Most of the examples taken from "<i>Writing a Simple Operating System from Scratch</i>" by <a href="https://github.com/tpn/pdfs/blob/master/Writing%20a%20Simple%20Operating%20System%20from%20Scratch%20-%20Nick%20Blundell%20-%20Dec%202010.pdf">Nick Blundell</a>.<br/>  Once I get the basics down, I'm going to take a look at MITs course <a href="https://pdos.csail.mit.edu/6.828/2011/schedule.html">videos</a> on OS's
<br/>
<br/>
At this point it is just a lab.  It's more reading than actual code for now. As it is, i've <br/>
<ol>
	<li>created a working boot sector program and tested it using Bochs</li>
	<li>added some textual output</li>
	<li>added byte output as hex string (for debugging)</li>
	<li>working on moving to protected mode...</li>
</ol>

#Toolset
I am building with <a href="http://www.nasm.us/">NASM</a> (<i>v2.11.08</i>) assembler and running in <a href="http://bochs.sourceforge.net/">Bochs</a> (<i>v2.6.8</i>) x86 emulator, my <i>bochsrc</i> files are also included in this repo.  Thinking about giving the <a href="http://wiki.qemu.org/Main_Page">Qemu</a> emulator a try soon.<br/>
<br/>
I am currently doing my code edits and builds through <a href="http://www.sublimetext.com/">Sublime Text 2</a> (<i>v2.0.2</i>) with <a href="https://github.com/Nessphoro/sublimeassembly">Sublime Assembly</a> syntax highlighting and since <a href="https://github.com/rossdrew/roxOS/commit/15d79c91e6a2762f81486a259dc64d1d071a269b">15d79c9</a>, I've been using a custom build-run Sublime build system file which is included in this repo.

# Other Things
 - [How to Make a Computer Operating System from Scratch](https://github.com/SamyPesse/How-to-Make-a-Computer-Operating-System)
