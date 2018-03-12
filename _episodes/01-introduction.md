---
title: "Introducing R and RStudio IDE"
teaching: 30
exercises: 15
questions:
- "What is RStudio and why should I use it?"
- "What is the difference between R and RStudio?"
- "How do I get help using R?"
objectives:
- "Discuss advantages of analyzing data in R"
- "Discuss advantages of using RStudio"
- "Create an RStudio project, and discuss the benefits of working within a
   project"
- "Customize RStudio layout"
- "Able to locate and change the current working directory with `getwd()` and
  `setwd()`"
- "Compose an R script file with comments and saved commands"
- "Be able to define what an R function is"
- "Locate help for an R function using `?`, `??`, and `args()`"
- "Check the version of R"
- "Able to enter a command in the R console (at the terminal)"
- "List several websites for obtaining R software/packages"
- "Ask effective questions when searching for help on forums or using web
  searches"
- "Research an issue you are experiencing with a package installation on
  Stackoverflow"

keypoints:
- "First key point."
---

## Getting ready to use R for the first time
In this lesson we will take you through the very first things you need to get
R working, and conclude by showing you the most effective ways to get get help
when you are working with R on your own.

>## Tip: This lesson works best on the cloud
> Remember, these lessons assume we are using the pre-configured virtual machine
> instances provided to you at a genomics workshop. Much of this work could be
> done on your laptop, but we use instances to simplify workshop setup
> requirements, and to get you familiar with using the cloud (a common
> requirement for working with big data).
> Visit the [Genomics Workshop setup page](http://www.datacarpentry.org/genomics-workshop/setup/)
> for details on getting this instance running on your own, or for the info you
> need to do this on your own computer.
 {: .callout}


## A Breif History of R
[R](https://en.wikipedia.org/wiki/R_(programming_language)) has been around
since 1995, and was created by Ross Ihaka and Robert Gentleman at the University
of Auckland, New Zealand. It was based off the S programming language developed
at Bell Labs, and was developed to teach intro statistics. See this [slide deck](https://www.stat.auckland.ac.nz/~ihaka/downloads/Massey.pdf)
by Ross Ihaka for more info on the subject.

## Advantages of using R
At more than 20 years old, R is fairly mature and [growing in popularity](https://www.tiobe.com/tiobe-index/r/). However, programming isin't a poularity contest. Here are key advantages of
analzying data in R:

 - **R is [open source](https://en.wikipedia.org/wiki/Open-source_software)**. Of
   course this means R is free - which is an advantage if you end up at a
   institution where you would have to pay for your own MATLAB or SAS license.
   Open source, is important to your colleagues in parts of the world where
   expensive software in inaccessible. It also means that R is actively
   developed by a community (See [r-project.org](https://www.r-project.org/)),
   and there are regular updates.
 - **R is widely used**. Ok, maybe programming is a popularity contest. Because,
   R is used in many areas (not just bioinformatics), you are more likely to
   find help online when you need it. Chances are, almost any error message you
   run into, someone else has already experienced.
- **R is powerful**. R runs on multiple platforms (Windows/MacOS/Linux). It can
  work with much larger datasets than popular spreadsheet programs like
  Microsoft Excel, and because of its scripting capabilities is far more
  reproducible. Also there are thousads of available software packages for
  science, including genomics and other areas of life science.
