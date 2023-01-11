---
layout: page
title: Setup
root: .
---

# Overview

This workshop is designed to be run using RStudio Server on pre-imaged Amazon Web Services (AWS) instances. All of the software and data used in the workshop are hosted on an Amazon Machine Image (AMI). Please follow the instructions below to prepare your computer for the workshop:

- Option A (AWS)

  OR

- Option B (Local machine)

## Option A (Recommended): Using the lessons with Amazon Web Services (AWS)

If you are signed up to take a Genomics Data Carpentry workshop, you do not need to worry about setting up an AMI instance. The Carpentries staff will create an instance for you and this will be provided to you at no cost. This is true for both self-organized and centrally-organized workshops. Your Instructor will provide instructions for connecting to the AMI instance at the workshop.

If you would like to work through these lessons independently, outside of a workshop, you will need to start your own AMI instance. Follow [these instructions on creating an Amazon instance](https://datacarpentry.org/genomics-workshop/AMI-setup/). Use the AMI **ami-04b3bc83255f918b0** (Data Carpentry Genomics with R 4.0) listed on the Community AMIs page. Please note that you must set your location as N. Virginia in order to access this community AMI. You can change your location in the upper right corner of the main AWS menu bar. The cost of using this AMI for a few days, with the t2.medium instance type is very low (about USD $1.50 per user, per day). Data Carpentry has no control over AWS pricing structure and provides this cost estimate with no guarantees. Please read AWS documentation on pricing for up-to-date information.

If you're an Instructor or Maintainer or want to contribute to these lessons, please get in touch with us [team@carpentries.org](mailto:team@carpentries.org) and we will start instances for you.

## Option B: Using the lessons on your local machine

While not recommended, it is possible to work through the lessons on your local machine (i.e. without using AWS). To do this, you will need to install all of the software used in the workshop and obtain a copy of the dataset. Instructions for doing this are below.

### Data
The data used in this workshop is available on FigShare. You can download the necessary data used in this workshop by clicking [this download link](https://ndownloader.figshare.com/files/14632895). The file is 168.17 KB.

Clicking the download link will automatically download the file to your default download directory as a single spreadsheet (.csv) file.

Please read the FigShare page linked below for information about the data and access to the data files.
- [FigShare Data Carpentry Genomics Beta 2.0](https://figshare.com/articles/Data_Carpentry_Genomics_beta_2_0/7726454)


|Software|Install|Manual|Available on|
|--------|-------|------|------------|
|R|See instructions below|[link](https://www.r-project.org/)|Linux, MacOS, Windows|
|RStudio|[link](https://posit.co/download/rstudio-desktop/)|[link](https://docs.posit.co/ide/user/)|Linux, MacOS, Windows|


## R and RStudio

• R and RStudio are separate downloads and installations. R is the underlying statistical computing environment, but using R alone is no fun. RStudio is a graphical integrated development environment (IDE) that makes using R much easier and more interactive. You need to install R before you install RStudio. After installing both programs, you will need to install a specific R package within RStudio. Follow the instructions below for your operating system, and then follow the instructions for installing ggplot2. Additionally, we will also be using the dplyr package for R, although installation of this will be covered during the lesson.
