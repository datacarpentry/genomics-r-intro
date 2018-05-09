---
title: "R Basics continued - factors and data frames"
teaching: 60
exercises: 20
questions:
- "How do I get started with tabular data (e.g. spreadsheets) in R?"
- "What are some best practices for reading data into R?"
- "How do I save tabular data generated in R?"
objectives:
- "Be able to load a tabular dataset using base R functions"
- "Explain the basic principle of tidy datasets"
- "Be able to determine the structure of a data frame including its dimensions
  and the datatypes of variables"
- "Be able to retrieve (index) a data frame"
- "Understand how how R may converse data into different modes"
- "Be able to convert the mode of an object"
- "Understand that R uses factors to store and manipulate catagorical data"
- "Be able to manipulate a factor, including indexing and reordering"
- "Be able to apply an arithmetic function to a dataframe"
- "Be able to coerce the class of an object (including variables in a dataframe)"
- "Be able to save a dataframe as a delimited file"
keypoints:
- "It is easy to import data into R from tabular formats including Excel.
  However, you still need to check that R has imported and interprited your
  data correctly"
- "There are best practices for organizing your data (keeping it tidy) and R
  is great for this"
- "Base R has many useful functions for manipulating your data, but all of R's
  capabilities are greatly enhanced by software packages developed by the
  community"
---

## Working with spreadsheets (tabular data)
A substantial amount of the data we work with in genomics will be tabular data,
this is data arranged in rows and columns - also known as spreadsheets. We could
write a whole lesson on how to work with spreadsheets effectively ([actually we did](http://www.datacarpentry.org/spreadsheet-ecology-lesson/)). For our
purposes, we want to remind you of a few principles before we work with our
first set of example data:

**1) Keep raw data separate from analyzed data**
This is principle number one because if you can't tell what data is the
original form, you risk making some serious mistakes.

**2) Keep speadsheet data Tidy**
The simplest principle of **Tidy data** is that we we have one row in our
spreadsheet for each observation or sample, and one colum for every variable
that we measure or report on. As simple as this sounds, its very easily
violated, and most data scintists agree that most of their time is spent
tidying their data for analysis. Read more about data organization in
[our lesson](http://www.datacarpentry.org/spreadsheet-ecology-lesson/) and in [this paper](https://www.jstatsoft.org/article/view/v059i10).

**3) Trust but verify**
Finally, while you don't need to be paranoid about data, you should have a plan
for how you will prepare it for analysis. **This is the focus of this lesson.**
You probably already have a lot of intuition, expectations, assumptions about
your data - the range of values you expect, how many values should have
been recorded, etc. Of course, as the data get larger, our human ability to
keep track will start to fail (and yes, it can fail for small data sets too).
R will help you to examine your data so that you can have greater confidence
in your analysis, and its reproducibility.





## Creating objects in R

> ## Reminder
> At this point you should writing following along in the "**genomics_r_basics.R**"
> script we created in the last episode. Writing you commands in the script
> will make it easier to record what you did and why.
>
{: .prereq}

What might be called a variable in many language is properly called an **object**
in R. To create your object you need a name (e.g. 'a'), and a value (e.g. '1').
Using the R assignment operator '<-''. In your script, "**genomics_r_basics.R**"
write a comment (using the '#') sign, and assign '1' to the object 'a' as shown
below:

> ~~~
> # this line creates the object 'a' and assigns it the value '1'
>
> a <- 1
> ~~~
{: .language-r}

Be sure to execute this line of code in your script. You can run a line of code
by hitting the <KBD>Run</KBD> button that is just above the first line of your
script in the header of the Source pane or you can use the appropriate shortcut:
  - Windows execution shortcut: <KBD>Ctrl</KBD>+<KBD>Enter</KBD>
  - Mac execution shortcut: <KBD>Cmd(⌘)</KBD>+<KBD>Enter</KBD>
to run multiple lines of code, you can highlight all the line you wish to run
and then hit <KBD>Run</KBD> or use the shortcut key combo.

You should notice the following outputs; in the RStudio 'Console' you should see:

