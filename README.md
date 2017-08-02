# Table Of Contents

<ul>
<li><a href = "#manga-to-web">Manga To Web</a></li>
	<ul>
		<li><a href = "#manga-console">Console</a></li>
		<li><a href = "#manga-gui">GUI</a></li>
	</ul>
<li><a href = "#unix-help-menu">Unix Help Menu</a></li>
</ul>

# <span id = "manga-to-web">Manga Webpage Generator</span>
<p><i>Please be advised to support manga artist when you can by buying a copy of their manga</i></p>

<p><b id = "manga-console">mangaWebPageCreator.py</b>: A script to create a webpage for all your downloaded manga or pictures that are stored locally</p>

<b>Dependencies:</b> <a href = "https://www.python.org/downloads/">Python 3</a>

To run the program:

```
$ python3 mangaToWebPage.py
```

<p><b id = "manga-gui">mangaToWebPage</b>: A Java GUI version of mangaWebPageCreator.py that has a more friendly UI to create webpages for all downloaded manga</p>

<b>Dependencies:</b> <a href = "http://www.oracle.com/technetwork/java/javase/downloads/index.html">Java JDK</a>

To run the program:

```
$ git clone https://github.com/zakuArbor/MiniScripts.git
$ cd MiniScripts/mangaToWebPage/src
$ java -cp . mangaToWebPage/webPageGUI.java #compile
$ java mangaToWebPage/webPageGUI.java #run
```

<p><center>

![](http://i.imgur.com/kWY87wb.gif "GIF")

</center>
<p>Features: Back and next chapter button</p>
<p><img src = 'https://lh3.googleusercontent.com/aQkexYkUm_Dbi6M6hJtYK_u2XCJm91sGNymums5AiV4louQC8euH0_DXTXaVkmTugal01tOCmfe-Q4fDsLmtwpF9cr8kr3Q50tjmlca9NWcN3_JJU8GxeWx_U9c76ws8csAJxtx9uUclNXyCj6pY1TaA9qSo3Q4lAc4_BmSuweF_-35slAX0NjkorQYVJuAuR2XEF3w8D9hXpuQvCu1SwOrHSddjCC50nhASHtn3MXOTVnD7IiTeaDsU73xj13VNa_dZ82SxELUO98pjXVNNNpZDWCkW81tlr0o34r8JOV_6b07lYACJA7aZ8HVaCFZrv9IdkG8FGKefguHT2fe4sXltpBghJiceMMFQeoolBhKI3te7BzMOJPpdX4tpDiEpwft97kiu7_1ti15t5QHglYpotraE1KT1vGt3p52su6Wn6SkpBSxFNJ7fVqWGajAPmnijS1nYMcV66p6BjeXjVDnXH9JSp13hW00i9gvpf81_YkUEg4yhP7oRZa2p302-M5wjA2KyxM2sK6pzuBl87bfR9JkGDFFH_uJrlln5-2KCOuOP31sNwN97cpcMsMST9tKvr50TzIbwor9gazYuDth20TQa-mT5ckGxLmmPCj3Kwnt4=w369-h182-no'></p>

<p><h1><b id = "unix-help-menu">MENU SYSTEM</b></h1></p>
<p><b>Project Idea Source:</b> https://www.csee.umbc.edu/courses/undergraduate/CMSC291C/summer01/burt/proj.html</p>
The unix help menu system is a shell script that helps user run some basic unix commands such as seeing the contents of the file, removing a file/dir, searching for a pattern through a file, and etc without knowing the commands itself. This menu system is very basic and may differ a bit from the project idea since I do not know what the expected output of the program. This was just an excercise to brush up my unix and shell programming.
