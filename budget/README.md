# budget
A budget program that keeps track of your spending. 

<h2>TABLE OF CONTENTS</h2>
<ul>
<li><a href = "#features">FEATURES</a></li>
<li><a href = "#plan">PLAN</a></li>
<li><a href = "#possible_features">POSSIBLE FEATURES</a></li>
<li><a href = "#issues">ISSUES</a></li>
<li><a href = "#documentation">Documentation</a></li>
</ul>

<p><h3 id = "features">FEATURES:</h3></p>
<ul>
<li>Keeps track on your monthly spending</li>
<li>Know where your money is going</li>
<li>Generate webpages regarding of your spending</li>
<li>Generate various graphs to visualize your spending</li>
</ul>

<h3 id = "plan">PLAN:</h3>
<ol>
<li>Add Spending Record through a command line <b>[Completed]</b></li>
<li>View Spending Record through the terminal <b>[Completed]</b>
<ul>
<li>Add Spending Record</li>
<li>Edit Spending Record</li>
<li>Delete Spending Record</li>
</ul>
</li>
<li>CSV to dB <b>[Completed]</b></li>
<li>Generate Webpage Reports <b>[ON PROGRESS]</b></li>
<li>Implement Web version of budget</li>
<ul><li>Add Spending Record</li><li>Edit Spending Record</li><li>Delete Spening Record</li></ul>
<li>Create Budget Graphs</li>
<li>Generate Monthly Budget PDFs</li>
<li>Create mobile app using REACT</li>
</ol>

<p><h3 id = "possible_features">Possible Features</h3></p>
<ul>
<li>Weekly Reports</li>
<li>Mobile Application</li>
<li>Detailed spending record such as keeping track where the item was bought</li>
<li>Support Different Currencies</li>
</ul>

<p><h3 id = "issues">Issues</h3></p>
<ul>
<li>Does not take in consideration of taxes</li>
</ul>

<h1 id = "documentation">DOCUMENTATION</h1>
<h3>PREREQUISITE</h3>
<ul>
<li><a href = "https://www.perl.org/">Perl</a> - Most Unix based Operating System should already have Perl installed.</li>
<li>PERL DBI</li>
<li>
<a href = "https://metacpan.org/pod/DBD::mysql::INSTALL">DBD::mysql</a><br>

On Debian, Ubuntu, and its derivatives:
<p>

```
sudo apt-get install libdbd-mysql-perl
```

</p>
</li>
</ul>
<h3>COMMAND</h3>
<ul>
<li>Add a spending record
<p>

```
usage: add_record.pl type_id item quantity unit_cost [total_amount] [file]
```

</p>
<p>Example: To record that you bought four chickens that costed $0.88 each you could write:</p>
<p>

```
$perl add_record.pl 1 Chicken 4 6 0.88 2017-02.csv
```

</p>
The file name is optional. If no filename is given, a file name will be automatically be generated or chosen based on the current month and year.
<p>

```
$perl add_record.pl 1 Chicken 4 6 0.88
```

</p>
</li>
</ul>

<h3>FILES</h3>
<ul>
<li><b>Record Files:</b> All files are to be CSV (Comma-Separated Values) files in the format:</li>

<b>File name format: YYYY-MM.csv</b><br>

```
type_id, item_name, quantity, unit_cost
```

or

```
type_id, item_name, quantity, unit_cost, total_cost
```

<li><b>Item Type: </b>Indicates what numerical value is assigned to each type of items such as 1 for groceries.</li>

<p><b>File name format: type.csv</b></p>

Example: </br>
<blockquote>    
1 Groceries </br> 
2 Resturants </br>
3 Tuition </br>
4 Rent </br> 
</blockquote>
</ul>