> ~~~
> # this line creates the object 'a' and assigns it the value '1'
>
> a <- 1
> ~~~
{: .output}

The 'Console' will display lines of code run from a script and any outputs or
status/warning/error messages (usually in red).

You should also notice that in the 'Environment' window you get a table:

|Values||
|------|-|
|a|1|

The 'Environment' window allows you to easily keep track of the objects you have
created in R.

> ## Exercise: Create some objects in R
> Create the following objects in R, give each object an appropriate name.
>
> 1. Create an object that has the value of number of pairs of human chromosomes
> 2. Create an object that has a value of your favorite gene name
> 3. Create an object that value of this URL: "ftp://ftp.ensemblgenomes.org/pub/bacteria/release-39/fasta/bacteria_5_collection/escherichia_coli_b_str_rel606/"
> 4. Create and object that has the value of the number of chromosomes in a diplod cell
>
>> ## solution
>> Here as some possible answers to the challenge:
>> 1. human_chr_number <- 23
>> 2. gene_name <- 'pten'
>> 3. ensemble_url <- 'ftp://ftp.ensemblgenomes.org/pub/bacteria/release-39/fasta/bacteria_5_collection/escherichia_coli_b_str_rel606/'
>> 4. human_diploid_chr_num <-  2 * human_chr_number
>>
> {: .solution}
{: .challenge}

## Naming objects in R

Here are some important details about naming objects in R.

