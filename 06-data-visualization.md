---
title: Data Visualization with ggplot2
teaching: 60
exercises: 30
source: Rmd
---

::::::::::::::::::::::::::::::::::::::: objectives

- Describe the role of data, aesthetics, and geoms in ggplot functions.
- Choose the correct aesthetics and alter the geom parameters for a scatter plot, histogram, or box plot.
- Layer multiple geometries in a single plot.
- Customize plot scales, titles, themes, and fonts.
- Apply a facet to a plot.
- Apply additional ggplot2-compatible plotting libraries.
- Save a ggplot to a file.
- List several resources for getting help with ggplot.
- List several resources for creating informative scientific plots.

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What is ggplot2?
- What is mapping, and what is aesthetics?
- What is the process of creating a publication-quality plots with ggplot in R?

::::::::::::::::::::::::::::::::::::::::::::::::::







## Introduction to **`ggplot2`**

<img src="https://ggplot2.tidyverse.org/logo.png" align="right" alt="Line plot enclosed in hexagon shape with ggplot2 typed beneath and www.rstudio.com at the bottom.">

**`ggplot2`** is a plotting package, part of the tidyverse,
that makes it simple to create complex plots from data in a data frame. It provides a more programmatic interface for specifying what variables to plot, how they are displayed, and general visual properties. Therefore, we only need minimal changes if the underlying data change or if we decide to change from a bar plot to a scatter plot. This helps in creating publication-quality plots with minimal amounts of adjustments and tweaking.

The **gg** in "**ggplot**" stands for "**G**rammar of **G**raphics," which is an elegant yet powerful way to describe the making of scientific plots. In short, the grammar of graphics breaks down every plot into a few components, namely, a dataset, a set of geoms (visual marks that represent the data points), and a coordinate system. You can imagine this is a grammar that gives unique names to each component appearing in a plot and conveys specific information about data. With **ggplot**, graphics are built step by step by adding new elements.

The idea of **mapping** is crucial in **ggplot**. One familiar example is to *map* the value of one variable in a dataset to $x$ and the other to $y$. However, we often encounter datasets that include multiple (more than two) variables. In this case, **ggplot** allows you to *map* those other variables to visual marks such as **color** and **shape** (**aesthetics** or `aes`). One thing you may want to remember is the difference between **discrete** and **continuous** variables. Some aesthetics, such as the shape of dots, do not accept continuous variables. If forced to do so, R will give an error. This is easy to understand; we cannot create a continuum of shapes for a variable, unlike, say, color.

