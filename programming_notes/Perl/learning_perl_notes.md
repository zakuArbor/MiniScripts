# Learning Perl Notes

[TOC]

# Chapter 2 - Scalar Data

* Numbers or Strings
* can store scalar value in scalar variable
* often a number or a string

## NUMBERS

* in Perl, all numbers (int, double, floats, etc) are represented the same internally
* integer is equivalent to a float

### FLOATING POINT LITERAL

* a value represented in source code

* not computed nor result of Input/Output

  **Examples:**

  1

  1,25

  7.2e24

  -3.14e10

  61.298_040 #Perl allows '-' for readability

### NON-DECIMAL INTEGER LITERALS

* specify numbers not in base 10

  * **octal:** 0
  * **hexa:** 0x
  * **bin:** 0b

  **Examples:**

  0377 # octal for 255

  0xff # hexa for 255

  0b11111111 #binary for 255

### NUMERIC OPERATORS

**Operators:**

* +
* *
* -
* /
* ** #exponent

## STRINGS

* sequence of characters
* use utf8
  * allows unicode
* **Single Quote:** suppress strings so need to escape twice
  * **Example:** "\n" == '\\n'
* **Double Quote:**
  * \n, \r, \t
  * \f: skips to the start of the next page (form read)
  * \u, \U: uppercase next/all letters
  * "\x{2668}": is some unicode character
  * \E: to end \L, \U, or \Q

### String Operators

* **concat:** . #a dot

  * **Example:** "Hello" . " " . "World"

* **string repetition:** x

  **Example:** 

  * "x" x 3 # xxx

  * 5 x 3 # 555
  * 2 x 3.8 #222
    * 3.8 gets truncated to 3
  * "12fred34" * "3" # 36
    * "fred34" is truncated so you get 12 * 3 = 36
  * "fred" * 2 # 0

* **Leading 0:**

  * **Octal:** 0377' #octal to decimal: 255
  * **literal->decimal:**
    * '0377' #377 in decimal

* "Z" . 5 * 7 #"Z" . 35 = "Z35"

## Perl Built-In Warnings

* version 5.6 and later

  ```
  #!/usr/bin/perl
  use warnings;
  ```

  or turn on warnings in command line

  ```
  $ perl -w prog
  ```

  or turn on warnings in the script reference to the Perl binary

  ```
  #!/usr/bin/perl -w
  ```

* to get a more descriptive warning:

  ```
  #!/usr/bin/perl
  use diagnostics;
  ```

## Scalar Variables

* holds one value
* variable names can start with letters or underscores (not numbers)
  * can be if UTF is enabled
* denoted by a **sigil**: "$"
  * represents single item/value

## Binary Assignment Operator

**Example:**

```
$fred = $fred + 5;
```

is the same as 

```
$fred += 5;
```

* operator alters existing value of the variable rather than simply overwritting the value with some new expression

## Print

```
print "string";
print "string", 6*7, "\n";
```

## Interpolation of Scalar Variable Into Strings

when string literal, subjected to variable interpolation:

* any scalar variable name in the string is replaced with its current value

  **Examples:**

  ```
  $meal = 'rice';
  $ingredients = "pork & $meal";
  ```

* in situations where you want to have characters in between the substituted value, use **\${var_name}**

  **Examples:**

  ```
  $name = "Bob";
  print "${name}'s cat";
  ```

## Code Print

* create strings with characters that don't appear in your keyboard

  1. Use **chr**

     `$alpha = chr(hex('03b1'));`

  2. or use **ord**

     \$alpha = ord('$\alpha$');

## Comparison Operators

|            -             | NUMERIC | String |
| :----------------------: | :-----: | :----: |
|          equal           |   ==    |   eq   |
|        not equal         |   !=    |   ne   |
|        less than         |    <    |   lt   |
|       greater than       |    >    |   ht   |
|  less than or equal to   |   <=    |   le   |
| greater than or equal to |   \>=   |   ge   |

### Boolean

**False:** 0, '0', ''

## Getting User Input

**\<STDIN\>** 

* is line input operator

*  string balue typically has a newline character on the end of it

## Chomp Operator

**chomp(\$var)**

* removes trailing newline

```
chomp($text = <STDIN>);
```

is the same as

```
$text = <STDIN>;
chomp($text);
```

* returns the number of characters removed

## UNDEF

* is a scalar value
* acts as 0 (during numeric operation)
* or as a empty string (during string operation)
* value of variable before assinging a value
* many operation returns undef when arguments are out of range or does not make sense

# Chapter 3 - Lists & Arrays

* can hold more than one value

* **List:** an ordered collection of scalars

* **Arrays:** a variable that contains a list

* List is data & array is the variable that stores the data

