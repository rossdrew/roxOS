#roxOS 
<br/>
Some experimentations into what makes an operating systems.</br>
<br/>
An interesting project -I thought- to get me back up to speed with assembly and perhaps C and C++.  Most of the examples taken from "<i>Writing a Simple Operating System from Scratch</i>" by <a href="https://github.com/tpn/pdfs/blob/master/Writing%20a%20Simple%20Operating%20System%20from%20Scratch%20-%20Nick%20Blundell%20-%20Dec%202010.pdf">Nick Blundell</a>.<br/>  Once I get the basics down, I'm going to take a look at MITs course <a href="https://pdos.csail.mit.edu/6.828/2011/schedule.html">videos</a> on OS's
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
I am building with <a href="http://www.nasm.us/">NASM</a> (<i>v2.11.08</i>) asselmber and running in <a href="http://bochs.sourceforge.net/">Bochs</a> (<i>v2.6.8</i>) x86 emulator, my <i>bochsrc</a> file is also included in this repo.  Thinking about giving Qemu a try soon.<br/>
<br/>
I am currently doing my code edits and builds through '<i>Sublime Text 2</i>' (v2.0.2) and since <tt>r9a2dda5</tt>, I've been using a custom build-run Sublime build system file which is included in this repo.