- **Avoid spaces and special characters**: Object cannot contain spaces. Typically
  you can use '-' or '_' to provide separation. You should avoid using special
  characters in your object name (e.g. ! @ # . , etc.). Also, names cannot begin with
  a number.
- **Use short, easy-to-understand names**: You should avoid naming your objects
  using single letters (e.g. 'n', 'p', etc.). This is mostly to encourage you
  to use names that would make sense to anyone reading your code (a colleague,
  or even yourself a year from now). Also, avoiding really long names will make
  your code more readable.
- **Avoid commonly used names**: There are several names that may alread have a
  definition in the R language (e.g. 'mean', 'min', 'max'). One clue that a name
  already has meaning is that if you start typing a name in RStudio and either
  pause your typing or hit the <KBD>Tab</KBD> key and RStudio gives you a
  suggested autocompletion or help message you have choosen a name that has a
  prior meaning.
- **Use the recommended assignment operator**: In R, we use '<- '' as the
  prefered assignment operator. '=' works too, but is most comonly used in
  passing arguments to functions (more on functions later). There is a shortcut
  for the R assignment operator:
  - Windows execution shortcut: <KBD>Alt</KBD>+<KBD>-</KBD>
  - Mac execution shortcut: <KBD>Option</KBD>+<KBD>-</KBD>


There are a few more suggestions about naming and style you may want to learn
more about as you write more R code. There are several "style guides" that
have advice, and one to start with is the [tidyverse R style guide](http://style.tidyverse.org/index.html).

>## Tip: Pay attention to warnings in the script console
>
> If you enter a line of code in your R that contains some error, RStudio
> may give you hint with an error indication and an underline of this mistake.
> Sometimes these messages are easy to understand, but often the message may
> need some figuring out. In any case paying attention to these warnings help
> you avoid mistakes. In this case, our object name has a space, which is not
> allowed in R. Notice the error message does not say this directly, but
> essentially R is "not sure" about to to assign the name to "human_ chr_number"
> when the object name we want is "human_chr_number".
>
> <img src="../assets/img/rstudio_script_warning.png" alt="rstudio script warning" style="width: 600px;"/>
>
 {: .callout}

## Reassigning object names or deleting objects

Once an object has a value, you can change that value by overwriting it. R will
not complain about overwriting objects, which may or may not be a good thing
depending on how you look at it.

> ~~~
> # gene_name has the value 'pten' or whatever value you used in the challenge. We will now assign the new value 'tp53'
>
> gene_name <- 'tp53'
> ~~~
{: .language-r}

You can also remove an object from R's memory entirely. The `rm()` function
will delete the object.

> ~~~
> # delete the object 'gene_name'
>
> rm(gene_name)
> ~~~
{: .language-r}

If you run a line of code that just has an object name, R will normally display
the contents of that object. In this case, we are told the object is no
longer defined.

> ~~~
> Error: object 'gene_name' not found
> ~~~
{: .error}

## Understaning object data types (modes)

One very important thing to know about an object is that every object has two
properties, "length" and "mode". We will get to the "length" property later in
the lesson. The **"mode" property corresponds to the type of data an object**
**represents**. The most common modes you will encounter in R are:

|Mode (abbreviation)|Type of data|
|----|------------|
|Numeric (num)| Numbers such integers (e.g. 1, 892, 1.3e+10) and floating pont/decimals (0.5, 3.14)|
|Character (chr)|A sequence of letters/numbers in single '' or double " " quotes|
|Logical| Boolean values - TRUE or FALSE|

There are a few other modes (double", "complex", "raw" etc.) but for now, these
three are the most important. Data types are familiar in many programming
languages, but also in natural language where we refer to them as the
parts of speech, e.g. nouns, verbs, adverbs, etc. One you know if a word -
perhaps an unfamilar one - is a noun, you can probbaly guess you can count it
and make it plural if there is more than one (e.g. 1 Tuatara, or 2 Tuataras).
If something is a adjective, you can usually change it into an adverb by
adding "-ly" (e.g. jejune vs. jejunely). Depending on the context, you may need
to decide if a word is in one category or another (e.g "cut" may be a noun when
its on your finger, or a verb when you are preparing vegetables). These examples
have important analogies when working with R objects.

> ## Exercise: Create objects and check their modes
> Create the following objects in R, then use the `mode()` function to verify
> their modes. Try to guess what the mode will be before you look at the solution
>
> 1. chromosome_name <- 'chr02'
> 2. od_600_value <- 0.47
> 3. chr_position <- '1001701'
> 4. spock <- TRUE
> 5. pilot <- Earhart
>
>> ## solution
>>
>> 1. mode(chromosome_name)    # "character"
>> 2. mode(od_600_value)     # "numeric"
>> 3. mode(chr_position)     # "character"
>> 4. mode(spock)       # "logical"
>> 5. pilot     # Error: object 'Earhart' not found
> {: .solution}
{: .challenge}

Notice from the solution that even if a series of numbers are given as a value
R will consider them to be in the "character" mode if they are enclosed as
single or double quotes. Also notice that you cannot take a string of alphanumeric
character (e.g. Earhart) and assign as a value for an object. In this case,
R looks for the object `Earhart` but since there is no object, no assignment can
be made. If `Earhart` did exist, then the mode of `pilot` would be whatever
the mode of `Earthrt` was originally.

## Mathematical and functional operations on objects

Once an object exsits (which by definition also means it has a mode), R can
appropriately manipulate that object. For example, objects of the numeric modes
can be added, multiplied, divided, etc. R provides several mathematical
(arithmetic) operators incuding:

|Operator|Description|
|--------|-----------|
|+|addition|
|-|subtraction|
|*|multiplication|
|/|division|
|^ or **|exponentiation|
|a%%b|modulus|

These can be used with literal numbers:

> ~~~
>  (1 + (5 ** 0.5))/2
> ~~~
{: .language-r}

> ~~~
> [1] 1.618034
> ~~~
{: .output}

and importantly, can be used on any object that evaluates to (i.e. iterprited
by R) a numeric object:


> ~~~
> # multiply the object 'human_chr_number' by 2
>
> human_chr_number * 2
> ~~~
{: .language-r}

returns the result:

> ~~~
> [1] 46
> ~~~
{: .output}

Finally, it is useful to know that several other types of mathematical
operations have their own associated functions. While there are too many to
list, you can always search the online documentation in R for a function (
even if you don't know what it may be called in R). For example:

> ~~~
> # search for functions associated with chi squared
>
> ?? chisquared
> ~~~
{: .language-r}

Will open search results in your help tab. Of course, using Google will help
here too.

> ## Exercise: Compute the golden ratio
> One appoximation of the golen ratio (φ) can be found by taking the sum of 1
> and the square root of 5, and dividing by 2 as in the example above. Compute
> the golden ratio to 3 digits of precision using the `sqrt()` and `round()`
> functions. Hint: remember the `round()` function can take 2 arguments.
>
>> ## solution
>>
>> round((1 + sqrt(5))/2, digits=3)
>>
>> [1] 1.618
>>
>> * Notice that you can place one function inside of another.
> {: .solution}
{: .challenge}


## Vectors

With a solid understanding of the most basic objects, we come to probably the
most used objects in R, vectors. A vector can be though of as a collection of
values (numbers, characters, etc.). Vectors also have a mode (data type), so
all of the contents of a vctor must be of the same mode. One of the most common
way to create a vector is to use the `c()` function - the "concatanate" or
"combine" function. Inside the function you may enter one or more values; for
multiple values, seperate each value with a comma:

> ~~~
> # Create the SNP gene name vector
>
> snp_genes <- c("OXTR", "ACTN3", "AR", "OPRM1")
> ~~~
{: .language-r}

Two important properties of vectors are their **mode** and their **length**.
You can check these with the `mode()` and `length()` function respectively.
Another useful function that gives both of these pieces of information is the
`str()` (structure) function. Importantly, **items within a vector must all
be of the same mode/ data type**. This is because a vector can have only one
mode. More on this later.

> ~~~
> # Check the mode, length, and structure of 'gene_names'
>
> mode(gene_names)
> length(gene_names)
> str(gene_names)
> ~~~
{: .language-r}

returns:

> ~~~
> [1] "character"
> [1] 4
> chr [1:4] "OXTR" "ACTN3" "AR" "OPRM1"
> ~~~
{: .output}

Vectors are quite important in R, mostly for us because data frames are
essentially collections of vectors (more on this later). What we learn about
manipulating vectors now will pay of even more when we get to data frames.

## More on creating and indexing vectors

Let's create a few more vectors to play around with:

> ~~~
> # some interesting human SNPs
> # while accuracy is important, typos in the data won't hurt you here
>
> snps <- c('rs53576', 'rs1815739', 'rs6152', 'rs1799971')
> snp_chromosomes <- c('3', '11', 'X', '6')
> snp_positions <- c(8762685, 66560624, 67545785, 154039662)
> ~~~
{: .language-r}

Once we have vectors, one thing we may want to do is specifically retrieve one
or more values from our vector. To do so we use **bracket notation**. We type
the name of the vector followed by square brackets. In those square brackets
we place the index (e.g. a number) in that bracket as follows:

> ~~~
> # get the 3rd value in the snp_genes vector
>
> snp_genes[3]
> ~~~
{: .language-r}
> ~~~
> [1] "AR"
> ~~~
{: .output}

In R, every item your vector is indexed, starting from the first item (1)
through to the final number of items in your vector. You can also retrieve a
range of numbers:

> ~~~
> # get the 1st through 3rd value in the snp_genes vector
>
> snp_genes[1:3]
> ~~~
{: .language-r}
> ~~~
> [1] "OXTR" "ACTN3" "AR"
> ~~~
{: .output}

If you want to to retreive several (but not necessarily sequential) items from
a vector, you pass a **vector of indicies**; a vector that has the numbered
positions you wish to retrieve.

> ~~~
> # get the 1st, 3rd, and 4th value in the snp_genes vector
>
> snp_genes[c(1, 3, 4)]
> ~~~
{: .language-r}
> ~~~
> [1] "OXTR" "AR" "OPRM1"
> ~~~
{: .output}

There are additional (and perhaps less commonly used) ways of indexing a vector
(see [these examples](https://thomasleeper.com/Rcourse/Tutorials/vectorindexing.html)).
Also, several of these indexing expressions can be combined:

> ~~~
> # get the 1st through the 3rd value, and 4th value in the snp_genes vector
> # yes, this is a little silly in a vector of only 4 values.
>
> snp_genes[c(1:3,4)]
> ~~~
{: .language-r}
> ~~~
> [1] "OXTR" "ACTN3" "AR" "OPRM1"
> ~~~

## Adding to, removing, or replacing values in existing vectors

Once you have an existing vector, you may want to add a new item to it. To do
so, you can use the `c()` function again to add your new value:

> ~~~
> # add the gene 'CYP1A1' and 'APOA5' to our list of snp genes
> # this overwrites our existing vector
>
> snp_genes <- c(snp_genes, "CYP1A1", "APOA5")
> ~~~
{: .language-r}

We can of course verify that "snp_genes" contains the new gene entry

> ~~~
> snp_genes
> ~~~
{: .language-r}
> ~~~
> [1] "OXTR" "ACTN3" "AR" "OPRM1" "CYP1A1" "APOA5"
> ~~~
{: .output}

Using a negative index will return a version a vector with that index's
value removed:

> ~~~
> snp_genes[-6]
> ~~~
{: .language-r}
> ~~~
> [1] "OXTR" "ACTN3" "AR" "OPRM1" "CYP1A1" "APOA5"
> ~~~
{: .output}


We can remove that value from our vector by overwriting it with this expression:
> ~~~
> snp_genes <- snp_genes[-6]
> snp_genes
> ~~~
{: .language-r}
> ~~~
> [1] "OXTR" "ACTN3" "AR" "OPRM1" "CYP1A1"
> ~~~
{: .output}

We can also explicitly rename or add a value to our index using double bracket
notation:

> ~~~
> snp_genes[[7]]<- "APOA5"
> snp_genes
> ~~~
{: .language-r}
> ~~~
> [1] "OXTR" "ACTN3" "AR" "OPRM1" "CYP1A1" NA "APOA5"
> ~~~
{: .output}

Notice in the operation above that R inserts an `NA` value to extend our vector
so that the gene "APOA5" is an index 7. This may be a good or not so good thing
depending on how you use this.

> ## Exercise: Examining and indexing vectors
> Answer the following questions to test your knowledge vectors
>
> Which of the following is true of vectors in R
>
> A) All vectors have a mode or a length
>
> B) All vector have a mode and a length
>
> C) Vectors may have different lengths
>
> D) Items within a vector may be of different modes
>
> E) You can use the `c()` to one or more items to an existing vector
>
> F) You can use the `c()` to add a vector to an exiting vector
>>
>> ## solution
>> A) False - Vectors have both of these properties
>>
>> B) True
>>
>> C) True
>>
>> D) False - Vectors have only one mode (e.g. numeric, character); all items in
>> a vector must be of this mode.
>>
>> E) True
>>
>> F) True
>>
> {: .solution}
{: .challenge}


