---
title: "<span style='font-size: 2.5em'>Introduction to R</span>"
subtitle: "Course to Learn the Basics of **R**"
author: "by [Claudio Zandonella Callegher](https://claudiozandonella.netlify.app/) and [Filippo Gambarota](https://filippogambarota.netlify.app/) (revision and translation into English by **Enrico Toffalini**), members of [Psicostat](https://psicostat.dpss.psy.unipd.it/)"
date: "13-11-2024"
site: bookdown::bookdown_site
documentclass: book
link-citations: yes
github-repo: psicostat/Introduction2R_EN
description: "This is an introductory book on R produced by [Psicostat](https://psicostat.dpss.psy.unipd.it/), an interdisciplinary research group that combines a passion for statistics and psychology."
cover-image: "images/logo_psicostat.png"
header-includes: 
  - \usepackage{titlepic}
  - \titlepic{\includegraphics[width=\textwidth]{images/logo_psicostat.pdf}}
url: 'https\://psicostat.github.io/Introduction2R_EN/'
output: bookdown::gitbook
favicon: "images/faviconpsicostat2.ico"
---

# Presentation of the Book {.unnumbered}



In this book we will learn the basics of **R**, one of the best programming language and software for statistical analysis and data visualization. We will start from scratch by understanding the fundamental aspects of R and the concepts behind each programming language that will allow you to later deepen and develop your skills in this beautiful world.

- Related GitHub repository at <a href="https://github.com/psicostat/Introduction2R_EN" target="_blank">https://github.com/psicostat/Introduction2R_EN</a>

- Original Italian version at <a href="https://psicostat.github.io/Introduction2R/" target="_blank">https://psicostat.github.io/Introduction2R/</a>

#### Why R {.unnumbered}

There are many reasons to choose R over other programs used for conducting statistical analyses. First of all, it is a programming language (like Python, Java, C++, or Julia) and not simply a point-and-click interface (such as SPSS or JASP). This initially presents more challenges, but it will reward you in the future because you will have learned to use a very powerful tool.

Additionally, R is:

-   designed for statistics
-   free and open-source
-   rich in packages
-   supported by a large community
-   still growing

#### Contents {.unnumbered}

The book is currently divided into four main sections:

- **Getting Started**. Once R and RStudio are installed, we will familiarize with the work environment introducing some general aspects and main functions. We will also describe some good rules for starting a working session in R.
- **Data Structures** (*vectors*, *factors*, *matrices*, *dataframes*, *lists*). We will learn the main objects used in R. The most common data structures will no longer have secrets and we will understand how to manipulate and use them according to the various needs.
- **Algorithms** (e.g., *functions*, *if...else*, *loops*). Don't panic. You may have often heard of this as something very complicated, but in reality, algorithms are just a series of instructions that the computer follows when it has to perform a certain task. In this section we will see the main R commands used to define algorithms. After all, writing algorithms is the real advantage of knowing a programming language!
- **Advanced Topics**. This section is currently under development. At present, it includes only a single chapter on managing and manipulating *strings*. Additional chapters will be added in the future.

At the end of this book you will probably not be hired by Google, but we hope at least that R does not scare you so much anymore and that maybe someone is interested in learning more about this fantastic world made of lines of code.

#### Resources {.unnumbered}

We point out here some further online material for the interested reader to deepen their knowledge of using R.

Introductory material:

-   *R for Psychological Science* by Danielle Navarro <https://psyr.djnavarro.net/index.html>
-   *Hands-On Programming with R* by Garrett Grolemund <https://rstudio-education.github.io/hopr/>

Intermediate material:

-   *R for Data Science* by Hadley Wickham and Garrett Grolemund <https://r4ds.had.co.nz/>

Advanced material:

-   *R Packages* di Hadley Wickham e Jennifer Bryan <https://r-pkgs.org/>
-   *Advanced R* di Hadley Wickham <https://adv-r.hadley.nz/>

#### Psicostat {.unnumbered}

This book was produced by [Claudio Zandonella Callegher](https://claudiozandonella.netlify.app/) and [Filippo Gambarota](https://filippogambarota.netlify.app/), and subsequently revised and translated into English by Enrico Toffalini, members of **Psicostat**, an interdisciplinary research group interested in Psychology and Statistics, our goal is to promote the connection between the two fields! If you want to know more about our activities visit our website <https://psicostat.dpss.psy.unipd.it/> or add yourself to our mailing list <https://lists.dpss.psy.unipd.it/postorius/lists/psicostat.lists.dpss.psy.unipd.it/>.

#### Contribute {.unnumbered}

If you want to collaborate on the revision and writing of this book (of course, everything is in R), visit our GitHub repository: <https://github.com/psicostat/Introduction2R>.

#### Acknowledgements {.unnumbered}

The template of this book is based on [Rstudio Bookdown-demo](https://github.com/rstudio/bookdown-demo) released under [CC0-1.0 license](https://creativecommons.org/publicdomain/zero/1.0/) and [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) released under [CC BY license](https://creativecommons.org/licenses/by/2.0/). Note that the illustrations used belong to [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) and are under [CC BY-NC licensed](https://creativecommons.org/licenses/by-nc/2.0/).

#### License {.unnumbered}

This book is released under the Creative Commons Attribution-ShareAlike 4.0 International Public License ([CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/legalcode)). The illustrations used belong to [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) and are licensed under [CC BY-NC](https://creativecommons.org/licenses/by-nc/2.0/).
