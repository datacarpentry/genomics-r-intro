---
title: "R Basics"
teaching: 60
exercises: 30
questions:
- "What will these lessons not cover?"
- "What are the basic features of the R language?"
- "What are the most common objects in R?"
- "How do I get started with tabular data (e.g. spreadsheets) in R?"
objectives:
- "Identify R skills not covered in these lessons and where to learn more"
- "Be able to create and appropriately name objects in R"
- "Be able to explain what a data types are, and know the common R data types
  (modes)"
- "Be able to do simple arithmetic of functional procedures on R objects"
- "Be able to reassign object values and delete objects"
- "Be able to create the most common R objects including vectors, factors,
  lists, and data frames"
- "Be able to retrieve (index), name, or replace, values from an object"
- "Be able to load a tabular dataset using base R functions"
- "Explain the basic principle of tidy datasets"
- "Be able to determine the structure of a data frame including its dimensions
  and the datatypes of variables"
- "Be able to retrieve (index) a data frame"
- "Be able to apply an arithmetic function to a dataframe"
- "Be able to coerce the class of an object (including variables in a dataframe)"
- "Be able to save a dataframe as a delimited file"
keypoints:
- "Effectively using R is a journey of months or years. Still you don't have to
  be an expert to use R and you can start using and analzying your data with
  with about a day's worth of training"
- "It is important to understand how data are organized by R in a given object
  type (e.g. vector, factor, data frame, etc.) how the mode of that type
  (e.g. numeric, character, logical, etc.) will determine how R will operate
  on that data, and what can happen when datatypes are coerced, misinterpreted,
  or misapplied"
- "Data wrangling - loading data, cleaning this data (e.g checking for outliers,
  handling missing values, sorting, filtering, etc.) is an important first step
  for working with data"
---

## "The fantastic world of R awaits you" OR "Nobody wants to learn how to use R"
Before we begin this lesson, we want you to be clear on the goal of the workshop
and these lessons. We believe that every learner can be **achieve competency
with R**. You have reached competency when you find that you are able to
**use R to handle common analysis challenges in a reasonable amount of time**
(which includes time needed to look at learning materials, search for answers
online, and ask colleagues for help). As you spend more time using R (there is
no substitute for regular use and practice) you will find yourself gaining
competency and even expertise. The more familiar you get, the more
complex the analyses you will be able to carry out, with less frustration, and
in less time - the "fantastic world of R" awaits you!

## What these lessons will not teach you
Nobody wants to learn how to use R. People want to learn how to use R to analyze
their own research questions! Ok, maybe some folks learn R for R's sake, but
these lessons assume that you want to start analyzing genomic data as soon as
possible. Given this, there are many valuable pieces of information about R
that we simply wont have time to cover. Hopefully we will clear the hurdle of
giving you just enough knowledge to be dangerous, which can be a high hurdle
in R! We uggest you look into additional the learning materials in the tip box
below.

**Here are some R skills we will *not* cover in these lessons**

- How to create and work with R matrices and R lists
- How to create and work with loops and conditional statements
- How to do basic string manipulations (e.g. finding patterns in text using grep)
- How to plot using the default R graphic tools (we *will* cover ggplot2)
- How to use the advanced R statistical functions

>## Tip: Where to learn more
> The following are good resources for learning more about R. Some of them
> can be quite technically, but if you are a regular R user you may ultimately
> need some of this technical knowledge.
> - [R for Beginners](https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf):
    By Emmanuel Paradis, great starting point
> - [The R Manuals](https://cran.r-project.org/manuals.html): Maintained by the
    R project
> - [R contributed documentation](https://cran.r-project.org/other-docs.html):
    Also linked to the R project; importantly there are materials available in
    several languages
> - [R for Data Science](http://r4ds.had.co.nz/): A wonderful collection by
    noted R educators and developers Garrett Grolemund and Hadley Wickham
> - [Practical Data Science for Stats](https://peerj.com/collections/50-practicaldatascistats/):
    Not exclusively about R usage, but a nice collection of pre-prints on data science
    and applications for R
> - [Programming in R Software Carpentry lesson](https://software-carpentry.org/lessons/):
    There are several Software Carpentry lessons in R to choose from
 {: .callout}

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
> gene_name <- 'tp53'
> ~~~
{: .language-r}

You can also remove an object from R's memory entirely. The `rm()` function
will delete the object.

> ~~~
> # delete the object 'gene_name'
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
>> 5. pilot     # Error -
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
appropriately manipulate that object. For example, objects in the numeric modes
are numbers which can be added, multiplied, divided, etc:





---