## Logical Indexing

There is one last set of cool indexing capabilities we want to introduce. It is
possible within R to retrieve items in a vector based on a logical evaluation
or numerical comparison. For example, let's say we wanted get all of the SNPs
in our vector of SNP positons that were greater than 100,000,000. We could
index using the '>' (greater than) logical operator:

> ~~~
> snp_positions[snp_positions > 100000000]
> ~~~
{: .language-r}
> ~~~
> [1] 154039662
> ~~~
{: .output}

As demonstrated above, in the square brackets you place the name of the vector
followed by the comparison operator and (in this numeric case) a numeric value.
Some of the most common logical operators you will use in R are:

|Operator|Description|
|--------|-----------|
|<|less than|
|<=|less than or equal to|
|>|greater than|
|>=|greater than or equal to|
|==|exactly equal to|
|!=|not equal to|
|!x|not x|
|a \| b| a or b|
|a & b| a and b|

> ## The magic of programming
>
>The reason why the expression `snp_positions[snp_positions > 100000000]` works
>can be better understood if you examine what the expression "snp_positions > 100000000"
>evaluates to:
>
>> ~~~
>> snp_positions > 100000000
>> ~~~
>{: .language-r}
>> ~~~
>> [1] FALSE FALSE FALSE  TRUE
>> ~~~
>{: .output}
>
>The output above is a logical vector, the 4th element of which is TRUE. When
>you pass a logical vector as an index, R will return the true values:
>
>> ~~~
>> snp_positions[c(FALSE, FALSE, FALSE, TRUE)]
>> ~~~
>{: .language-r}
>> ~~~
>> [1] 154039662
>> ~~~
>{: .output}
>
>
>If you have never coded before, this type of situation starts to expose the
>"magic" of programming. We mentioned before that in the bracket indexing
>notation you take your named vector followed by brakets which contain an index:
>**named_vector[index]**. The "magic" is that the index needs to *evaluate to* a
>number. So, even if it does not appear to be an integer (e.g. 1, 2, 3), as long
>as R can evaluate it, we will get a result. That our expression
>`snp_positions[snp_positions > 100000000]` evaluates to a number can be seen
>in the following situtaion. If you wanted to know which **index** (1, 2, 3, or
>4) in our vector of SNP positions was the one that was greater than 100,000,000?
>We can use the `which()` function to return the indicies of any item that
>evaluates as TRUE in our comparison:
>> ~~~
>> which(snp_positions > 100000000)
>> ~~~
>{: .language-r}
>> ~~~
>> [1] 4
>> ~~~
>{: .output}
> **Why is this important?** Often in programming we will not know what inputs
> and values will be used when our code is executed. Rather than put in a
> pre-determined value (e.g 100000000) we can use an object that can take on
> whatever value we need. So for example:
>
>> ~~~
>> snp_marker_cutoff <- 100000000
>> snp_positions[snp_positions > snp_marker_cutoff]
>> ~~~
>{: .language-r}
>> ~~~
>> [1] 154039662
>> ~~~
>{: .output}
> Ultimately, it's putting together flexible, reusable code like this that gets
> at the "magic" of programming!
{: .callout}

