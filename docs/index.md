--- 
title: "<span style='font-size: 2.5em'>Introduction to R</span>"
subtitle: "Course to Learn the Basics of **R**"
author: "[Claudio Zandonella Callegher](https://claudiozandonella.netlify.app/) and [Filippo Gambarota](https://filippogambarota.netlify.app/) (revision and translation into English by Enrico Toffalini), members of [Psicostat](https://psicostat.dpss.psy.unipd.it/) "
date: "26-09-2024"
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
---

# Presentation {-}



In this book we will learn the basics of **R**, one of the best programming language and software for statistical analysis and data visualization. We will start from scratch by understanding the fundamental aspects of R and the concepts behind each programming language that will allow you to later deepen and develop your skills in this beautiful world. 

## Why R {-}

There are many reasons to choose R over other programs used for conducting statistical analyses. First of all, it is a programming language (like Python, Java, C++, or Julia) and not simply a point-and-click interface (such as SPSS or JASP). This initially presents more challenges, but it will reward you in the future because you will have learned to use a very powerful tool.

Additionally, R is:

- designed for statistics
- free and open-source
- rich in packages
- supported by a large community
- still growing

## Contents {-}

The book is divided into four main sections:

- **Get started**. Once R and RStudio are installed, we will familiarize with the work environment introducing some general aspects and main functions. We will also describe some good rules for starting a workinng session in R.
- **Data structure**. We will learn the main objects used in R. Variables, vectors, matrices, data frames, and lists will no longer have secrets and we will understand how to manipulate and use them according to the various needs.
- **Algorithms**. Don't panic. You may have often heard of this as something very complicated, but in reality, algorithms are just a series of instructions that the computer follows when it has to perform a certain task. In this section we will see the main R commands used to define algorithms. This is the advantage of knowing a programming language, it allows us to create new programs that the computer will execute for us.
- **Case study**. We will perform a step-by-step analysis that will allow us to learn how to import data, encode variables, prepare the data for analysis, conduct descriptive analyses and create graphs.

At the end of this book you will probably not be hired by Google, but we hope at least that R does not scare you so much anymore and that maybe someone is interested in learning more about this fantastic world made of lines of code.


## Resources {-}

We point out here some further online material for the interested reader to deepen their knowledge of using R.

Introductory material:

- *R for Psychological Science* by Danielle Navarro https://psyr.djnavarro.net/index.html 
- *Hands-On Programming with R* by Garrett Grolemund https://rstudio-education.github.io/hopr/

Intermediate material:

- *R for Data Science* by Hadley Wickham and Garrett Grolemund https://r4ds.had.co.nz/

Advanced material:

- *R Packages* di Hadley Wickham e Jennifer Bryan https://r-pkgs.org/
- *Advanced R* di Hadley Wickham https://adv-r.hadley.nz/

## Psicostat {-}

This book was produced by [Claudio Zandonella Callegher](https://claudiozandonella.netlify.app/) and [Filippo Gambarota](https://filippogambarota.netlify.app/), and subsequently revised and translated into English by Enrico Toffalini, members of **Psicostat**, an interdisciplinary research group interested in Psychology and Statistics, our goal is to promote the connection between the two fields! If you want to know more about our activities visit our website https://psicostat.dpss.psy.unipd.it/ or add yourself to our mailing list https://lists.dpss.psy.unipd.it/postorius/lists.

## Contribute {-}

If you want to collaborate on the revision and writing of this book (of course, everything is in R), visit our GitHub repository: https://github.com/psicostat/Introduction2R.


## Acknowledgements {-}

The template of this book is based on [Rstudio Bookdown-demo](https://github.com/rstudio/bookdown-demo) released under [CC0-1.0 license](https://creativecommons.org/publicdomain/zero/1.0/) and [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) released under [CC BY license](https://creativecommons.org/licenses/by/2.0/). Note that the illustrations used belong to [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) and are under [CC BY-NC licensed](https://creativecommons.org/licenses/by-nc/2.0/).


## License {-}

This book is released under the Creative Commons Attribution-ShareAlike 4.0 International Public License ([CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/legalcode)).
The illustrations used belong to [rstudio4edu-book](https://rstudio4edu.github.io/rstudio4edu-book/) and are licensed under [CC BY-NC](https://creativecommons.org/licenses/by-nc/2.0/).