**Tip:** when having doubts about whether a variable is [continuous or discrete](https://en.wikipedia.org/wiki/Continuous_or_discrete_variable), a quick way to check is to use the [`summary()`](https://www.geeksforgeeks.org/get-summary-of-results-produced-by-functions-in-r-programming-summary-function/) function. Continuous variables have descriptive statistics but not the discrete variables.

## Installing `tidyverse`

First, we need to install the `ggplot2` package.


```r
install.packages("ggplot2")
```

Now, let's load the `ggplot2` package:


```r
library(ggplot2)
```

We will also use some of the other tidyverse packages we used in the last episode, so we need to load them as well.


```r
library(readr)
library(dplyr)
```

```output

Attaching package: 'dplyr'
```

```output
The following objects are masked from 'package:stats':

    filter, lag
```

```output
The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union
```

As we can see from above output **`ggplot2`** has been already loaded along with other packages as part of the **`tidyverse`** framework.

## Loading the dataset


```r
variants <- read.csv("https://raw.githubusercontent.com/datacarpentry/genomics-r-intro/main/episodes/data/combined_tidy_vcf.csv")
```

Explore the *structure* (types of columns and number of rows) of the dataset using [dplyr](https://dplyr.tidyverse.org/index.html)'s [`glimpse()`](https://dplyr.tidyverse.org/reference/glimpse.html) (for more info, see the [Data Wrangling and Analyses with Tidyverse](https://datacarpentry.org/genomics-r-intro/05-dplyr/) episode)


```r
glimpse(variants) # Show a snapshot of the rows and columns
```

```output
Rows: 801
Columns: 29
$ sample_id     <chr> "SRR2584863", "SRR2584863", "SRR2584863", "SRR2584863", …
$ CHROM         <chr> "CP000819.1", "CP000819.1", "CP000819.1", "CP000819.1", …
$ POS           <int> 9972, 263235, 281923, 433359, 473901, 648692, 1331794, 1…
$ ID            <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
$ REF           <chr> "T", "G", "G", "CTTTTTTT", "CCGC", "C", "C", "G", "ACAGC…
$ ALT           <chr> "G", "T", "T", "CTTTTTTTT", "CCGCGC", "T", "A", "A", "AC…
$ QUAL          <dbl> 91.0000, 85.0000, 217.0000, 64.0000, 228.0000, 210.0000,…
$ FILTER        <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
$ INDEL         <lgl> FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TR…
$ IDV           <int> NA, NA, NA, 12, 9, NA, NA, NA, 2, 7, NA, NA, NA, NA, NA,…
$ IMF           <dbl> NA, NA, NA, 1.000000, 0.900000, NA, NA, NA, 0.666667, 1.…
$ DP            <int> 4, 6, 10, 12, 10, 10, 8, 11, 3, 7, 9, 20, 12, 19, 15, 10…
$ VDB           <dbl> 0.0257451, 0.0961330, 0.7740830, 0.4777040, 0.6595050, 0…
$ RPB           <dbl> NA, 1.000000, NA, NA, NA, NA, NA, NA, NA, NA, 0.900802, …
$ MQB           <dbl> NA, 1.0000000, NA, NA, NA, NA, NA, NA, NA, NA, 0.1501340…
$ BQB           <dbl> NA, 1.000000, NA, NA, NA, NA, NA, NA, NA, NA, 0.750668, …
$ MQSB          <dbl> NA, NA, 0.974597, 1.000000, 0.916482, 0.916482, 0.900802…
$ SGB           <dbl> -0.556411, -0.590765, -0.662043, -0.676189, -0.662043, -…
$ MQ0F          <dbl> 0.000000, 0.166667, 0.000000, 0.000000, 0.000000, 0.0000…
$ ICB           <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
$ HOB           <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
$ AC            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
$ AN            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
$ DP4           <chr> "0,0,0,4", "0,1,0,5", "0,0,4,5", "0,1,3,8", "1,0,2,7", "…
$ MQ            <int> 60, 33, 60, 60, 60, 60, 60, 60, 60, 60, 25, 60, 10, 60, …
$ Indiv         <chr> "/home/dcuser/dc_workshop/results/bam/SRR2584863.aligned…
$ gt_PL         <chr> "121,0", "112,0", "247,0", "91,0", "255,0", "240,0", "20…
$ gt_GT         <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
$ gt_GT_alleles <chr> "G", "T", "T", "CTTTTTTTT", "CCGCGC", "T", "A", "A", "AC…
```

Alternatively, we can display the first a few rows (vertically) of the table using [`head()`](https://www.geeksforgeeks.org/get-the-first-parts-of-a-data-set-in-r-programming-head-function/):


```r
head(variants)
```



|sample_id  |CHROM      |    POS|ID |REF      |ALT       | QUAL|FILTER |INDEL | IDV| IMF| DP|       VDB| RPB| MQB| BQB|     MQSB|       SGB|     MQ0F|ICB |HOB | AC| AN|DP4     | MQ|Indiv                                                              |gt_PL | gt_GT|gt_GT_alleles |
|:----------|:----------|------:|:--|:--------|:---------|----:|:------|:-----|---:|---:|--:|---------:|---:|---:|---:|--------:|---------:|--------:|:---|:---|--:|--:|:-------|--:|:------------------------------------------------------------------|:-----|-----:|:-------------|
|SRR2584863 |CP000819.1 |   9972|NA |T        |G         |   91|NA     |FALSE |  NA|  NA|  4| 0.0257451|  NA|  NA|  NA|       NA| -0.556411| 0.000000|NA  |NA  |  1|  1|0,0,0,4 | 60|/home/dcuser/dc_workshop/results/bam/SRR2584863.aligned.sorted.bam |121,0 |     1|G             |
|SRR2584863 |CP000819.1 | 263235|NA |G        |T         |   85|NA     |FALSE |  NA|  NA|  6| 0.0961330|   1|   1|   1|       NA| -0.590765| 0.166667|NA  |NA  |  1|  1|0,1,0,5 | 33|/home/dcuser/dc_workshop/results/bam/SRR2584863.aligned.sorted.bam |112,0 |     1|T             |
|SRR2584863 |CP000819.1 | 281923|NA |G        |T         |  217|NA     |FALSE |  NA|  NA| 10| 0.7740830|  NA|  NA|  NA| 0.974597| -0.662043| 0.000000|NA  |NA  |  1|  1|0,0,4,5 | 60|/home/dcuser/dc_workshop/results/bam/SRR2584863.aligned.sorted.bam |247,0 |     1|T             |
|SRR2584863 |CP000819.1 | 433359|NA |CTTTTTTT |CTTTTTTTT |   64|NA     |TRUE  |  12| 1.0| 12| 0.4777040|  NA|  NA|  NA| 1.000000| -0.676189| 0.000000|NA  |NA  |  1|  1|0,1,3,8 | 60|/home/dcuser/dc_workshop/results/bam/SRR2584863.aligned.sorted.bam |91,0  |     1|CTTTTTTTT     |
|SRR2584863 |CP000819.1 | 473901|NA |CCGC     |CCGCGC    |  228|NA     |TRUE  |   9| 0.9| 10| 0.6595050|  NA|  NA|  NA| 0.916482| -0.662043| 0.000000|NA  |NA  |  1|  1|1,0,2,7 | 60|/home/dcuser/dc_workshop/results/bam/SRR2584863.aligned.sorted.bam |255,0 |     1|CCGCGC        |
|SRR2584863 |CP000819.1 | 648692|NA |C        |T         |  210|NA     |FALSE |  NA|  NA| 10| 0.2680140|  NA|  NA|  NA| 0.916482| -0.670168| 0.000000|NA  |NA  |  1|  1|0,0,7,3 | 60|/home/dcuser/dc_workshop/results/bam/SRR2584863.aligned.sorted.bam |240,0 |     1|T             |

**`ggplot2`** functions like data in the **long** format, i.e., a column for every dimension (variable), and a row for every observation. Well-structured data will save you time when making figures with **`ggplot2`**

**`ggplot2`** graphics are built step-by-step by adding new elements. Adding layers in this fashion allows for extensive flexibility and customization of plots, and more equally important the readability of the code.

To build a ggplot, we will use the following basic template that can be used for different types of plots:


```r
ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) +  <GEOM_FUNCTION>()
```

- use the `ggplot()` function and bind the plot to a specific data frame using the
  `data` argument


```r
ggplot(data = variants)
```

- define a mapping (using the aesthetic (`aes`) function), by selecting the variables to be plotted and specifying how to present them in the graph, e.g. as x and y positions or characteristics such as size, shape, color, etc.


```r
ggplot(data = variants, aes(x = POS, y = DP))
```

- add 'geoms' – graphical representations of the data in the plot (points,
  lines, bars). **`ggplot2`** offers many different geoms; we will use some
  common ones today, including:
  - [`geom_point()`](https://ggplot2.tidyverse.org/reference/geom_point.html) for scatter plots, dot plots, etc.
  - [`geom_boxplot()`](https://ggplot2.tidyverse.org/reference/geom_boxplot.html) for, well, boxplots!
  - [`geom_line()`](https://ggplot2.tidyverse.org/reference/geom_path.html) for trend lines, time series, etc.

To add a geom to the plot use the `+` operator. Because we have two continuous variables, let's use [`geom_point()`](https://ggplot2.tidyverse.org/reference/geom_point.html) (i.e., a scatter plot) first:


```r
ggplot(data = variants, aes(x = POS, y = DP)) +
  geom_point()
```

<img src="fig/06-data-visualization-rendered-first-ggplot-1.png" style="display: block; margin: auto;" />

The `+` in the **`ggplot2`** package is particularly useful because it allows you to modify existing `ggplot` objects. This means you can easily set up plot templates and conveniently explore different types of plots, so the above plot can also be generated with code like this:


```r
# Assign plot to a variable
coverage_plot <- ggplot(data = variants, aes(x = POS, y = DP))

# Draw the plot
coverage_plot +
  geom_point()
```

**Notes**

- Anything you put in the [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) function can be seen by any geom layers that you add (i.e., these are universal plot settings). This includes the x- and y-axis mapping you set up in [`aes()`](https://ggplot2.tidyverse.org/reference/aes.html).
- You can also specify mappings for a given geom independently of the mappings defined globally in the [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) function.
- The `+` sign used to add new layers must be placed at the end of the line containing the *previous* layer. If, instead, the `+` sign is added at the beginning of the line containing the new layer, **`ggplot2`** will not add the new layer and will return an error message.


```r
# This is the correct syntax for adding layers
coverage_plot +
  geom_point()

# This will not add the new layer and will return an error message
coverage_plot
  + geom_point()
```

## Building your plots iteratively

Building plots with **`ggplot2`** is typically an iterative process. We start by defining the dataset we'll use, lay out the axes, and choose a geom:


```r
ggplot(data = variants, aes(x = POS, y = DP)) +
  geom_point()
```

<img src="fig/06-data-visualization-rendered-create-ggplot-object-1.png" style="display: block; margin: auto;" />

Then, we start modifying this plot to extract more information from it. For instance, we can add transparency (`alpha`) to avoid over-plotting:


```r
ggplot(data = variants, aes(x = POS, y = DP)) +
  geom_point(alpha = 0.5)
```

<img src="fig/06-data-visualization-rendered-adding-transparency-1.png" style="display: block; margin: auto;" />

We can also add colors for all the points:


```r
ggplot(data = variants, aes(x = POS, y = DP)) +
  geom_point(alpha = 0.5, color = "blue")
```

<img src="fig/06-data-visualization-rendered-adding-colors-1.png" style="display: block; margin: auto;" />

Or to color each species in the plot differently, you could use a vector as an input to the argument **color**. **`ggplot2`** will provide a different color corresponding to different values in the vector. Here is an example where we color with **`sample_id`**:


```r
ggplot(data = variants, aes(x = POS, y = DP, color = sample_id)) +
  geom_point(alpha = 0.5)
```

<img src="fig/06-data-visualization-rendered-color-by-sample-1-1.png" style="display: block; margin: auto;" />

Notice that we can change the geom layer and colors will be still determined by **`sample_id`**


```r
ggplot(data = variants, aes(x = POS, y = DP, color = sample_id)) +
  geom_line(alpha = 0.5)
```

<img src="fig/06-data-visualization-rendered-color-by-sample-2-1.png" style="display: block; margin: auto;" />

To make our plot more readable, we can add axis labels:


```r
ggplot(data = variants, aes(x = POS, y = DP, color = sample_id)) +
  geom_point(alpha = 0.5) +
  labs(x = "Base Pair Position",
       y = "Read Depth (DP)")
```

<img src="fig/06-data-visualization-rendered-add-axis-labels-1.png" style="display: block; margin: auto;" />

To add a *main* title to the plot, we use [the title argument for the `labs()` function](https://ggplot2.tidyverse.org/reference/labs.html):


```r
ggplot(data = variants, aes(x = POS, y = DP, color = sample_id)) +
  geom_point(alpha = 0.5) +
  labs(x = "Base Pair Position",
       y = "Read Depth (DP)",
       title = "Read Depth vs. Position")
```

<img src="fig/06-data-visualization-rendered-add-main-title-1.png" style="display: block; margin: auto;" />

Now the figure is complete and ready to be exported and saved to a file. This can be achieved easily using [`ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html), which can write, by default, the most recent generated figure into different formats (e.g., `jpeg`, `png`, `pdf`) according to the file extension. So, for example, to create a pdf version of the above figure with a dimension of $6\times4$ inches:


```r
ggsave ("depth.pdf", width = 6, height = 4)
```

If we check the *current working directory*, there should be a newly created file called `depth.pdf` with the above plot.

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

Use what you just learned to create a scatter plot of mapping quality (`MQ`) over
position (`POS`) with the samples showing in different colors. Make sure to give your plot
relevant axis labels.

:::::::::::::::  solution

## Solution


```r
 ggplot(data = variants, aes(x = POS, y = MQ, color = sample_id)) +
  geom_point() +
  labs(x = "Base Pair Position",
       y = "Mapping Quality (MQ)")
```

<img src="fig/06-data-visualization-rendered-scatter-challenge-1.png" style="display: block; margin: auto;" />

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

To further customize the plot, we can change the default font format:


```r
ggplot(data = variants, aes(x = POS, y = DP, color = sample_id)) +
  geom_point(alpha = 0.5) +
  labs(x = "Base Pair Position",
       y = "Read Depth (DP)",
       title = "Read Depth vs. Position") +
  theme(text = element_text(family = "Bookman"))
```

<img src="fig/06-data-visualization-rendered-change-font-family-1.png" style="display: block; margin: auto;" />

## Faceting

**`ggplot2`** has a special technique called *faceting* that allows the user to split one plot into multiple plots (panels) based on a factor (variable) included in the dataset. We will use it to split our mapping quality plot into three panels, one for each sample.


```r
ggplot(data = variants, aes(x = POS, y = MQ, color = sample_id)) +
 geom_point() +
 labs(x = "Base Pair Position",
      y = "Mapping Quality (MQ)") +
 facet_grid(~ sample_id)
```

<img src="fig/06-data-visualization-rendered-first-facet-1.png" style="display: block; margin: auto;" />

This looks okay, but it would be easier to read if the plot facets were stacked vertically rather than horizontally. The `facet_grid` geometry allows you to explicitly specify how you want your plots to be arranged via formula notation (`rows ~ columns`; the dot (`.`) indicates every other variable in the data i.e., no faceting on that side of the formula).


```r
ggplot(data = variants, aes(x = POS, y = MQ, color = sample_id)) +
 geom_point() +
 labs(x = "Base Pair Position",
      y = "Mapping Quality (MQ)") +
 facet_grid(sample_id ~ .)
```

<img src="fig/06-data-visualization-rendered-second-facet-1.png" style="display: block; margin: auto;" />

Usually plots with white background look more readable when printed.  We can set the background to white using the function [`theme_bw()`](https://ggplot2.tidyverse.org/reference/ggtheme.html). Additionally, you can remove the grid:


```r
ggplot(data = variants, aes(x = POS, y = MQ, color = sample_id)) +
  geom_point() +
  labs(x = "Base Pair Position",
       y = "Mapping Quality (MQ)") +
  facet_grid(sample_id ~ .) +
  theme_bw() +
  theme(panel.grid = element_blank())
```

<img src="fig/06-data-visualization-rendered-facet-plot-white-bg-1.png" style="display: block; margin: auto;" />

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

Use what you just learned to create a scatter plot of PHRED scaled quality (`QUAL`) over
position (`POS`) with the samples showing in different colors. Make sure to give your plot
relevant axis labels.

:::::::::::::::  solution

## Solution


```r
 ggplot(data = variants, aes(x = POS, y = QUAL, color = sample_id)) +
  geom_point() +
  labs(x = "Base Pair Position",
       y = "PHRED-sacled Quality (QUAL)") +
  facet_grid(sample_id ~ .)
```

<img src="fig/06-data-visualization-rendered-scatter-challenge-2-1.png" style="display: block; margin: auto;" />

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

## Barplots

We can create barplots using the [`geom_bar`](https://ggplot2.tidyverse.org/reference/geom_bar.html) geom. Let's make a barplot showing the number of variants for each sample that are indels.


```r
ggplot(data = variants, aes(x = INDEL, fill = sample_id)) +
  geom_bar() +
  facet_grid(sample_id ~ .)
```

<img src="fig/06-data-visualization-rendered-barplot-1.png" style="display: block; margin: auto;" />

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

Since we already have the sample\_id labels on the individual plot facets, we don't need the
legend. Use the help file for `geom_bar` and any other online resources you want to use to
remove the legend from the plot.

:::::::::::::::  solution

## Solution


```r
ggplot(data = variants, aes(x = INDEL, color = sample_id)) +
   geom_bar(show.legend = F) +
   facet_grid(sample_id ~ .)
```

<img src="fig/06-data-visualization-rendered-barplot-challenge-1.png" style="display: block; margin: auto;" />

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

## Density

We can create density plots using the [`geom_density`](https://ggplot2.tidyverse.org/reference/geom_density.html) geom that shows the distribution of of a variable in the dataset. Let's plot the distribution of `DP`


```r
ggplot(data = variants, aes(x = DP)) +
  geom_density()
```

<img src="fig/06-data-visualization-rendered-density-1.png" style="display: block; margin: auto;" />

This plot tells us that the most of frequent `DP` (read depth) for the variants is about 10 reads.

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

Use [`geom_density`](https://ggplot2.tidyverse.org/reference/geom_density.html) to plot the distribution of `DP` with a different fill for each sample. Use a white background for the plot.

:::::::::::::::  solution

## Solution


```r
ggplot(data = variants, aes(x = DP, fill = sample_id)) +
   geom_density(alpha = 0.5) +
   theme_bw()
```

<img src="fig/06-data-visualization-rendered-density-challenge-1.png" style="display: block; margin: auto;" />

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

## **`ggplot2`** themes

In addition to [`theme_bw()`](https://ggplot2.tidyverse.org/reference/ggtheme.html), which changes the plot background to white, **`ggplot2`** comes with several other themes which can be useful to quickly change the look of your visualization. The complete list of themes is available at [https://ggplot2.tidyverse.org/reference/ggtheme.html](https://ggplot2.tidyverse.org/reference/ggtheme.html). `theme_minimal()` and `theme_light()` are popular, and `theme_void()` can be useful as a starting point to create a new hand-crafted theme.

The [ggthemes](https://jrnold.github.io/ggthemes/reference/index.html) package provides a wide variety of options (including Microsoft Excel, [old](https://jrnold.github.io/ggthemes/reference/theme_excel.html) and [new](https://jrnold.github.io/ggthemes/reference/theme_excel_new.html)). The [**`ggplot2`** extensions website](https://exts.ggplot2.tidyverse.org/) provides a list of packages that extend the capabilities of **`ggplot2`**, including additional themes.

:::::::::::::::::::::::::::::::::::::::  challenge

## Challenge

With all of this information in hand, please take another five minutes to
either improve one of the plots generated in this exercise or create a
beautiful graph of your own. Use the RStudio [**`ggplot2`** cheat sheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf)
for inspiration. Here are some ideas:

- See if you can change the size or shape of the plotting symbol.
- Can you find a way to change the name of the legend? What about its labels?
- Try using a different color palette (see the [Cookbook for R](https://www.cookbook-r.com/Graphs/Colors_\(ggplot2\)/)).
  

::::::::::::::::::::::::::::::::::::::::::::::::::

## More **`ggplot2`** Plots

**`ggplot2`** offers many more informative and beautiful plots (`geoms`) of interest for biologists (although not covered in this lesson) that are worth exploring, such as

- [`geom_tile()`](https://ggplot2.tidyverse.org/reference/geom_tile.html), for heatmaps,
- [`geom_jitter()`](https://ggplot2.tidyverse.org/reference/geom_jitter.html), for strip charts, and
- [`geom_violin()`](https://ggplot2.tidyverse.org/reference/geom_violin.html), for violin plots

## Resources

- [ggplot2: Elegant Graphics for Data Analysis](https://www.amazon.com/gp/product/331924275X/) ([online version](https://ggplot2-book.org/))
- [The Grammar of Graphics (Statistics and Computing)](https://www.amazon.com/Grammar-Graphics-Statistics-Computing/dp/0387245448/)
- [Data Visualization: A Practical Introduction](https://www.amazon.com/gp/product/0691181624/) ([online version](https://socviz.co/))
- [The R Graph Gallery](https://r-graph-gallery.com/) ([the book](https://bookdown.org/content/b298e479-b1ab-49fa-b83d-a57c2b034d49/))

:::::::::::::::::::::::::::::::::::::::: keypoints

- ggplot2 is a powerful tool for high-quality plots
- ggplot2 provides a flexible and readable grammar to build plots

::::::::::::::::::::::::::::::::::::::::::::::::::