## A few final vector tricks

Finally, there are a few other common retrieve or replace operations you may
want to know about. First, you can check to see if any of the values of your
vector is an NA value. Missing data will get a more detailed treatment later,
but the `is.NA()` function will return a logical vector, with TRUE for any NA
value:

> ~~~
> # current value of 'snp_genes': chr [1:7] "OXTR" "ACTN3" "AR" "OPRM1" "CYP1A1" NA "APOA5"
>
> is.na(snp_genes)
> ~~~
{: .language-r}
> ~~~
> [1] FALSE FALSE FALSE FALSE FALSE TRUE FALSE
> ~~~
{: .output}

Sometimes, you may wish to find out if a specific value (or several values) is
in a vector. You can do this using the comparison operator `%in%`, which will
return TRUE for any value in your collection of one or more values matches a
value in the vector you are searching:

> ~~~
> # current value of 'snp_genes': chr [1:7] "OXTR" "ACTN3" "AR" "OPRM1" "CYP1A1" NA "APOA5"
> # test to see if "ACTN3" or "APO5A" is in the snp_genes vector
> # if you are looking for more than one value, you must pass this as a vector
>
> c("ACTN3","APOA5") %in% snp_genes
> ~~~
{: .language-r}
> ~~~
> [1] TRUE TRUE
> ~~~
{: .output}