* a list does not necessarily store an array but every array holds a ist

* can hold a mixture of scalar values

  `array[2.71828]` is the same as `array[2]`, it auto truncates (**no rounding**)

* `$#` array returns the last element index

  `print $array[$#array]; #prints the last element in the array`

* `$array[-1]` returns the last element of the array

  * negative array indicies count from the end

## List Literals

```
(1, 2, 3)
("pika", 4.5)
()
(1 .. 100) #populates the list with 100 integers
```

### Range Operator

`(1 .. 5) = (1, 2, 3, 4, 5)`

### qw

* is list of quoted words or a list quoted by whitespace

  `("fred", "barney", "betty")` is equivalent to `qw(fred barney betty)`

* to change the delimiter:

  ```
  qw!data1 data2 data3!
  qw#data1 data2 data3#
  qw/data1 data2 data3/
  qw!yahoo\! google\!! #need to escape to not terminate qw
  ```

## List Assignments

```
($fred, $barney, $dino) = (1, 2, 3)
@big_array = (@small_array, 1, 2, 3);
```

* to swap values: `($array[0], $array[1]) = ($array[1], $array[-])`

* if there's too many extra values, they get ignored

  ```
  ($pika) = qw< 1 2 3>; #values 2 and 3 are ignored
  ```

### Copying an Array

```
@array_copy = @array;
```

## POP & PUSH

* **POP:** takes last element off an aray & returns it

  ```
  pop(@array);
  $val = pop(@array); #note: parenthesis are optional
  ```

* **PUSH:** pushes a value to the end of the array

  ```
  push(@array, 0);
  push(@array, 1 .. 10);
  push(@array, @array2);
  ```

## SHIFT & UNSHIFT

* similar to pop & push but starts at the start of the array
* **shift** pops an element from the start of the array
* **unshift** pushes an element to the start of the array

```
@array = qw( 1 2 3);
unshift(@array, 0); #(0, 1, 2, 3)
shift(@array) #(1, 2, 3) - 0 is popped out
```

## Splice Operators

**splice(@array, start, [length], [@array_replace])**

**splice(@array, start_index, [number of elements to remove], [array values to replace with])**

* to remove elements in between the start & end of an array

```
@array = (1 .. 5);
@removed = splice(@array, 2); #3 is removed
#index 2 means element3, recall that index starts from 0
@array = (1..5);
@removed = splice(@aray, 1, 2); #(2, 3)
#1 is the start and 2 IS THE LENGTH, NOT THE END
```

* replacement if **length** is set to 0

```
@array = (1..5);
splice(@array, 1, 0, ( 6 ) ); #(1, 6, 2, 3, 4, 5)
```

* great for Linked Lists

## Interpolating Arrays Into Structures

* Perl expands arrays & auto adds space between elements

```
@rocks = qw{flint slate, gravel};
print "quartz @rocks limestone\n";
```

**PROBLEM:**

```
$email = "abc@gmail.com"; #WRONG
```

How can you tell if **@gmail** is an array or not?

The correct way is:

```
$email = 'abc@gmail.com';
$email = "abx\@gamil.com";
```

* when array & scalar have the same name

```
@array = qw (1 2 3);
$array = "hello";
print ""$array[2]"; #3
print "${array}[2]"; #hello[2]
print $array . "[2]"; #hello[2]
print "$array\[2]"; #hello[2]
```

## FOREACH

* steps through a list of values, executing one interation for each value

```
foreach $elem (@array) {
	print $elem;
}
```

* value if $elem after loops termiante is undef or what it was previously before the loop ran

``` 
$elem = "pika";
foreach $elem (@array) {
	print $elem;
}
print $elem; #pika
```

## Default Variable: $_

* if you omit control variable in loop, $_ is used

```
foreach (1 .. 10) {
	print $_;
}
```

## Reverse Order of a List

`reverse(@array);`

## Sort

* The default ordering is:
  * capital letters before lowercase
  * numbers before letters & punctuations

```
sort 97 .. 102; #100, 101, 102, 97, 98, 99
```

**Does not sorts numbers very well**

## Each Operator

* use on hashes or array
* each on an array returns: (index, value) pair
  1. index of the value
  2. value

```
use 5.012;
my @array = (1 .. 10);
while (my($index, $value) = each @array) {
	say "$index : $value";
}
```

is equivalent to

```
foreach $index (0 .. $#array) {
	print "index : $array[$index]";
}
```

# Chapter 4 - SUBROUTINES

* user defined functions

```
sub <func-name> {
	...
}
```

* subroutines are globally defined: defined anywhere in the file

## Invoking a Subroutine (Calling a function)

`&func`

* invoke by calling the function with a preceding `&`

### Omitting Ampersand

* **situations where no ampersand is required:** if compiler sees subroutine definition before invocation or if Perl can tell from syntax that it's a subroutine (built-in function)
* if your function/subroutine has same name as a built-in function, you need an `&` to call your function rather than the built-in function
* Good practice is to use `&` before all functions that are not built-in (any functions you wrote) or prototype to tell Perl about parameters to expect if subroutine are in modules

## Return Value of Subroutines

* all subroutines have return values
* not all return values are useful
* the **last** results from a **calculation performed** in the subroutine is the return value

```
sub add {
	1+2*3; #7 is the return value
}
```

```
sub print_f {
	1 * 2;
	print "Hello"; #returns 1 to represent the print statement was successful
}
```

### Return Operator

```
sub add {
	...
	return $var;
}
```



## Arguments

* to send a list of arguments: `&func(arg1, arg2, arg3, ...)`;
* Perl passes the list to subroutine
* stored in a special array: `@_`
  * $1^{st}$ parameter: `$_[0]`
  * $2^{nd}$ parameter: `$_[1]`
* `@_` is a private variable to the subroutine
* **NOTE:** variables in Perl are global by default

## Private Variable

* referred as **lexical variables**
* use `my` operator to declare variables as lexical

```
my $x;
```

* variables are private (scoped) to the enclosing block

## Give Parameters More Meaning

```
sub max {
	my ($m, $n);
	($m, $n) = @_;
	if ($m > $n) {$m}
	else {$n}
}
```

* easier to remember \$m, \$n then \$\_[0] and \$\_[1]

## Variable Length Parameters

* Perl is flexible so it does not check or need predefined number of parameters
* could check length of parameters:

```
if (@ != 2)
```

* or write subroutines that can adapt to any number of parameters

## Lexical (my) Variables

* can be used in any block
  * not limited to a subroutine block

```
foreach (1 .. 10) {
	my ($square) = $_ * $_; #private variable in loop
}
```

* if a lexical variable is declared in main, it's private within the file
* Best practice is to limit scope of the variable to a page of code or to a few lines of code
  * speeds up development and testing cycle
* `my` declares only a single lexical variable

```
my $fred, $barney #this is INCORRECT
my ($fred, $barney); #this is CORRECT
```

```
foreach my $elem (@array) {
	...
}
```

## Strict Pragma

* Perl is very permissive (flexible & loose) language
* to impose restrictions/discipline, `use strict`
* a pragma is a hint to compiler, telling something about the code
* strict pargma tells the internal compiler that it should enforce some good programming rules

## Persistent Private Variables

* private variable in subroutine gets undefined after subroutine end
* with states, you can still have private variable scoped to subroutine and keep their values between calls

**WRONG**

```
sub marine {
	$n += 1; #Global version of $n - WRONG
}
```

**CORRECT**

```
use 5.010;
sub marine {
	state $n = 0;
	$n+=1;
}
```

once `$n` is defined & initialized using `state`, Perl ignores all subsequent calls to initialize the variable & returns value of `$n` for the next call to the function

# Chapter 5 - Input and Output

## \<STDIN\> Operator

* return **UNDEF** if **EOF** 

```
while (defined($line = <STDIN>)) {
	print $line;
}
```

is EQUIVALENT TO

```
while (<STDIN>) {
	print $_;
}
```

## WHILE v.s FOREACH

* `while(<STDIN>)` processes each line by line
* `foreach(<STDIN>)` takes `<STDIN>` in a list context => required to read all lines before processing each line
  * more inefficient because as files increase, foreach loop takes longer

## INPUT FROM DIAMON OPERATOR (<>)

* another way to read input
* useful for making programs work like standard UNIX utilities (i.e. cat, sed, awk, sort, grep, etc)

```
while (<>) {
	chomp($line);
}
```

### Invocation Arguments

* **commandline arguments:** words on terminal after name of program

```
./prog word1 word2
```

* in typical standard Unix utilities, arguments are files that should be process for Input/Output utilities

* if there are no commandline arguments or an argument as a hypen (`-`), it means read from STDIN

```
./prog file1 - file2
```

the example above means read file1, from STDIN, and then file2

* `<>` operator does not literally look at the invocation arguments
  * looks at `@ARGV` array instead
* **`@ARGV`:** special array that is loaded with a list of invocation arguments

## OUTPUT TO STDOUT

```
print @array;	#print a list of items with no space between them
print "@array";	#print a string containing an interpolated array, separated by spaces
```

**NOTE:** elements may be unchomped and contain characters that change the way elements are displayed such as `\n, \r, \t`

## Buffered

* instead of sending out every little bit of output at once, saves the output till there's enough to bother with
* want to save output to disk, output will go into a buffer that is flushed (written to disk) only when the buffer gets full, or when the output is otherwise finished