> ## Review: Creating and indexing vectors
> Use your knowledge of vectors to accomplish the following tasks:
>
> **1) What mode are the following vectors? Use `typeof()` to check**
>
>    a. `snps`
>
>    b. `snp_chromosomes`
>
>    c. `snp_positions`
>
> **2) Add the following values to the following vectors**
>
>    a. To the `snps` vector add: 'rs662799'
>
>    b. To the `snp_chromosomes` vector add: 11
>
>    c. To the `snp_positions` vector add: 	116792991
>
> **3) Make the following change to the `snp_genes` vector**
> Hint: Your vector should look like this in the 'Global Enviornment':
> `chr [1:7] "OXTR" "ACTN3" "AR" "OPRM1" "CYP1A1" NA "APOA5"`. If not
> recreate the vector by running this expression:
> `snp_genes <- c("OXTR", "ACTN3", "AR", "OPRM1", "CYP1A1", NA, "APOA5")`
>
>    a. Create a new version of `snp_genes` that does not contain CYP1A1
>
>    b. Add 2 NA values to the end of `snp_genes` (hint: final vector should
>    have a length of 8)
>
> **4) Create a new vector `combined` that contains:**
>
>    - The the 1st value in `snp_genes`
>
>    - The 1st value in `snps`
>
>    - The 1st value in `snp_chromosomes`
>
>    - The 1st value in `snp_positions`
>
>   **Check the mode of `combined` using `typeof()`
>
>> ## solution
>>
>> **1) What mode are the following vectors? Use `typeof()` to check**
>>
>>    a. `typeof(snps)` # "character"
>>
>>    b. `typeof(snp_chromosomes)` # "character"
>>
>>    c. `typeof(snp_positions)` # "double" - which is also a numeric type
>>
>>
>> **2) Add the following values to the following vectors**
>>
>>    a. `snps <- c(snps, 'rs662799')`
>>
>>    b. `snp_chromosomes <- c(snp_chromosomes, "11")` # did you use quotes?
>>
>>    c. `snp_positions <- c(snp_positions, 116792991)`
>>
>> **3) Make the following change to the `snp_genes` vector**
>>
>>    a. `snp_genes <- snp_genes[-5]` or `snp_genes <- snp_genes[c(1,2,3,4,6,7)]`, etc.
>>
>>    b. `snp_genes <- c(snp_genes, NA, NA)` or `snp_genes[[8]] <- NA`, etc.
>>
>>
>> **4) Create a new vector `combined` that contains:**
>>
>>    - The the 1st value in `snp_genes`
>>
>>    - The 1st value in `snps`
>>
>>    - The 1st value in `snp_chromosomes`
>>
>>    - The 1st value in `snp_positions`
>>
>>
>>    `combined <- c(snp_genes[1], snps[1], snp_chromosomes[1], snp_positions[1])`
>>
>>    `typeof(combined)`  # "character" - Do you know why this is?
>>
> {: .solution}
{: .challenge}