```
print <>; 		#Perl Implementation of cat
print sort <>;	#Perl Implementation of sort
```

these examples above will be buffered till EOF (crtl-D)

### Interesting Return Value of Print Due to Format

```
print (2+3) * 4; #prints out 5 & not 20
```

The return value for the example above is 4 because it returns `1*4`

## PRINTF

* similar to C, you can format output

```
printf "Hello %s, your password expires in %d days", $user, $days_remaining
```

* `%g`: auto choose a number format (float, int, scientific notation, etc)

```
printf "%d", 17.85; #17, truncates .85
```

* leading spaces in `printf` are represented by `%<NUM><format specifier`
  * a positive number means pad space to be beginning of the string
  * a negative number means pad spaces to the end of the string

```
#imagine _ is a space
printf "%6d", 42; #____42
printf "%-6d", 42; #42____
```

* to print `%`, need to write `%%`

## FILEHANDLES

* STDIN, STOUD, STDERR are automatically open to files or devices established by program's parent process
* Filehandles are recommended to be uppercase unless you want to store them as a scalar variable to pass to subroutines, then append the filehandle with `_fh`
* **6 Special Filehandles:**
  1. STDIN
  2. STOUT
  3. STDERR
  4. DATA
  5. ARGV
  6. ARGVOUT

```
my $success = open LOG '>>' 'logfile';
if (!success) {
	#fail to open
}
close LOG;
```

### die

* terminates the program with a supplied message
* auto appends Perl Program name and line numbers to the end of msg

```
if (! open LOG, '>>', 'logfile') {
	die "Cannot create logfile: $!"; # $! system error number
}
```

### EXIT STATUS

**0:** success

**1:** system error in command arguments

**2:** processing errors

**3:** configuration file cannot be found

### Warning Message

* `warn` is similar to die where it specifies program & line number in the message except it does not terminate the program

### Using Filenames

 ```
if (! open PASSWD '/etc/passwd') {
	die "How did you login? ($!)";
}
while (<PASSWD>) {
	chomp;
	...
}
 ```

### Write or Append

* specify which FILEHANDLE to directly output to

```
print LOG "some log msg\n";
printf(STDERR, "Error Message:\n");
```

### SELECT Operator to Change Default Output

* `select <FILEHANDLE>` will redirect STDOUT to `<FILENAME>`

```
select BEDROCK;
print "some output ot BEDROCK instead of STDOUT";
```

### FLUSH BUFFER ALL THE TIME

* By default, output is buffered, to always buffer, set `$| = 1`

### Redirect STDERR to an Error Log

```
if (! open STDERR, ">>/home/user/error.log") {
	die "...";
}
```

# Hashes

* a data structure can hold any number of values & retreive them at will
* lookup hash values by name (different from arrays where it indexes value by number)
* indicies (keys) aren't numbers but instead are arbitrary, unique strings
* hash has no orders
* a collection of key-pair value
* keys & value are scalars
  * keys are always converted to strings
  * this is a neat feature because hash allows you to have a set of date related to another set of data

## Hash Element Access

```
$hash{$key} = 'Pika'; #assign
$hash{$key}; #access
```

* to refer to hash as a whole, use `%` as prefix

```
%hash = ('var1', 2, 'val3', 4); #list context assignment
```

* value of hash (in a list context) is a list of key-value pairs

```
@array = %hash; #unwinding the hash, order may differ the original list, each key stick witht its corresponding value
```

## Hash Assignment

```
my %new_hash = %old_hash; #does not copy memory location but unwinds hash & assign to new hash
```

* To reverse key-value pair to value-key pair
  * only works if value is unique
  * if not unique, last value assigned is the value for a duplicate key

```
reverse %hash;
```

## Big Arrow

```
my %last_name = (
	'fred' => 'flintstone',
	'john' => 'smith'
);
```

* quotes is optional but suggested to avoid string operators and special characters from creating an error

## Retrieve all the keys or values in the hash

**`keys %hash`** - returns all the keys in the hash

**`values %hash`** - returns all the values in the hash

```
my @keys = keys %hash;
my @val = values %hash;
```

**SIDENOTE:** `if (%hash)` will evalute to be true if there exists at least one key-value pair

## Each Function

```
while ( ($key, $value) = each %hash) {
	print "$key => $value\n";
}
```

## Check If a Key Exists In a Hash

`exists $hash{"key"}`

## Remove Key

`delete $hash{$key}`

## %ENV

* the environment hash

`%ENV{PATH}`

* to set the environment variable in the shell

```
CHARACTER=Pikachu; export CHARACTER;
```

or

```
export CHARACTER=Pikachu
```

# Chatper 7 - Regular Expressions