## Bonus material: Lists

Lists are quite useful in R, but we won't be using them in the genomics lessons.
That said, you may come across lists in the way that some bioinformatics
programs may store and/or return data to you. One of the key attributes of a list
is that unlike a vector, a list may contain data of more than one mode. Learn
more about creating and using lists using this [nice tutorial](http://r4ds.had.co.nz/lists.html).
In this one example, we will create a named list and show you how to retreive
items from the list.


> ~~~
> # Create a named list using the 'list' function and our SNP examples
> # Note, for easy reading we have place each item in the list on a separate line
> # Nothing special about this, you can do this for any multiline commands
> # To run this command, make sure the entire command (all 4 lines) are highlited
> # before running
>
>snp_data <- list(genes = snp_genes,
>                 refference_snp = snps,
>                 chromosome = snp_chromosomes,
>                 position = snp_positions)
>
> # Examine the structure of the list
>str(snp_data)
> ~~~
{: .language-r}
> ~~~
>List of 4
> $ genes         : chr [1:8] "OXTR" "ACTN3" "AR" "OPRM1" ...
> $ refference_snp: chr [1:5] "rs53576" "rs1815739" "rs6152" "rs1799971" ...
> $ chromosome    : chr [1:4] "3" "11" "X" "6"
> $ position      : num [1:4] 8.76e+06 6.66e+07 6.75e+07 1.54e+08
> ~~~
{: .output}

To get all of the values for the `position` object in the list we use the `$` notation:

> ~~~
> # return all the values of position object
>
> snp_data$position
> ~~~
{: .language-r}
> ~~~
> [1]   8762685 66560624 67545785 154039662
> ~~~
{: .output}

To get the first value in the `position` object, use `[]` notation to index:

> ~~~
> # return first value of the position object
>
> snp_data$position[1]
> ~~~
{: .language-r}
> ~~~
> [1]   8762685
> ~~~
{: .output}



---
